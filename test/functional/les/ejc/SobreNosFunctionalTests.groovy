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
		//assertContentContains "Sobre N�s"
	}
	
	void testExistenciaTextoPedido(){
		get(this.defaultLocation);
		//click "Sobre N�s"
		//assertContentContains "Sobre o EJC"
		//assertContentContains "A Par�quia de S�o Crist�v�o, da Diocese de Campina Grande, Para�ba, realiza o Encontro de Jovens com Cristo (EJC) desde 2000. O encontro acontece durante um final de semana e prov� ao jovem um contato pessoal com Jesus, de uma forma evangelizadora, alegre e descontra�da.<br><br>O EJC, entretanto, n�o se resume a um fim de semana. Consiste em um dos principais movimentos jovens da Igreja Cat�lica no Brasil, tendo como objetivo despertar a juventude para a pessoa e proposta de Jesus Cristo, desenvolvendo com os jovens um processo global de forma��o a partir da f�, formando l�deres capacitados a atuar em diversas pastorais/minist�rios da Igreja e comprometidos com a libera��o integral do homem na sociedade."
		//assertContentContains "Sobre a Par�quia"
		//assertContentContains 'Instalada oficialmente em 1960, a Igreja Matriz Par�quia de S�o Crist�v�o, integrante da Diocese de Campina Grande-PB, est�, atualmente, situada no bairro do Centen�rio, nas proximidades da Av. Floriano Peixoto, contando na sua estrutura com o Centro Pastoral para reuni�es de pastorais, movimentos e servi�os, al�m da forma��o de leigos de suas comunidades.<br><br>Mais informa��es no site: <a href="http://www.paroquiadesaocristovaocg.com" target="_blank">www.paroquiadesaocristovaocg.com</a>.'
	}
	
}