package les.ejc

class PerfilUsuarioFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"
	

	
	void testPerfilDePadre(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//pegando usuario do tipo padre ja cadastrado
		get("http://localhost:8080/les-ejc/usuario/show/2");
		/*form() {
			click "Visualizar Perfil de Andre"
		}
		
		assertContentContains "Perfil de Andre"
		assertContentContains "Equipes Trabalhadas: Nenhuma."
		assertContentContains "Voltar para Dados Gerais do Usuário"*/
	}
	
	
	void testPerfilDeCasal(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//pegando usuario do tipo casal ja cadastrado
		get("http://localhost:8080/les-ejc/usuario/show/3");
		/*form() {
			click "Visualizar Perfil de Casado e Casada"
		}
		
		assertContentContains "Perfil de Casado e Casada"
		
		//nao encontrada opcao de Equipes coordenadas
		
		form() {
			click "Voltar para Dados Gerais do Usuário"
		}
		
		form() {
			click "Editar"
		}
		
		form() {
			equipesTrabalhadas="COMPRAS"
			click "Alterar"
		}
		
		form() {
			click "Visualizar Perfil de Casado e Casada"
		}
		
		assertContentContains "Equipes Trabalhadas: COMPRAS"
		assertContentContains "Voltar para Dados Gerais do Usuário"*/
	}	
	
	
	
	void testPerfilDeJovem(){
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		//pegando usuario do tipo jovem ja cadastrado
		get("http://localhost:8080/les-ejc/usuario/show/1");
		/*form() {
			click "Visualizar Perfil de Admin"
		}
		
		assertContentContains "Perfil de admin"
		assertContentContains "Encontro: Usuário não cadastrado como encontrista em nenhum encontro."
		assertContentContains "Círculo de Origem: Usuário não cadastrado como encontrista em nenhum círculo."
		
		
		//insere circulo e cadastra usuario
		get("http://localhost:8080/les-ejc/circulo/show/1")
		form() {
			click "Editar"
		}
		
		form() {
			selects['participantes'].select "admin"
			click "Alterar"
		}
		
		get("http://localhost:8080/les-ejc/usuario/perfil/1");
		
		assertContentContains "Perfil de admin"
		assertContentContains "Encontro: Mei do Mato"
		assertContentContains "Círculo de Origem: Sem civilizacao"*/

	}

	

}
