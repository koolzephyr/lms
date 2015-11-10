package np.edu.dwit

class TimeStamp {

    String deadline
    Borrow borrow

    static constraints = {

        deadline  nullable: false
        borrow nullable: false
    }

    static mapping = {

        version false
    }
}
