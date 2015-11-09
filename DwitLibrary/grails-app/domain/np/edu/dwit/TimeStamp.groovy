package np.edu.dwit

class TimeStamp {

    Date deadline
    Role role

    static constraints = {

        deadline min: new Date(), nullable: false
        role nullable: false
    }

    static mapping = {

        version false
    }
}
