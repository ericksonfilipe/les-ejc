package les.ejc

class CirculoVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/circulo/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testListaCirculos(){
		get("http://localhost:8080/les-ejc/circulo/list");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testIndexCirculos(){
		get("http://localhost:8080/les-ejc/circulo/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}