package les.ejc

class Evento {

	Calendar data
	String local
	String horario
	String descricao
	
    static constraints = {
		data()
		descricao(nullable:false, blank:false, maxSize:2000)
		horario(nullable:false, blank:false)
		local(nullable:false, blank:false, maxSize: 50)	
	}

	String toString() {
		return "Evento do dia: ${data}"
	}
	
}