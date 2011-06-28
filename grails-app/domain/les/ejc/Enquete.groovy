package les.ejc

class Enquete {

    String titulo
	String descricao
	boolean fechada = false
	List<Long> usuariosQueVotaram = new ArrayList<Long>()
	
	static hasMany = [opcoes:OpcaoEnquete]
	
	static constraints = {
		titulo(nullable:false, blank:false, maxSize: 100)
		descricao(nullable:true, blank:true)
	}
	
	public void fecharEnquete() {
		fechado = true;
	}
	
	public boolean usuarioJaVotou(Long id) {
		println usuariosQueVotaram
		for (i in usuariosQueVotaram) {
			print "AKE: "
			println i
			if (i == id) {
				return true
			}
		}
		return false
	}
	
	public void usuarioVotou(Long id) {
		usuariosQueVotaram.add(id);
		print "--> "
		println usuariosQueVotaram
	}
	
	String toString() {
		return "${titulo}";
	}
}
