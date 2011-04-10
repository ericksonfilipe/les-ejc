package les.ejc

class UsuarioVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testListaUsuarios(){
		get("http://localhost:8080/les-ejc/usuario/list");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testIndexUsuarios(){
		get("http://localhost:8080/les-ejc/usuario/index");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}