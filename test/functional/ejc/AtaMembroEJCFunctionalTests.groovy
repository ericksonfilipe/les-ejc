package ejc

class AtaMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {

	private String defaultLocation =  "http://localhost:8080/ejc/app/login"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/ejc/ata/index");
		assertContentContains "Login"
		assertContentContains "Senha"
		assertContentContains "Login"
		assertContentContains "Esqueci Minha Senha!" 
	}
	
	void testCriarAta() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/ejc/ata/create");
		assertContentContains "Login"
		assertContentContains "Senha"
		assertContentContains "Login"
		assertContentContains "Esqueci Minha Senha!" 
	}
}
