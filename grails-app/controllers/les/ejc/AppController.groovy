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
		def usuario = Usuario.findByLoginAndSenha(params.login, new String(params.senha.encodeAsMD5Hex()))
		if (usuario) {
			session.user = usuario
			flash.message = "Olá, ${usuario.nomeCompleto}!"
			render(view:'../index')
		} else {
			flash.message = "O login e senha digitados são incorretos."
			redirect(action:"login")
		}
	}
	
	def visitante = {
		render(view:'../index')
	}

	def logout = {
		flash.message = "Usuário ${session.user.nomeCompleto} desconectado!"
		session.user = null
		redirect(controller:"app", action:"login")
	}
    
	def esqueciminhasenha = {
	}

	def trocarsenha = {
        }
        
        def trocarminhasenha = {
            def usuario = Usuario.findByLoginAndSenha(params.login, new String(params.senha.encodeAsMD5Hex()))
            
            if (params.senhanova1 != params.senhanova2) {
                flash.message = "Campos de nova senha não são iguais."
                redirect(action: "index")
            }
           
            else if (usuario) {
                usuario.setSenha(new String(params.senhanova1.encodeAsMD5Hex()))
                usuario.save()
                flash.message = "Senha atualizada com sucesso"
                redirect(action: "index")
            }
            else {
                flash.message = "Campos senha ou login inválido."
                redirect(action: "index")
            }

        }
        
        
        def enviarSenhaPorEmail = {
		String email = params.email
		def usuario  = Usuario.findByEmail(email)
		if (usuario) {
			Random random = new Random()
                        String orig = (1..10).collect { random.nextInt(9) }.join()
                        String origmd5 = orig.encodeAsMD5Hex()
                        usuario.setSenha(origmd5)
                        usuario.save()
                        String mensagem = "Você pediu para recuperar sua senha\n\nlogin: ${usuario.login}\nsenha: ${orig}\nAconselhamos mudar sua senha.\nAbraços"

                        senderService.enviaEmail(usuario.email,"Recuperação de Senha - Paróquia de São Cristóvão", mensagem)
                        flash.message = "Foi enviada uma nova senha para ${params.email}."
			redirect(action:"login")
		}
		else {
			flash.message = "Desculpe, ${params.email} não encontrado."
			redirect(action:"login")
		}

	}

}
