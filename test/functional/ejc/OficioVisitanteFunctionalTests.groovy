package les.ejc

class OficioVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/oficio/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testListaOficio(){
		get("http://localhost:8080/les-ejc/oficio/list");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testIndexOficio(){
		get("http://localhost:8080/les-ejc/oficio/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}