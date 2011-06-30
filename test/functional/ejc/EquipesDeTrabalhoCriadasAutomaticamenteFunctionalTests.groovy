package ejc

class EquipesDeTrabalhoCriadasAutomaticamenteFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/equipeDeTrabalho/create"
	
	void testCriandoEquipesPreDefinidas(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get("http://localhost:8080/les-ejc/encontro/create");
		Calendar hoje = new GregorianCalendar()
		form() {
			numero = "10"
			selects['dirigenteEspiritual.id'].select "2"
			data_day = "${hoje.get(Calendar.DAY_OF_MONTH) + 10}"
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
	}
	
	void testCriandoEquipesPelaURL() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123" 
            click "Login"
		}
		
		get("http://localhost:8080/les-ejc/equipeDeTrabalho/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
	

	void testExcluirEquipeDeTrabalho() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//visualiza encontro ja cadastrado
		//get("http://localhost:8080/les-ejc/encontro/show/1"); 
		//form() {
		//	click "J5"
		//}
		
		//nao tem opcao Excluir

	}

}
