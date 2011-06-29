package ejc

class Evento {

	Date data
	String nome
	String local
	String descricao
	
    static constraints = {
		data()
		nome(nullable:false, blank:false, maxSize: 100)
		descricao(nullable:false, blank:false, maxSize:2000)
		local(nullable:false, blank:false, maxSize: 50)	
	}

	String toString() {
		return "${nome}"
	}
	
}