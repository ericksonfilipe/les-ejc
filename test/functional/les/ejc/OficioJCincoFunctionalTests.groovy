package les.ejc

class OficioJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/oficio/create"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle("Criar Oficio")
		assertContentContains("Criar Oficio")
	}
	
	void testListaOficio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/oficio/list");
		assertContentContains "Lista de Oficio"
	}
	
	void testCadastroValido() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeDestinatario = "Silvio Santos"
			cargoDestinatario = "Dono"
			empresaDestinatario = "SBT"
			nomeRemetente = "Jantere Babosa"
			estadoCivilRemetente = "Solteiro(a)"
			profissaoRemetente = "Computeiro"
			enderecoRemetente = "Muito Longe"
			solicitacao = "1 telesena"
			objetivoSolicitacao = "testar a sorte"
			local = "Campina Grande"
			data = new Date()
			click "Criar"
		}
		assertContentContains "criado"	
	}

	void testCadastroNulo(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			click "Criar"
		}
		assertContentContains "O campo nomeRemetente deve ser preenchido!"
	}

	
	void testCadastroNomeVazio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeRemetente = ""
			click "Criar"
		}
		assertContentContains "O campo nomeRemetente deve ser preenchido!"
	}

	void testCadastroNomeInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeRemetente = "123456"
			click "Criar"
		}
		assertContentContains "O campo [nomeRemetente] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}
}