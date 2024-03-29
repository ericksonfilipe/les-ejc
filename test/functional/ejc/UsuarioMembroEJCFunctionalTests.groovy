package ejc

class UsuarioMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testCriarUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testVisualizarUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/listJovem");
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
		
		get("http://localhost:8080/les-ejc/usuario/listJovem");
		click "1"
		assertTitle("Mostrar Usuario")
		assertContentContains("admin@plecas.com")
		get("http://localhost:8080/les-ejc/usuario/edit/1");
                assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	
	void testEditarProprioUsuario() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/listPadre");
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
}