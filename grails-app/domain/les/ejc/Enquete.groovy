package les.ejc

class Enquete {

    String titulo
	boolean fechada = false
	
	static hasMany = [opcoes:OpcaoEnquete]
	
	static constraints = {
		titulo(nullable:false, blank:false, maxSize: 100)
	}
	
	public void fecharEnquete() {
		fechado = true;
	}
	
	String toString() {
		return "${titulo}";
	}
}
