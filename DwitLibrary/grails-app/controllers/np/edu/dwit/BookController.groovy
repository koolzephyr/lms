package np.edu.dwit

import constants.DWITLibraryConstants
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import java.sql.Timestamp

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_LIBRARIAN'])

@Transactional(readOnly = true)
class BookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def bookService
    def fineService
    def report() {

        def booksWithBorrowCount = bookService.booksWithBorrowCount
        [booksWithBorrowCount: booksWithBorrowCount]
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Book.list(params), model: [bookInstanceCount: Book.count()]
    }

    def show(Book bookInstance) {
        respond bookInstance
    }

    def create() {
        respond new Book(params)
    }

    @Transactional
    def save(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view: 'create'
            return
        }

        bookInstance.availableQuantity=bookInstance.totalQuantity
        bookInstance.save flush: true

        redirect(controller:'book', action:'index')
        /*request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bookInstance.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: CREATED] }
        }*/
    }

    def edit(Book bookInstance) {
        respond bookInstance
    }

    @Transactional
    def update(Book bookInstance) {
        if (bookInstance == null) {
            notFound()
            return
        }

        if (bookInstance.hasErrors()) {
            respond bookInstance.errors, view: 'edit'
            return
        }

        bookInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect bookInstance
            }
            '*' { respond bookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Book bookInstance) {

        if (bookInstance == null) {
            notFound()
            return
        }

        bookInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Book.label', default: 'Book'), bookInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookInstance.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }


    @Secured("ROLE_LIBRARIAN")
    @Transactional
    def beforeIssue() {
        def borrowingUser = User.findByUsername(params.borrowingUsername);

        if(borrowingUser){
            def c = Borrow.createCriteria()

            def borrowCount = c.count {
                eq("member", borrowingUser)
                eq("returned", false)

            }
            def role = borrowingUser.getAuthorities().toString().substring(6,9);
            def book = Book.findById(Long.valueOf(params.bookId).longValue())

            Borrow borrow = new Borrow();
            borrow.book = book
            borrow.borrowedDate=new Timestamp(new Date().getTime())
            borrow.returned=false
            borrow.member=borrowingUser

            if(role.equals("FAC")){
                if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_FACULTY) {
                    render "greaterborrowcount"
                }else {
                    borrow.save(flush: true)
                    render "issue"
                }
            }else if(role.equals("LIB")){
                if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_LIBRARIAN) {
                    render "greaterborrowcount"
                }else {

                    borrow.save(flush: true)
                    render "issue"
                }
            }

            else if(role.equals("ADM")){
                if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_ADMIN) {
                    render "greaterborrowcount"
                }else {
                    borrow.save(flush: true)
                    render "issue"
                }
            }else if(role.equals("STU")){
                if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_STUDENT) {
                    render "greaterborrowcount"
                }else {
                    borrow.save(flush: true)
                    render "issue"
                }
            }
            else {
                render "error"
            }

        }
    }

    @Secured("ROLE_LIBRARIAN")
    def returnBook() {

    }
    @Secured("ROLE_LIBRARIAN")
    def issueBook() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render(view: "issueBook",model:[userInstanceList: User.list(params), userInstanceTotal: User.count()])
    }

    def getAllUsers() {
        def users = User.list()
        def response = []

        users.each {
            response << "${it.fullName}"
        }
        render response as JSON
    }

    def checkValidBookType() {
        def bookTypeResult = BookInfo.findByBookNumber(params.bookNumber);

        def book = bookTypeResult.book


        if(book){
            if(book.bookType.equalsIgnoreCase("Reference")){
                render "reference"
            }
            if(book.bookType.equalsIgnoreCase("Gifted")){
                render "gifted"
            }
            if(book.bookType.equalsIgnoreCase("Borrowable")){
                render "borrowable"
            }
            if(book.bookType.equalsIgnoreCase("novel")){
                render "novel"
            }
        }
    }

    @Transactional
    def saveIssue() {
        def borrowingUser = Member.findByFullName(params.memberName)

        if(borrowingUser){
            def c = Borrow.createCriteria()

            def borrowCount = c.count{
                eq("member", borrowingUser)
                eq("returned", false)

            }

            println("ic:"+borrowCount)
            def role = borrowingUser.getAuthorities()[0].toString();
            def borrowingBook = BookInfo.findByBookNumber(params.bookNumber)
            def book = borrowingBook.book


            if(borrowCount>0){
                //to not let already issued book,again reissuing mistakely,
                // 261 already issued, so not letting it to reissue

                def isAlreadyBorrowed = Borrow.findByBookAndReturned(book,false)

                if(isAlreadyBorrowed.returned){
                    Borrow borrow = new Borrow();
                    borrow.book = book
                    borrow.borrowedDate=new Timestamp(new Date().getTime())
                    borrow.returned=false
                    borrow.member=borrowingUser

                    if(role.equals("ROLE_FACULTY")){
                        if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_FACULTY) {
                            render "greaterborrowcount"
                        }else {
                            borrow.save(flush: true)

                            book.availableQuantity-=1
                            book.save(flush: true)
                            render "issue"
                        }
                    }else if(role.equals("ROLE_LIBRARY")){
                        if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_LIBRARIAN) {
                            render "greaterborrowcount"
                        }else {

                            borrow.save(flush: true)

                            book.availableQuantity-=1
                            book.save(flush: true)
                            render "issue"
                        }
                    }

                    else if(role.equals("ROLE_ADMIN")){
                        if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_ADMIN) {
                            render "greaterborrowcount"
                        }else {
                            borrow.save(flush: true)

                            book.availableQuantity-=1
                            book.save(flush: true)
                            render "issue"
                        }
                    }else if(role.equals("ROLE_STUDENT")){
                        if(borrowCount>=DWITLibraryConstants.LIMIT_BOOK_BORROWABLE_STUDENT) {
                            render "greaterborrowcount"
                        }else {
                            borrow.save(flush: true)

                            book.availableQuantity-=1
                            book.save(flush: true)
                            render "issue"
                        }
                    }
                }else{
                    render "error"
                }

            }else {
                //if member had not borrowed book yet it will come here
                Borrow borrow = new Borrow();
                borrow.book = book
                borrow.borrowedDate=new Timestamp(new Date().getTime())
                borrow.returned=false
                borrow.member=borrowingUser
                borrow.save(flush: true)

                book.availableQuantity-=1
                book.save(flush: true)

                render "issue"
            }
        }
    }
    @Transactional
    def checkBorrowedMember(){

        def borrowingBook = BookInfo.findByBookNumber(params.bookNumber)
        def book = borrowingBook.book
        def borrowedMember = Borrow.createCriteria().list {
            and{
                eq("book",book)
                eq("returned",false)
            }

        }


        fineService.calculatefine(borrowedMember);
        def borrowInfo = Borrow.createCriteria().list {
            and{
                eq("book",book)
                eq("member",borrowedMember[0].member)
                eq("returned",false)
            }
        }
def amount
        def fineAmt = Fine.findByBorrow(borrowInfo[0])

        if(fineAmt) {
            amount = fineAmt.fineAmount
        }else {
            amount = 0
        }
        render borrowedMember[0].member.fullName +":"+amount
    }
    @Transactional
    def saveReturn() {

        def borrowingUser = Member.findByFullName(params.memberName)
        def borrowedBook = BookInfo.findByBookNumber(params.bookNumber)
        def book = borrowedBook.book
        def borrow = Borrow.findByBookAndMemberAndReturned(book,borrowingUser,false)


        if(borrowingUser){

            borrow.member = borrowingUser
            borrow.book=book
            borrow.returned = true
            borrow.returnedDate=new Timestamp(new Date().getTime())
            borrow.save(flush: true)

            book.availableQuantity +=1;
            book.save()

            render "success"

        }

    }
}
