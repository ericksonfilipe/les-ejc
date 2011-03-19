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
		assertContentContains "Hello admin!"
		
	}

	void testLoginErrado(){
		get(this.defaultLocation);
		form() {
			login = "usuario"
			senha = "senha"
			click "Login"
		}
		assertContentContains "Sorry, usuario. Please try again."
	}

	void testLogout() {
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		assertContentContains "Hello admin!"
		
		click "Logout"
		assertContentContains "Goodbye admin!"
	}

}