package les.ejc

class UsuarioTipoCasalFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle("Criar Usuario")
		assertContentContains("Criar Usuario")
	}
	
	void testListaUsuarios(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/usuario/list");
		assertContentContains "Lista de Usuario"
	}
	
	void testCadastroValido() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			click "Criar"
		}
		assertContentContains "criado"	
	}

	void testCadastroNulo(){
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
		assertContentContains "O campo Nome Completo deve ser preenchido!"
	}

	
	void testCadastroNomeVazio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = ""
			click "Criar"
		}
		assertContentContains "O campo Nome Completo deve ser preenchido!"
	}

	void testCadastroNomeInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "123456"
			click "Criar"
		}
		assertContentContains "O campo [nomeCompleto] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}
	
	void testCadastroDeNomeUsualInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			nomeUsual = "Ze1"
			click "Criar"
		}
		assertContentContains "O campo [nomeUsual] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

	void testCadastroDeParoquiaInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			paroquia = "3 irmas"
			click "Criar"
		}
		assertContentContains "O campo [paroquia] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

	void testCadastroDeEquipesTrabalhadasInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			equipesTrabalhadas = "Mais de 1000"
			click "Criar"
		}
		assertContentContains "O campo [equipesTrabalhadas] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

	void testCadastroObservacoesInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			observacoes = "123"
			click "Criar"
		}
		assertContentContains "O campo [observacoes] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

	void testEmailInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			email = "email@qualquer"
			click "Criar"
		}
		assertContentContains "O campo [email] nao e um endereco de email valido"
	}
	
	void testNomeUsualAutomatico(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			nomeUsual = ""
			click "Criar"
		}
		assertContentContains '<tdvalign="top"class="name">nomeusual</td><tdvalign="top"class="value">jose</td>'
	}
	/*
	void testTelefoneInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			nomeCompleto = "Jose da Silva"
			telefone = "12345"
			click "Criar"
		}
		assertContentContains "O campo [telefone] com o valor [12345] nao atinge o tamanho minimo de [10]"
	}
	*/

}