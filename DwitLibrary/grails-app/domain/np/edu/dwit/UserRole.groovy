package np.edu.dwit

import grails.gorm.DetachedCriteria
import groovy.transform.ToString
import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache=true, includeNames=true, includePackage=false)
class UserRole implements Serializable {

	private static final long serialVersionUID = 1

	np.edu.dwit.User user
	Role role

	UserRole(np.edu.dwit.User u, Role r) {
//		this()
		user = u
		role = r
	}

	@Override
	boolean equals(other) {
		if (!(other instanceof UserRole)) {
			return false
		}

		other.user?.id == user?.id && other.role?.id == role?.id
	}

	@Override
	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static UserRole get(long userId, long roleId) {
		criteriaFor(userId, roleId).get()
	}

	static boolean exists(long userId, long roleId) {
		criteriaFor(userId, roleId).count()
	}

	private static DetachedCriteria criteriaFor(long userId, long roleId) {
		UserRole.where {
			user == np.edu.dwit.User.load(userId) &&
			role == Role.load(roleId)
		}
	}

	static UserRole create(np.edu.dwit.User user, Role role, boolean flush = false) {
		def instance = new UserRole(user, role)
		instance.save(flush: flush, insert: true, failOnError: true)
		instance
	}

	static boolean remove(np.edu.dwit.User u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = UserRole.where { user == u && role == r }.deleteAll()

		if (flush) { UserRole.withSession { it.flush() } }

		rowCount
	}

	static void removeAll(np.edu.dwit.User u, boolean flush = false) {
		if (u == null) return

		UserRole.where { user == u }.deleteAll()

		if (flush) { UserRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		UserRole.where { role == r }.deleteAll()

		if (flush) { UserRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, UserRole ur ->
			if (ur.user == null || ur.user.id == null) return
			boolean existing = false
			UserRole.withNewSession {
				existing = UserRole.exists(ur.user.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['user', 'role']
		version false
	}
}
