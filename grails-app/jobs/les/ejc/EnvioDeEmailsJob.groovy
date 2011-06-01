package les.ejc

class EnvioDeEmailsJob {
     static triggers = {
		cron name: 'aniversarioTrigger', cronExpression: "0 19 18 * * ?"
	}

	def senderService

    def execute() {
		aniversarios()
		avisaEventos()
    }
	

	def aniversarios() {
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
	
	
	def avisaEventos() {
		def usuarios = Usuario.list()
		def eventos = Evento.list()
		
		List eventosParaAvisar = []
		println "oeeeeeeee"
		println eventos.size() 
		for (int e in 0..<eventos.size()) {
			println "aqui1"
			Calendar dataEvento = eventos[e].data
			if ( saoDoisDiasAntesDaData(dataEvento) ) {
				eventosParaAvisar.add(eventos[e])
				println ("aqui2")
			}
		}
		println ("aqui3")
		Calendar data = new GregorianCalendar()
		for (int e in 0..<eventosParaAvisar.size()) {
			for (int u in 0..<usuarios.size()) {
				String mensagem = """Ola, ${usuarios[u].nomeUsual}!
O EJC da Paroquia de Sao Cristovao convida voce a participar do ${eventos[e].nome}, no dia ${eventos[e].data}.
${eventos[e].descricao}

Contamos com sua presença.
Abracos!
"""
				senderService.enviaEmail(usuarios[u].email, "[EJC Sao Cristovao] ${eventos[e].nome}", mensagem)
			}

		}
		println("evento")
		
	}

	def saoDoisDiasAntesDaData(Calendar data) {
		Calendar dataDeHoje = new GregorianCalendar() ////Ajeitar
		println ("Calendar.DAY_OF_MONTH-2 = " + (Calendar.DAY_OF_MONTH-2))
		return (dataDeHoje?.get(Calendar.DAY_OF_MONTH) == data.get(Calendar.DAY_OF_MONTH-2) && dataDeHoje?.get(Calendar.MONTH) == data.get(Calendar.MONTH) && dataDeHoje?.get(Calendar.YEAR) == data.get(Calendar.YEAR))
	}
	
	
}
