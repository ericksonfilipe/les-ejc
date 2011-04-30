package les.ejc

class EncontroJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/encontro/create"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle "Criar Encontro"
		assertContentContains "Criar Encontro"
	}
	
	void testListaEncontros(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/list");
		assertContentContains "Lista de Encontro"
	}
	
	void testLocalNulo(){
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
		assertContentContains "O campo [local] nao pode ficar em branco"
	}
	
	void testLocalVazio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			local = ""
			click "Criar"
		}
		assertContentContains "O campo [local] nao pode ficar em branco"
	}

	void testTemaNulo(){
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
		assertContentContains "O campo [tema] nao pode ficar em branco"
	}
	
	void testTemaVazio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			tema = ""
			click "Criar"
		}
		assertContentContains "O campo [tema] nao pode ficar em branco"
	}

	void testTemaInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			tema = "qu4lqu3r c0154"
			click "Criar"
		}
		assertContentContains "O campo [tema] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

}