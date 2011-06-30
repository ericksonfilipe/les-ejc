package ejc

class CirculoMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/ejc/app/login"
	
	void testCriarCirculo() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/ejc/circulo/create");
		assertContentContains "Login"
		assertContentContains "Senha"
	}
	
	
}
