package ejc

class SenderService {

    static transactional = false

	def mailService

    def enviaEmail(emailDestinatario, assunto, mensagem) {
		mailService.sendMail {
			to emailDestinatario
			from "ejcsaocristovao@gmail.com"
			subject assunto
			body "${mensagem}\n---\nAtenciosamente,\nFamilia EJC"
		}
    }
}
