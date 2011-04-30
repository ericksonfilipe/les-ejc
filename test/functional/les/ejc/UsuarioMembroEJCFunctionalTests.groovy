package les.ejc

class UsuarioMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/index");
		assertTitle("Lista de Usuario")
		assertContentContains("Lista de Usuario")
	}
	
	void testCriarUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/create");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testVisualizarUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/index");
		click "1"
		assertTitle("Mostrar Usuario")
		assertContentContains("admin@plecas.com")
	}
	
	void testEditarUsuarioDiferente() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/index");
		click "1"
		assertTitle("Mostrar Usuario")
		assertContentContains("admin@plecas.com")
		form() {
			click "Editar"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testEditarProprioUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/index");
		click "2"
		assertTitle("Mostrar Usuario")
		assertContentContains("andre@plecas.com")
		form() {
			click "Editar"
		}
		assertTitle("Edit Usuario")
		assertContentContains("Edit Usuario")
		form() {
			nomeCompleto = "Andre Farias"
			click "Alterar"
		}
		assertContentContains "alterado"
	}
	
	void testExcluirUsuarioDiferente() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/index");
		click "1"
		assertTitle("Mostrar Usuario")
		assertContentContains("admin@plecas.com")
		form() {
			click "Excluir"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
	
	void testExcluirProprioUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/index");
		click "2"
		assertTitle("Mostrar Usuario")
		assertContentContains("andre@plecas.com")
		form() {
			click "Excluir"
		}
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}