package les.ejc

class EncontroMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
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
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/create");
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
		
		get("http://localhost:8080/les-ejc/encontro/index");
		click "1"
		assertTitle("Mostrar Encontro")
		assertContentContains("Manaus")
	}
	
	void testEditarEncontro() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/index");
		click "1"
		assertTitle("Mostrar Encontro")
		assertContentContains("Manaus")
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
		
		get("http://localhost:8080/les-ejc/encontro/index");
		click "1"
		assertTitle("Mostrar Encontro")
		assertContentContains("Manaus")
		form() {
			click "Excluir"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}