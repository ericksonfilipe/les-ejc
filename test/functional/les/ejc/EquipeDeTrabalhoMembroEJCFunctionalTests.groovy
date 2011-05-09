package les.ejc

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
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
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
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("J5")
		form() {
			click "Editar"
		}
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testExcluirEquipeDeTrabalho() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("J5")
		form() {
			click "Excluir"
		}
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}