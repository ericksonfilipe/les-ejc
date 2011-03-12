package les.ejc

class SenderService {

    static transactional = false

	def mailService

    def enviaEmail(emailDestinatario, assunto, mensagem) {
		mailService.sendMail {
			to emailDestinatario
			subject assunto
			body "${mensagem}\n---\nAtenciosamente,\nFamilia EJC"
		}
    }
}
