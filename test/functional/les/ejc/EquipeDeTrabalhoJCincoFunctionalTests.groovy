package les.ejc

class EquipeDeTrabalhoJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/equipeDeTrabalho/create"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle "Criar EquipeDeTrabalho"
		assertContentContains "Criar EquipeDeTrabalho"
	}
	
	void testListaEquipesDeTrabalho(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/list");
		assertContentContains "Lista de EquipeDeTrabalho"
	}
	
	void testEditarEquipeDeTrabalho() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "1"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("J5")
		form() {
			click "Editar"
		}
		assertTitle("Edit EquipeDeTrabalho")
		form() {
			click "Alterar"
		}
		assertContentContains("alterado")
	}
	
	
	
	void testCriaEExcluirEquipeDeTrabalho() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			click "Criar" //criando uma equipe para nao ter problema com outros testes
		}
		assertContentContains("criado")
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "2"
		assertTitle("Mostrar EquipeDeTrabalho")
		assertContentContains("COORDENACAO_GERAL")
		form() {
			click "Excluir"
		}
		assertContentContains("excluido")
		

	}
}