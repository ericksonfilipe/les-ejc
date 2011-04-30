package les.ejc

class CirculoMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/index");
		assertTitle("Lista de Circulo")
		assertContentContains("Lista de Circulo")
	}
	
	void testCriarCirculo() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/create");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testVisualizarCirculo() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/index");
		click "1"
		assertTitle("Mostrar Circulo")
		assertContentContains("Azul")
	}
	
	void testEditarCirculo() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/index");
		click "1"
		assertTitle("Mostrar Circulo")
		assertContentContains("Azul")
		form() {
			click "Editar"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testExcluirCirculo() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/index");
		click "1"
		assertTitle("Mostrar Circulo")
		assertContentContains("Azul")
		form() {
			click "Excluir"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}