package les.ejc

class AniversarioJob {
     static triggers = {
		cron name: 'aniversarioTrigger', cronExpression: "0 5 0 * * ?"
	}

	def senderService

    def execute() {
		def usuarios = Usuario.list()
		Calendar data = new GregorianCalendar()
		for (int i in 0..<usuarios.size()) {
			Calendar dataUsuario = usuarios[i].dataDeNascimento
			Calendar dataUsuario2 = usuarios[i].dataDeNascimento2
			if ( dataUsuario?.get(Calendar.DAY_OF_MONTH) == data.get(Calendar.DAY_OF_MONTH) && dataUsuario?.get(Calendar.MONTH) == data.get(Calendar.MONTH) ) {
				String mensagem = """Parabens, ${usuarios[i].nomeCompleto}!
O EJC da Paroquia de Sao Cristovao o(a) felicita por mais um ano de vida.
Deus o(a) abencoe cada vez mais.
Abracos!
"""
				senderService.enviaEmail(usuarios[i].email, "Feliz Aniversario", mensagem)
			}
			if ( dataUsuario2?.get(Calendar.DAY_OF_MONTH) == data.get(Calendar.DAY_OF_MONTH) && dataUsuario2?.get(Calendar.MONTH) == data.get(Calendar.MONTH) ) {
				String mensagem = """Parabens, ${usuarios[i].nomeCompleto2}!
O EJC da Paroquia de Sao Cristovao o(a) felicita por mais um ano de vida.
Deus o(a) abencoe cada vez mais.
Abracos!
"""
				senderService.enviaEmail(usuarios[i].email2, "Feliz Aniversario", mensagem)
			}
		}
    }
}
