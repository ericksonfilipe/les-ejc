package ejc

class AvisoDeEvento {
     static triggers = {
		cron name: 'avisoDeEventoTrigger', cronExpression: "0 51 17 * * ?"
	}

	def senderService

	def saoDoisDiasAntesDaData(Calendar data) {
		Calendar dataDeHoje = new GregorianCalendar()
		return (dataDeHoje?.get(Calendar.DAY_OF_MONTH) == data.get(Calendar.DAY_OF_MONTH-2) && dataDeHoje?.get(Calendar.MONTH) == data.get(Calendar.MONTH) && dataDeHoje?.get(Calendar.YEAR) == data.get(Calendar.YEAR))
	}
	
	def execute() {
		print "oeeeeeeee"
		def usuarios = Usuario.list()
		def eventos = Evento.list()
		
		List eventosParaAvisar = []
		for (int e in 0..<eventos.size()) {
			Calendar dataEvento = eventos[i].data
			if ( saoDoisDiasAntesDaData(dataEvento) ) {
				eventosParaAvisar.add(eventos[e])
				print (eventos[e].nome)
			}
		}
		
		Calendar data = new GregorianCalendar()
		for (int e in 0..<eventosParaAvisar.size()) {
			for (int u in 0..<usuarios.size()) {
				String mensagem = """Ola, ${usuarios[u].nomeUsual}!
O EJC da Paroquia de Sao Cristovao convida voce a participar do ${eventos[e].nome}, no dia ${eventos[e].data}.
${eventos[e].descricao}

Contamos com sua presen�a.
Abracos!
"""
				//senderService.enviaEmail(usuarios[u].email, "[EJC Sao Cristovao] ${eventos[e].nome}", mensagem)
				print (mensagem)
			}

		}
		
	}
    
}
