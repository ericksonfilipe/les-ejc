package les.ejc

class AtaJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/ata/create"
	
	void testSemPautaEPessoasPresentes(){
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
		
		assertContentContains "O campo [pauta] nao pode ficar em branco"
		assertContentContains "O campo [pessoasPresentes] nao pode ser vazia"
	}
	
	void testPessoasPresentesMenorQue2() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			pauta = "uma pauta"
			selects['pessoasPresentes.id'].select "2"
			click "Criar"
		}
		assertContentContains "O campo [pessoasPresentes] com o valor [[Andre]] nao atinge o tamanho minimo de [2]"
	}
	
	void testOk() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			pauta = "uma pauta"
			selects['pessoasPresentes'].select "2"
			selects['pessoasPresentes'].select "1"
			click "Criar"
		}
		assertContentContains "ata1criado"
	}

}