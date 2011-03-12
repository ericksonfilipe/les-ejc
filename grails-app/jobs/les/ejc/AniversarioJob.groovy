package les.ejc

class AniversarioJob {
     static triggers = {
		cron name: 'aniversarioTrigger', cronExpression: "0 49 10 * * ?"
	}

	def senderService

    def execute() {
		def usuarios = Usuario.list()
		Date data = new Date()
		for (int i in 0..<usuarios.size()) {
			if ( usuarios[i]?.dataDeNascimento?.day == data.day && usuarios[i]?.dataDeNascimento?.month == data.month ) {
				String mensagem = """Parabens, ${usuarios[i].nome}!
O EJC da Paroquia de Sao Cristovao o(a) felicita por mais um ano de vida.
Deus o(a) abencoe cada vez mais.
Abracos!
"""
				println("enviar email diario de aniversario...")
				senderService.enviaEmail(usuarios[i].email, "Feliz Aniversario", mensagem)
				println("envio para ${usuarios[i].nome} ok!")
			}
		}
    }
}
