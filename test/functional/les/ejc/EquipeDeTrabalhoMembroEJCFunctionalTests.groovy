package les.ejc

class EquipeDeTrabalhoMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		assertTitle("Lista de EquipeDeTrabalho")
		assertContentContains("Lista de EquipeDeTrabalho")
	}
	
	void testCriarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/create");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testVisualizarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("J5")
	}
	
	void testEditarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("J5")
		form() {
			click "Editar"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testExcluirEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("J5")
		form() {
			click "Excluir"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}