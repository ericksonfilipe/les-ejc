package les.ejc

class AtaMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/ata/index");
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
		
		get("http://localhost:8080/les-ejc/ata/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}