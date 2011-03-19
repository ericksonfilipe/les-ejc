package les.ejc

class LoginTagLib {
	def loginControl = {
		if (session.user) {
			out << "Hello ${session.user.nomeCompleto} "
			out << """[${link(action:"logout", controller:"app"){"usuario: ${session.user.nomeCompleto}   Logout"}}]"""
		} else {
			out << """[${link(action:"login", controller:"app"){"Login"}}]"""      
		}
	}
}
