package les.ejc

class LoginTagLib {
	def loginControl = {
		if (session.user) {
			out << "Hello ${session.user.name} "
			out << """[${link(action:"logout", controller:"usuario"){"Logout"}}]"""
		} else {
			out << """[${link(action:"login", controller:"usuario"){"Login"}}]"""      
		}
	}
}
