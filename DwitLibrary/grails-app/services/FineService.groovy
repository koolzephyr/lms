import constants.DWITLibraryConstants
import np.edu.dwit.Borrow
import np.edu.dwit.Fine
import np.edu.dwit.Member

/**
 * Created by zephyr on 11/5/15.
 */
class FineService {
    def calculateTotalDays(Date bDate){

        def rDate = new Date()
        return rDate-bDate
    }

    def calculatefine(Borrow borrow){
        Fine fine = new Fine()

        def member = borrow.member
        def book = borrow.book
        def bDate = borrow.borrowedDate

        def tDays=calculateTotalDays(bDate)

        if(member.getAuthorities()[0].toString().equals("ROLE_STUDENT")){
            if(book.bookType.equals("Borrowable")){
                fine.days=tDays - DWITLibraryConstants.COURSE_BOOK_BORROWABLE_STUDENT
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_STUDENT
                }
            }
            else if (book.bookType.equals("Novel")){
                fine.days=tDays - DWITLibraryConstants.NOVEL_BOOK_BORROWABLE
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_STUDENT
                }
            }
        }

        if(member.getAuthorities()[0].toString().equals("ROLE_FACULTY")){
            if(book.bookType.equals("Borrowable")){
                fine.days=tDays - DWITLibraryConstants.COURSE_BOOK_BORROWABLE_FACULTY
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_FACULTY
                }
            }
            else if (book.bookType.equals("Novel")){
                fine.days=tDays - DWITLibraryConstants.NOVEL_BOOK_BORROWABLE
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_FACULTY
                }
            }
        }

        if(member.getAuthorities()[0].toString().equals("ROLE_ADMIN")){
            if(book.bookType.equals("Borrowable")){
                fine.days=tDays - DWITLibraryConstants.COURSE_BOOK_BORROWABLE_ADMIN
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_ADMIN
                }
            }
            else if (book.bookType.equals("Novel")){
                fine.days=tDays - DWITLibraryConstants.NOVEL_BOOK_BORROWABLE
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_ADMIN
                }
            }
        }

        if(member.getAuthorities()[0].toString().equals("ROLE_LIBRARIAN")){
            if(book.bookType.equals("Borrowable")){
                fine.days=50 - DWITLibraryConstants.COURSE_BOOK_BORROWABLE_LIBRARIAN
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_LIBRARIAN
                }
            }
            else if (book.bookType.equals("Novel")){
                fine.days=tDays - DWITLibraryConstants.NOVEL_BOOK_BORROWABLE
                if(fine.days>0){
                    fine.fineAmount=fine.days * DWITLibraryConstants.FINE_AMT_LIBRARIAN
                }
            }
        }

        fine.borrow=borrow
        fine.member=borrow.member
//        fine.save(flush: true)

        return fine
    }

    def recalculatefine(Borrow borrow,int days){
        Fine fine = new Fine()

        def member = borrow.member
        def book = borrow.book
        def bDate = borrow.borrowedDate

        def tDays=calculateTotalDays(bDate)

        if(member.getAuthorities()[0].toString().equals("ROLE_STUDENT")){
            if(book.bookType.equals("Borrowable")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_STUDENT
                }
            }
            else if (book.bookType.equals("Novel")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_STUDENT
                }
            }
        }

        if(member.getAuthorities()[0].toString().equals("ROLE_FACULTY")){
            if(book.bookType.equals("Borrowable")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_FACULTY
                }
            }
            else if (book.bookType.equals("Novel")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_FACULTY
                }
            }
        }

        if(member.getAuthorities()[0].toString().equals("ROLE_ADMIN")){
            if(book.bookType.equals("Borrowable")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_ADMIN
                }
            }
            else if (book.bookType.equals("Novel")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_ADMIN
                }
            }
        }

        if(member.getAuthorities()[0].toString().equals("ROLE_LIBRARIAN")){
            if(book.bookType.equals("Borrowable")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_LIBRARIAN
                }
            }
            else if (book.bookType.equals("Novel")){
                if(days>0){
                    fine.fineAmount=days * DWITLibraryConstants.FINE_AMT_LIBRARIAN
                }
            }
        }

        fine.borrow=borrow
        fine.member=borrow.member

        return fine
    }


}