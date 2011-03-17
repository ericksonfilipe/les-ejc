package les.ejc

class AppController {

	def login = {}

	def authenticate = {
		def usuario = Usuario.findByLoginAndSenha(params.login, params.senha)
		if (usuario) {
			session.user = usuario
			flash.message = "Hello ${usuario.nomeCompleto}!"
			redirect(controller:"usuario", action:"index")
		} else {
			flash.message = "Sorry, ${params.login}. Please try again."
			redirect(action:"login")
		}
	}

	def logout = {
		flash.message = "Goodbye ${session.user.nomeCompleto}"
		session.user = null
		redirect(controller:"app", action:"login")
	}
}
