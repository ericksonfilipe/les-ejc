package les.ejc

class CirculoJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/circulo/create"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle "Criar Circulo"
		assertContentContains "Criar Circulo"
	}
	
	void testListaCirculos(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/list");
		assertContentContains "Lista de Circulo"
	}
	
	void testNomeCirculoNulo(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			click "Criar"
		}
		assertContentContains "O campo [nomeCirculo] nao pode ficar em branco"
	}
	
	void testNomeCirculoVazio() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCirculo = ""
			click "Criar"
		}
		assertContentContains "O campo [nomeCirculo] nao pode ficar em branco"
	}
	
	void testNomeCirculoInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCirculo = "qu4lqu3r c0154"
			click "Criar"
		}
		assertContentContains "O campo [nomeCirculo] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

}