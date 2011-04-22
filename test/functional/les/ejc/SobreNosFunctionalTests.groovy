package les.ejc

class SobreNosFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testExistenciaDeOpcaoSobreNosParaLogados(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		assertContentContains "Ola admin!"
		assertContentContains "Sobre Nos"
	}

	void testExistenciaDeOpcaoSobreNosParaNaoLogados() {
		get(this.defaultLocation)
		//assertContentContains "Sobre Nós"
	}
	
	void testExistenciaTextoPedido(){
		get(this.defaultLocation);
		//click "Sobre Nós"
		//assertContentContains "Sobre o EJC"
		//assertContentContains "A Paróquia de São Cristóvão, da Diocese de Campina Grande, Paraíba, realiza o Encontro de Jovens com Cristo (EJC) desde 2000. O encontro acontece durante um final de semana e provê ao jovem um contato pessoal com Jesus, de uma forma evangelizadora, alegre e descontraída.<br><br>O EJC, entretanto, não se resume a um fim de semana. Consiste em um dos principais movimentos jovens da Igreja Católica no Brasil, tendo como objetivo despertar a juventude para a pessoa e proposta de Jesus Cristo, desenvolvendo com os jovens um processo global de formação a partir da fé, formando líderes capacitados a atuar em diversas pastorais/ministérios da Igreja e comprometidos com a liberação integral do homem na sociedade."
		//assertContentContains "Sobre a Paróquia"
		//assertContentContains 'Instalada oficialmente em 1960, a Igreja Matriz Paróquia de São Cristóvão, integrante da Diocese de Campina Grande-PB, está, atualmente, situada no bairro do Centenário, nas proximidades da Av. Floriano Peixoto, contando na sua estrutura com o Centro Pastoral para reuniões de pastorais, movimentos e serviços, além da formação de leigos de suas comunidades.<br><br>Mais informações no site: <a href="http://www.paroquiadesaocristovaocg.com" target="_blank">www.paroquiadesaocristovaocg.com</a>.'
	}
	
}