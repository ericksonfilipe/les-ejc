package les.ejc

class EquipeDeTrabalhoJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/equipeDeTrabalho/create"
	
	void testListaEquipesDeTrabalho(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/list");
		assertContentContains "Lista de EquipeDeTrabalho"
	}
	
	void testEditarEquipeDeTrabalho() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123" 
                        click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/index");
		click "2"
		assertTitle("Mostrar Equipe de Trabalho")
		assertContentContains("J5")
		form() {
			click "Editar"
		}
		assertTitle("Edit Equipe de Trabalho")
		form() {
			click "Alterar"
		}
		assertContentContains("alterado")
	}
	
	
	//Esse teste não deve ser mais considerado, pois as equipes serão pré-definidas!
	/*
	void testCriaEExcluirEquipeDeTrabalho() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
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
	*/
}
