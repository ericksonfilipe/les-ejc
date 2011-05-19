package les.ejc

class UsuarioTipoCasalFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"
	
	void testCriacaoDeUsuarioTipoCasalFuncionando() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation)
		
		form() {
			nomeCompleto = "Pessoa"
			nomeCompleto2 = "outra Pessoa"
			selects['tipo'].select "Casal"
			click "Criar"
		}
		assertContentContains "criado"
		assertContentContains "Casal"
		assertContentContains "Usuario"
	}
	
	void testCriacaoDeUsuarioQueNaoEhDoTipoCasalComDataDeNasmentoDeMaridoOuMulher() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);

		Calendar hoje = new GregorianCalendar()
		form() {
			nomeCompleto = "Pessoa que vai vai ser cadastrada"
			dataDeNascimento2_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 5}"
			dataDeNascimento2_month = "${hoje.get(Calendar.MONTH) + 1}"
			dataDeNascimento2_year = "${hoje.get(Calendar.YEAR)}"
			click "Criar"
		}
		assertContentContains "O campo Data de Nascimento (Marido/Mulher)"
		assertContentContains "for do tipo Casal"
	}

	void testCriacaoDeUsuarioQueNaoEhDoTipoCasalComEmailDeMaridoOuMulher() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);

		form() {
			nomeCompleto = "Pessoa que vai vai ser cadastrada"
			email2 = "email@outro.com"
			click "Criar"
		}
		assertContentContains "O campo Email (Marido/Mulher)"
		assertContentContains "for do tipo Casal"
	}

}
