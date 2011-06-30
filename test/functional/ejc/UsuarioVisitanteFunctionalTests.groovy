package ejc

class UsuarioVisitanteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testListaUsuarios(){
		get("http://localhost:8080/les-ejc/usuario/list");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testIndexUsuarios(){
		get("http://localhost:8080/les-ejc/usuario/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}