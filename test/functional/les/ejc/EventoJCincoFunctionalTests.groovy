package les.ejc

class EventoJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/evento/create"
	
	void testTodosCamposBrancos(){
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
		
		assertContentContains "O campo [descricao] nao pode ficar em branco"
		assertContentContains "O campo [horario] nao pode ficar em branco"
		assertContentContains "O campo [local] nao pode ficar em branco"
	}
	
	void testHorario() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			descricao = "uma descricao"
			horario = "um horario"
			local = "Um local"			
			click "Criar"
		}
		assertContentContains "O campo [horario] com o valor [um horario] ultrapassa o tamanho maximo de [5]"
	}
	
	void testOk() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			descricao = "uma descricao"
			horario = "18:00"
			local = "Um local"
			click "Criar"
		}
		assertContentContains "evento1criado"
	}

}