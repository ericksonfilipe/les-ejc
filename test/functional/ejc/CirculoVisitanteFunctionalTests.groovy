package ejc

class CirculoVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/ejc/circulo/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertContentContains "Login"
		assertContentContains "Senha"
	}
}