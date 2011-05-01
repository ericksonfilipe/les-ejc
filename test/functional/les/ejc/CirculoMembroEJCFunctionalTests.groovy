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
		assertContentContains "Permiss"
		assertContentContains "o Negada"
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
		assertContentContains "Permiss"
		assertContentContains "o Negada"
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
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}