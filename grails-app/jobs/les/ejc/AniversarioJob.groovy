package les.ejc

class AniversarioJob {
     static triggers = {
		cron name: 'aniversarioTrigger', cronExpression: "0 50 16 * * ?"
	}

	def senderService

    def execute() {
		def usuarios = Usuario.list()
		Date data = new Date()
		for (int i in 0..<usuarios.size()) {
			if ( usuarios[i]?.dataDeNascimento?.day == data.day && usuarios[i]?.dataDeNascimento?.month == data.month ) {
				String mensagem = """Parabéns, ${usuarios[i].nome}!
O EJC da Paróquia de São Cristóvão o(a) felicita por mais um ano de vida.
Deus o(a) abençoe cada vez mais.
Abraços!”

Atenciosamente,
Família EJC :D
"""
				println("plecas")
				senderService.enviaEmail(usuarios[i].email, "Feliz Aniversario", mensagem)
			}
		}
    }
}
