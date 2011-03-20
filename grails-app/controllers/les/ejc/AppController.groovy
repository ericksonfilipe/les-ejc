package les.ejc

class AppController {

        def senderService

        def index = {
		if (session.user) {
			render(view:'../index')
		} else {
			redirect(action:"login")
		}
	}

	def login = {
	}

	def authenticate = {
		def usuario = Usuario.findByLoginAndSenha(params.login, params.senha)
		if (usuario) {
			session.user = usuario
			flash.message = "Ola ${usuario.nomeCompleto}!"
			render(view:'../index')
		} else {
			flash.message = "O login e senha digitados sao incorretos."
			redirect(action:"login")
		}
	}
	
	def visitante = {
		render(view:'../index')
	}

	def logout = {
		flash.message = "Usuario ${session.user.nomeCompleto} desconectado!"
		session.user = null
		redirect(controller:"app", action:"login")
	}
    
	def esqueciminhasenha = {
	}

	def enviarSenhaPorEmail = {
		String email = params.email
		def usuario  = Usuario.findByEmail(email)
		if (usuario) {
			Random random = new Random()
                        String orig = (1..10).collect { random.nextInt(9) }.join()
                        usuario.setSenha(orig)
                        usuario.save()
                        String mensagem = "Você pediu para recuperar sua senha\n\nlogin: ${usuario.login}\nsenha: ${usuario.senha}\nAconselhamos mudar sua senha.\nAbraços"

                        senderService.enviaEmail(usuario.email,"Recuperação de Senha - Sistema do EJC - Paróquia de São Cristóvão", mensagem)
                        flash.message = "Foi enviado uma nova senha para ${params.email}."
			redirect(action:"login")
		}
		else {
			flash.message = "Desculpe, ${params.email} nao encontrado."
			redirect(action:"login")
		}

	}

}
