package ejc

class Noticia {

	String descricao
	boolean noticiaPrincipal
	
    static constraints = {
		descricao(nullable:false, blank:false, maxSize:1000)
		//noticiaPrincipal(validator: {ehNoticiaPrincipal, noticia -> if (ehNoticiaPrincipal == true && existeOutraNoticiaPrincipal()) 
		//												return ["Ja teeeem!!"]
		//												else return true})
	}

	String toString() {
		return "${descricao}"
	}
	
	/*def existeOutraNoticiaPrincipal(){
		for (n in Noticia.list()) {
			if (n.noticiaPrincipal == true && n != this) return true
		}
		return false
	}*/	
	
}