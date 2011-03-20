package les.ejc

class LoginFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertTitle("Login")
	}
	
	void testLoginCerto(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		assertContentContains "Ola admin!"
		
	}

	void testLoginErrado(){
		get(this.defaultLocation);
		form() {
			login = "usuario"
			senha = "senha"
			click "Login"
		}
		assertContentContains "O login e senha digitados sao incorretos."
	}

	void testLogout() {
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		assertContentContains "Ola admin!"
		
		click "Logout"
		assertContentContains "Usuario admin desconectado!"
	}

}