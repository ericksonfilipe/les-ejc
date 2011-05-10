package les.ejc

class EncontroVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/encontro/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testListaEncontros(){
		get("http://localhost:8080/les-ejc/encontro/list");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testIndexEncontros(){
		get("http://localhost:8080/les-ejc/encontro/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}