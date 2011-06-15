package les.ejc

class Noticia {

	String descricao
	
    static constraints = {
		descricao(nullable:false, blank:false, maxSize:1000)
	}

	String toString() {
		return "${descricao}"
	}
	
}