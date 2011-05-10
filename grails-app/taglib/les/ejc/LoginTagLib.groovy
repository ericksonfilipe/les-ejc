package les.ejc

class LoginTagLib {
	def loginControl = {
		if (session.user) {
			out << "[${link(action:"logout", controller:"app"){"Logout"}}]"
		}
	}
}
