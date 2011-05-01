package les.ejc

class EncontroJCincoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/encontro/create"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle "Criar Encontro"
		assertContentContains "Criar Encontro"
	}
	
	void testListaEncontros(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/list");
		assertContentContains "Lista de Encontro"
	}
	
	void testLocalNulo(){
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
		assertContentContains "O campo [local] nao pode ficar em branco"
	}
	
	void testLocalVazio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			local = ""
			click "Criar"
		}
		assertContentContains "O campo [local] nao pode ficar em branco"
	}

	void testTemaNulo(){
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
		assertContentContains "O campo [tema] nao pode ficar em branco"
	}
	
	void testTemaVazio(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			tema = ""
			click "Criar"
		}
		assertContentContains "O campo [tema] nao pode ficar em branco"
	}

	void testTemaInvalido(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		form() {
			tema = "qu4lqu3r c0154"
			click "Criar"
		}
		assertContentContains "O campo [tema] nao atende ao padrao definido [([a-zA-Z]| )+]"
	}

	//Testes para Requisito: Os encontros devem ter um número correspondente (1º, 2º, ...), que não pode se repetir e deve seguir a sequência de datas.
	
	void testCriarEncontroValido() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		Calendar hoje = new GregorianCalendar()
		form() {
			codigo = "5"
			selects['dirigenteEspiritual.id'].select "2"
			data_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 5}"
			data_month = "${hoje.get(Calendar.MONTH) + 1}"
			data_year = "${hoje.get(Calendar.YEAR)}"
			tema = "tema"
			local = "local"
			click "Criar"
		}
		assertContentContains "Encontro 2 criado"
	}
	
	void testCodigoInvalidoPoisExistemEncontrosComDataAnteriorECodigoMaior() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		Calendar hoje = new GregorianCalendar()
		form() {
			codigo = "4"
			selects['dirigenteEspiritual.id'].select "2"
			data_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 6}"
			data_month = "${hoje.get(Calendar.MONTH) + 1}"
			data_year = "${hoje.get(Calendar.YEAR)}"
			tema = "tema"
			local = "local"
			click "Criar"
		}
		assertContentContains "O c&oacute;digo 4 n&atilde;o &eacute; v&aacute;lido, pois existem encontros com data anterior a"
	}
	
	void testCodigoInvalidoPoisExistemEncontrosComDataPosteriorECodigoMenor() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
		get(this.defaultLocation);
		Calendar hoje = new GregorianCalendar()
		form() {
			codigo = "8"
			selects['dirigenteEspiritual.id'].select "2"
			data_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 2}"
			data_month = "${hoje.get(Calendar.MONTH) + 1}"
			data_year = "${hoje.get(Calendar.YEAR)}"
			tema = "tema"
			local = "local"
			click "Criar"
		}
		assertContentContains "O c&oacute;digo 8 n&atilde;o &eacute; v&aacute;lido, pois existem encontros com data posterior a"
	}

}