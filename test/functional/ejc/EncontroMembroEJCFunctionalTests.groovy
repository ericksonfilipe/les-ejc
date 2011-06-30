package ejc

class EncontroMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/index");
		assertTitle("Lista de Encontro")
		assertContentContains("Lista de Encontro")
	}
	
	void testCriarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testVisualizarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/index");
		click "1"
		assertTitle("Mostrar Encontro")
		assertContentContains("Manaus")
	}
	
	void testEditarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/index");
		click "1"
		assertTitle("Mostrar Encontro")
		assertContentContains("Manaus")
		get("http://localhost:8080/les-ejc/encontro/edit/1");
		assertContentContains "Permissão Negada"
	}
}
