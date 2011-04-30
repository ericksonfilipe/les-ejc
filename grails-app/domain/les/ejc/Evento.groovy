package les.ejc

class Evento {

	Calendar data
	String local
	String horario
	String descricao
	
    static constraints = {
		data()
		descricao(nullable:false, blank:false, maxSize:2000)
		horario(nullable:false, blank:false, maxSize:5, matches:'[0-2][0-9]\\:[0-6][0-9]')
		//TODO fazer retricao de horario ser num intervalo de 0-24
		local(nullable:false, blank:false, maxSize: 50)	
	}

	String toString() {
		return "Evento do dia: ${data}"
	}
	
}