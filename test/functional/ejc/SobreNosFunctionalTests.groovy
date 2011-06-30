package les.ejc

class SobreNosFunctionalTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testExistenciaDeOpcaoSobreNosParaLogados(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		assertContentContains "Sobre N" //nao colocou o "Sobre Nós" por causa do problema com acento
	}

	void testExistenciaDeOpcaoSobreNosParaNaoLogados() {
		get(this.defaultLocation)
		assertContentContains "Sobre N" //nao colocou o "Sobre Nós" por causa do problema com acento
	}
	
	void testExistenciaTextoPedido(){
		get("http://localhost:8080/les-ejc/app/sobrenos.gsp");
		assertContentContains "Sobre N" //nao colocou o "Sobre Nós" por causa do problema com acento
		assertContentContains "Sobre o EJC"
		//mensagem "Sobre a Paróquia" separada por causa de problema com acento
		assertContentContains "Sobre a Par"
		assertContentContains "quia"

	}
	
}