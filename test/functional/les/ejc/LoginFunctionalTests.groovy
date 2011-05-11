package les.ejc

class LoginFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testLoginCerto(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
	}

	void testLoginErrado(){
		get(this.defaultLocation);
		form() {
			login = "usuario"
			senha = "senha"
			click "Login"
		}
		assertContentContains "Login/Senha digitados incorretamente"
	}

	void testLogout() {
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		click "Logout"
		//mensagem "Usuário admin desconectado!" separada por causa de problema com acento
		assertContentContains "Usu"
		assertContentContains "rio admin desconectado!"
	}

}
