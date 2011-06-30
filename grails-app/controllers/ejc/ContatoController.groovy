package ejc

import java.util.regex.Pattern;

class ContatoController {

	def senderService

    def index = {}

	def contatenos = {
		if (params.mensagem == null || params.email == null || params.mensagem == "" || params.email == "") {
			flash.message = "Você precisa preencher os campos abaixo!"
			redirect(controller: "contato", action:"index")
		} else if (params.mensagem.size() < 15) {
			flash.message = "A mensagem precisa ter pelo menos 15 caracteres!"
			redirect(controller: "contato", action:"index")
		} else if (!params.email.matches("([a-zA-Z])+([0-9a-zA-Z])*@([a-zA-Z])+\\.([a-zA-Z])+")) {
			flash.message = "Email invalido!"
			redirect(controller: "contato", action:"index")
		} else {
			def mensagem = "\r\nde: " + params.email + "\r\n\r\n" + params.mensagem + "\r\n\r\nMensagem enviada a partir do Sistema de Gerenciamento do EJC da par�quia de S�o crist�v�o!"
			Usuario.list().each{ u -> 
				if (u.j5Atual) {
					senderService.enviaEmail(u.email, '[Sistema EJC] Mensagem', mensagem)
				}
			}
			redirect(controller: "app", action:"index")
		}
	}
}
