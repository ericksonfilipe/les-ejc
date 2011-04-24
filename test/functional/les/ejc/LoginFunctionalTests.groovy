package les.ejc

class LoginFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testLoginCerto(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		//mensagem "Ol�, admin!" separada por causa de problema com acento
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
		
		//mensagem "O login e senha digitados s�o incorretos." separada por causa de problema com acento
		assertContentContains "O login e senha digitados s"
		assertContentContains "o incorretos."
	}

	void testLogout() {
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		//mensagem "Ol�, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		click "Logout"
		//mensagem "Usu�rio admin desconectado!" separada por causa de problema com acento
		assertContentContains "Usu"
		assertContentContains "rio admin desconectado!"
	}

}