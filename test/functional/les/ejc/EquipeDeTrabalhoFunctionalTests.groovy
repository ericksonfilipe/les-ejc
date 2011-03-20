package les.ejc

class EquipeDeTrabalhoFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/equipeDeTrabalho/create"
	
	void testTituloBasico() {
		get(this.defaultLocation)
		assertTitle "Criar EquipeDeTrabalho"
		assertContentContains "Criar EquipeDeTrabalho"
	}
	
	void testListaEquipesDeTrabalho(){
		get("http://localhost:8080/les-ejc/equipedetrabalho/list");
		assertContentContains "Lista de EquipeDeTrabalho"
	}
	
	
	void testCadastroValido() {			//ver como testar isso e, se der certo, add teste parecido em Encontro e Circulo
		get(this.defaultLocation);
		form() {
		    selects['nomeEquipe.id'].select "MINI_BOX"
			jovemCoordenador1 = ""
			jovemCoordenador2 = ""
			casalCoordenador = ""
			encontro = ""
			click "Criar"
		}
		assertContentContains "criado"
	}

	void testEncontroNulo(){
		get(this.defaultLocation);
		form() {
			click "Criar"
		}
		assertContentContains "O campo [encontro] nao pode ser vazia"
	}

	
	void testNomeEquipeVazio(){
		get(this.defaultLocation);
		form() {
			nomeEquipe = ""
			click "Criar"
		}
		assertContentContains "O campo [nomeEquipe] nao pode ser vazia" //verr
	}

}