package ejc

class LoginTagLib {
	def loginControl = {
		if (session.user) {
			out << "${link(action:"logout", controller:"app"){"Logout"}}"
		} else {
			out << "${link(action:"login", controller:"app"){"login"}}"
		}
	}
}
