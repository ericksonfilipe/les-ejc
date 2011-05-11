package les.ejc

class CirculoJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/circulo/create"
	
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
	
	void testNomeCirculoVazio() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		get("http://localhost:8080/les-ejc/circulo/show/1");
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
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/circulo/show/1");
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
