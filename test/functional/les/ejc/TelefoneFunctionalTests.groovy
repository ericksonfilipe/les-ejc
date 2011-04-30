package les.ejc

class TelefoneFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testCadastrandoTelefoneValido(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		get("http://localhost:8080/les-ejc/telefone/create")
		form() {
			ddd = "83"
			prefixo = "1111"
			sufixo = "5555"
			click "Criar"
		}
		
		assertContentContains "(83)1111-5555"
		assertContentContains "criado"
	}
	
	void testCadastrandoTelefoneInvalido(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		get("http://localhost:8080/les-ejc/telefone/create")
		form() {
			ddd = ""
			prefixo = ""
			sufixo = ""
			click "Criar"
		}
		
		assertContentContains "O campo [ddd] nao pode ficar em branco"
	}
	
	void testSemPermissaoParaCadastrar(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}
		assertContentContains "Ol"
		
		get("http://localhost:8080/les-ejc/telefone/create")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}