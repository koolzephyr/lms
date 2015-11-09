package np.edu.dwit

class Borrow {

    Book book
    Date borrowedDate = new Date()
    Boolean returned = false
    Member member
    Date returnedDate

    static constraints = {

        book nullable: false
        borrowedDate nullable: false
        member nullable: false
        returnedDate nullable: true
    }

    static mapping = {

        version false
    }
}
