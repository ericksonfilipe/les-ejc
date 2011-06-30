package ejc

class Noticia {

	String descricao
	boolean noticiaPrincipal
	
    static constraints = {
		descricao(nullable:false, blank:false, maxSize:1000)
	}

	String toString() {
		return "${descricao}"
	}
	
}