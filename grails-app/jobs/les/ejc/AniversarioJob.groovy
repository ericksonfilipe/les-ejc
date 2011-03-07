package les.ejc

class AniversarioJob {
     static triggers = {
		cron name: 'aniversarioTrigger', cronExpression: "0 54 11 * * ?"
	}

	def senderService

    def execute() {
		def usuarios = Usuario.list()
		Date data = new Date()
		for (int i in 0..<usuarios.size()) {
			if ( usuarios[i]?.dataDeNascimento?.day == data.day && usuarios[i]?.dataDeNascimento?.month == data.month ) {
				String mensagem = """A Equipe EJC deseja muita felicidade nesse dia tao especial!
Parabens ${usuarios[i].nome}!!

Atenciosamente,
Todos nos. :D
"""
				senderService.enviaEmail(usuarios[i].email, "Feliz Aniversario", mensagem)
			}
		}
    }
}
