package ejc

class Reflexao {

	String texto
	
    static constraints = {
		texto(nullable:false, blank:false, maxSize:600)
	}

	String toString() {
		return "${texto}"
	}
	
}