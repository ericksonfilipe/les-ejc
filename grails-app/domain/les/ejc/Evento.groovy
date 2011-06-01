package les.ejc

class Evento {

	Date data
	String nome
	String local
	String horario
	String descricao
	
    static constraints = {
		data()
		nome(nullable:false, blank:false, maxSize: 100)
		descricao(nullable:false, blank:false, maxSize:2000)
		horario(nullable:false, blank:false)
		local(nullable:false, blank:false, maxSize: 50)	
	}

	String toString() {
		return "${nome}"
	}
	
}