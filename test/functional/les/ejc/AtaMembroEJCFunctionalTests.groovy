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
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testCriarAta() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/ata/create");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}