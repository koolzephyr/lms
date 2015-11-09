import np.edu.dwit.User
import np.edu.dwit.Member
import np.edu.dwit.Role
import np.edu.dwit.UserRole


class BootStrap {

    def init = { servletContext ->
       /* Member admin = new Member(username:'admin',password:'admin',enabled:true).save(failOnError: true)
        Member faculty = new Member(username:'faculty',password:'faculty',enabled: true).save(failOnError: true)
        Member student = new Member(username:'student',password:'student',enabled: true).save(failOnError: true)
        Member librarian = new Member(username:'l',password:'l',enabled: true).save(failOnError: true)

        Role role_admin = new Role(authority: 'ROLE_ADMIN').save()
        Role role_faculty = new Role(authority: 'ROLE_FACULTY').save()
        Role role_student = new Role(authority: 'ROLE_STUDENT').save()
        Role role_librarian = new Role(authority: 'ROLE_LIBRARIAN').save()

        UserRole.create(admin,role_admin)
        UserRole.create(faculty,role_faculty)
        UserRole.create(student,role_student)
        UserRole.create(librarian,role_librarian)*/

    }
    def destroy = {
    }
}
