package les.ejc

class AvisoRelembrandoEventoJob {
     static triggers = {
		cron name: 'avisoRelembrandoEventoTrigger', cronExpression: "0 5 0 * * ?"
	}

	def senderService

	//executar 48h antes do evento ser realizado
	//TODO
    def execute() {
		def usuarios = Usuario.list()
		Calendar data = new GregorianCalendar()
		for (int i in 0..<usuarios.size()) {
			Calendar dataUsuario = usuarios[i].dataDeNascimento
			Calendar dataUsuario2 = usuarios[i].dataDeNascimento2
			if ( dataUsuario?.get(Calendar.DAY_OF_MONTH) == data.get(Calendar.DAY_OF_MONTH) && dataUsuario?.get(Calendar.MONTH) == data.get(Calendar.MONTH) ) {
				String mensagem = """Olá, ${usuarios[i].nomeCompleto}!
Gostaríamos de lembrar do {nome do evento} que será realizado dia {dia do evento}.
Sua presença é importante para nós.
Até lá!
"""
				senderService.enviaEmail(usuarios[i].email, "[EJC São Cristóvão] {nome do evento}", mensagem)
			}

		}
    }
}
