package ejc

class EquipeDeTrabalhoMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		assertTitle("Lista de EquipeDeTrabalho")
		assertContentContains("Lista de EquipeDeTrabalho")
	}
	
	void testCriarEquipeDeTrabalho() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testVisualizarEquipeDeTrabalho() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "2"
		assertTitle("Mostrar Equipe de Trabalho")
		assertContentContains("J5")
	}
	
	void testEditarEquipeDeTrabalho() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "2"
		assertTitle("Mostrar Equipe de Trabalho")
		assertContentContains("J5")
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/edit/2");
                assertContentContains "Permissão Negada"
	}
}
