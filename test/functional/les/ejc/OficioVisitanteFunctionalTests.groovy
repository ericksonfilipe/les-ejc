package les.ejc

class OficioVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/oficio/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testListaOficio(){
		get("http://localhost:8080/les-ejc/oficio/list");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testIndexOficio(){
		get("http://localhost:8080/les-ejc/oficio/index");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}