package les.ejc

class Enquete {

    String titulo
	String descricao
	boolean fechada = false
	List usuariosQueVotaram = []
	
	static hasMany = [opcoes:OpcaoEnquete]
	
	static constraints = {
		titulo(nullable:false, blank:false, maxSize: 100)
		descricao(nullable:true, blank:true)
	}
	
	public void fecharEnquete() {
		fechado = true;
	}
	
	public boolean usuarioJaVotou(Long id) {
		for (i in usuariosQueVotaram) {
			if (i == id) {
				return true
			}
		}
		return false
	}
	
	public void usuarioVotou(Long id) {
		usuariosQueVotaram.add(id);
	}
	
	String toString() {
		return "${titulo}";
	}
}
