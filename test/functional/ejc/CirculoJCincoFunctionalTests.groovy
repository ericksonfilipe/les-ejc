package ejc

class CirculoJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/ejc/circulo/create"
	
	void testNomeCirculoVazio() {
		get("http://localhost:8080/ejc/app/login");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		get("http://localhost:8080/ejc/circulo/show/1");
                form() {
                        click "Editar"
                }
                form() {
                    nomeCirculo = ""
                    click "Alterar"
                }
		assertContentContains "O campo [nomeCirculo] nao pode ficar em branco"
	}
	
	void testNomeCirculoInvalido(){
		get("http://localhost:8080/ejc/app/login");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/ejc/circulo/show/1");
                form() {
                        click "Editar"
                }
                form() {
                    nomeCirculo = "qu4lqu3r c0154"
                    click "Alterar"
                }
		assertContentContains "O campo [nomeCirculo] nao atende ao padrao definido"
	}

}
