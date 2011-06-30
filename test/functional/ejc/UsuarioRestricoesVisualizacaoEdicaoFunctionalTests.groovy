package ejc

class UsuarioRestricoesVisualizacaoEdicaoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"

	void testUsuarioAdminEditandoOutroUsuarioConsegueVisualizarCamposComoStatusTipoEObservacao() {
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
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
		assertContentContains "Status"
		assertContentContains "Tipo"
		assertContentContains "Observa"
	}

	void testLogadoComoUsuarioNaoJ5EditarProprioUsuario() {
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
		assertContentDoesNotContain("Status")
		assertContentDoesNotContain("Tipo")
		assertContentDoesNotContain("Observa")
	}

	void testLogadoComoUsuarioNaoJ5TentarRemoverUsuarioNaoEhPossivel() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/listCasal");
		click "3"
		assertTitle("Mostrar Usuario")
		assertContentContains("casal@plecas.com")
		assertContentDoesNotContain("Excluir")
	}
}
