package les.ejc

class EventoVisitanteEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/evento/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testCriarAta() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/evento/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}