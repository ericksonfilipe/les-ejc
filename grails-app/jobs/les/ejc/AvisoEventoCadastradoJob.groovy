package les.ejc

class AvisoEventoCadastradoJob {
     static triggers = {
		cron name: 'avisoEventoCadastradoTrigger', cronExpression: "0 5 0 * * ?"
	}

	def senderService

	//executar depois de 24h de um evento ser criado, podendo ter sido modificado nesse tempo
	//TODO
    def execute() {
		def usuarios = Usuario.list()
		Calendar data = new GregorianCalendar()
		for (int i in 0..<usuarios.size()) {
			Calendar dataUsuario = usuarios[i].dataDeNascimento
			Calendar dataUsuario2 = usuarios[i].dataDeNascimento2
			if ( dataUsuario?.get(Calendar.DAY_OF_MONTH) == data.get(Calendar.DAY_OF_MONTH) && dataUsuario?.get(Calendar.MONTH) == data.get(Calendar.MONTH) ) {
				String mensagem = """Olá, ${usuarios[i].nomeCompleto}!
O EJC da Paroquia de Sao Cristovao convida você a participar do {nome do evento}, no dia {dia do evento}.
Contamos com sua presença.
Abracos!
"""
				senderService.enviaEmail(usuarios[i].email, "[EJC São Cristóvão] {nome do evento}", mensagem)
			}

		}
    }
}
