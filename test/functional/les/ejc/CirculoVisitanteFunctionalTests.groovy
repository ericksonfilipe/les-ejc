package les.ejc

class CirculoVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/circulo/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testListaCirculos(){
		get("http://localhost:8080/les-ejc/circulo/list");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testIndexCirculos(){
		get("http://localhost:8080/les-ejc/circulo/index");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}