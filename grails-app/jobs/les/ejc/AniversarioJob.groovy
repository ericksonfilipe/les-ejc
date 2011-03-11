package les.ejc

class AniversarioJob {
     static triggers = {
		cron name: 'aniversarioTrigger', cronExpression: "0 41 17 * * ?"
	}

	def senderService

    def execute() {
		def usuarios = Usuario.list()
		Date data = new Date()
		for (int i in 0..<usuarios.size()) {
			if ( usuarios[i]?.dataDeNascimento?.day == data.day && usuarios[i]?.dataDeNascimento?.month == data.month ) {
				String mensagem = """Parab�ns, ${usuarios[i].nome}!
O EJC da Par�quia de S�o Crist�v�o o(a) felicita por mais um ano de vida.
Deus o(a) aben�oe cada vez mais.
Abra�os!�

Atenciosamente,
Fam�lia EJC :D
"""
				println("plecas")
				senderService.enviaEmail(usuarios[i].email, "Feliz Aniversario", mensagem)
			}
		}
    }
}
