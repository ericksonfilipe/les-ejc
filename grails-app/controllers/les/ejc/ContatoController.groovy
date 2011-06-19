package les.ejc

class ContatoController {

	def senderService

    def index = {}

	def contatenos = {
		if (params.mensagem == null || params.email == null || params.mensagem == "" || params.email == "") {
			flash.message = "Você precisa preencher os campos abaixo!"
			redirect(controller: "contato", action:"index")
		} else {
			def mensagem = "\r\nde: " + params.email + "\r\n\r\n" + params.mensagem + "\r\nMensagem enviada a partir do Sistema de Gerenciamento do EJC da paróquia de São cristóvão!"
			Usuario.list().each{ u -> 
				if (u.j5Atual) {
					senderService.enviaEmail(u.email, '[Sistema EJC] Mensagem', mensagem)
				}
			}
			redirect(controller: "app", action:"index")
		}
	}
}
