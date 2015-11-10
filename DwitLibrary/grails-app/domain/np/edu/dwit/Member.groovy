package np.edu.dwit

class Member extends User {
    String email
    String contact
    String status  //Developers: Why status???????
    String firstName
    String middleName
    String lastName
    String userId

    static constraints = {
        username nullable: true, blank: true
        password nullable: false, blank: false
        email nullable: false, blank: false, email:true
        contact nullable: false, blank: false
        status nullable: true, blank: true
        firstName nullable: false,blank: false
        lastName nullable:false,blank:false
        middleName nullable:true, blank:true
        userId nullable:false, blank:false, unique: true

    }

    Member(String username, String password) {
        super(username, password)
    }
}
