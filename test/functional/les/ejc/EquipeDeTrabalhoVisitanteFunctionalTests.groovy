package les.ejc

class EquipeDeTrabalhoVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/equipeDeTrabalho/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testListaEquipes(){
		get("http://localhost:8080/les-ejc/circulo/list");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testIndexEquipes(){
		get("http://localhost:8080/les-ejc/circulo/index");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}