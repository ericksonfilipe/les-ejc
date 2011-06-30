package ejc

class NovaCriacaoEncontroFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/encontro/create"
	
	void testSemReferenciaDeCirculoEEquipeNaCriacaoBasicaDeEncontro(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation);
		
		//assert sem opcao "circulo"
		//assert sem opcao de "equipe"
		
		form() {
			click "Criar"
		}

		//assert sem opcao "circulo"
		//assert sem opcao de "equipe"
	}
	
	
	void testCriandoEncontroEAlterandoEquipesPreDefinidas(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/create");
		Calendar hoje = new GregorianCalendar()
		form() {
			numero = "6"
			selects['dirigenteEspiritual.id'].select "2"
			data_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 6}"
			data_month = "${hoje.get(Calendar.MONTH) + 1}"
			data_year = "${hoje.get(Calendar.YEAR)}"
			tema = "tema"
			local = "local"
			click "Criar"
		}

		assertContentContains "COORDENACAO_GERAL"
		assertContentContains "J5"
		assertContentContains "COORDENACAO_DE_CIRCULOS"
		assertContentContains "VISITACAO_E_EXTERNA"
		assertContentContains "BANDINHA"
		assertContentContains "BOA_VONTADE"
		assertContentContains "COZINHA"
		assertContentContains "LITURGIA_E_VIGILIA"
		assertContentContains "CORREIO_INTERNO"
		assertContentContains "RECEPCAO_AOS_PALESTRANTES"
		assertContentContains "SOM_E_ILUMINACAO"
		assertContentContains "COMPRAS"
		assertContentContains "SECRETARIA"
		assertContentContains "TRANSITO_E_SOCIODRAMA"
		assertContentContains "ORDEM_E_LIMPEZA"
		assertContentContains "MINI_BOX"
		assertContentContains "LANCHINHO"
		assertContentContains "VISITACAO_E_EXTERNA"

		//ajeitar!
		/*
		form() {
			click "J5"
		}
		
		assertContentContains "Equipe de Trabalho"
		assertContentContains "J5"
		
		form() {
			click "Editar"
		}
		
		
		//o nome jah está explicito, nao podendo mudar
		assertContentContains '<label for="nomeEquipe">Equipe: COORDENACAO_GERAL</label>'
	
		form() {
			selects['casalApoio'].select "casado e casada"
			click "Alterar"
		}
		
		assertContentContains "alterado"
		assertContentContains "Voltar para o Encontro"
		*/

	}
	

	void testCriandoEncontroEAdicionandoCirculo(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/create");
		Calendar hoje = new GregorianCalendar()
		form() {
			numero = "7"
			selects['dirigenteEspiritual.id'].select "2"
			data_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 7}"
			data_month = "${hoje.get(Calendar.MONTH) + 1}"
			data_year = "${hoje.get(Calendar.YEAR)}"
			tema = "tema"
			local = "local"
			click "Criar"
		}
		
		form() {
			click "Editar"
		}
		
		//ajeitar
		/*
		form() {
			click "Adicionar Circulo"
		}
		
		form() {
			selects['casalApoio'].select "casado e casada"
			nomeCirculo = "nome"
			click "Criar"
		}
		
		assertContentContains '<td class="name" valign="top">Nome Circulo</td> <td class="value" valign="top">nome</td>'
		assertContentContains "Voltar para o Encontro"
		*/
	}	
	
	

}
