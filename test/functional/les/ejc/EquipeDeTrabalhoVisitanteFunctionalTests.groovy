package les.ejc

class EquipeDeTrabalhoVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/equipeDeTrabalho/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testListaEquipes(){
		get("http://localhost:8080/les-ejc/circulo/list");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testIndexEquipes(){
		get("http://localhost:8080/les-ejc/circulo/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}