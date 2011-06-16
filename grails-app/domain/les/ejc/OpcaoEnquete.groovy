package les.ejc

class OpcaoEnquete {
	
	String opcao
	int votos = 0
	
	static belongsTo = [ enquete : Enquete ]
	
    static constraints = {
    }
	
	public void computarVotos() {
		votos++;
	}
	
	String toString() {
		return "${opcao}";
	}
}