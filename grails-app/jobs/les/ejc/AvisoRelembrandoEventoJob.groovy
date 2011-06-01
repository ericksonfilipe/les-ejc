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
				String mensagem = """Ol�, ${usuarios[i].nomeCompleto}!
Gostar�amos de lembrar do {nome do evento} que ser� realizado dia {dia do evento}.
Sua presen�a � importante para n�s.
At� l�!
"""
				senderService.enviaEmail(usuarios[i].email, "[EJC S�o Crist�v�o] {nome do evento}", mensagem)
			}

		}
    }
}
