package ejc

class NovaCriacaoUsuarioFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"

	void testAdicionarEnderecoSoAposCriacaoBasicaDeUsuario(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		get(this.defaultLocation);
		//nao aparece endereco
		form() {
			nomeCompleto = "Nome da Silva"
			click "Criar"
		}
		assertContentContains "Adicionar Endereco"
	}
	
	void testEnderecoSempreFiliadoAUsuario(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//criar endereco pra usuario Andre
		get("http://localhost:8080/les-ejc/endereco/create?usuario.id=2");
		form() {
			rua = "rua"
			bairro = "bairro"
			cidade = "cg"
			click "Criar"
		}
		assertContentContains "criado"
		assertContentContains "Voltar para o Usuario: Andre"
	}
	
	void testUnicoEnderecoParaUsuario(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//criar endereco pra usuario Andre
		get("http://localhost:8080/les-ejc/endereco/create?usuario.id=2");
		form() {
			rua = "rua"
			bairro = "bairro"
			cidade = "cg"
			click "Criar"
		}
		
		get("http://localhost:8080/les-ejc/usuario/show/2")
		assertContentContains "Rua: rua - numero: 0. bairro - cg/PB"
		//nao tem opcao adicionar endereco
		
	}

	

}
