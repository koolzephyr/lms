package np.edu.dwit

class Member extends User {
    String email
    String contact
    String status  //Developers: Why status???????
    String fullName
    String userId

    static constraints = {
        username nullable: true, blank: true
        password nullable: false, blank: false
        email nullable: false, blank: false, email:true
        contact nullable: false, blank: false
        status nullable: true, blank: true
        fullName nullable: false,blank: false
        userId nullable:false, blank:false, unique: true

    }

    Member(String username, String password) {
        super(username, password)
    }
}
