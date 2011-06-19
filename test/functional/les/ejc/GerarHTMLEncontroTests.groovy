package les.ejc

class GerarHTMLEncontroTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation = "http://localhost:8080/les-ejc/encontro/show/1"
	
	void testHTML() {
		get("http://localhost:8080/les-ejc/");
		form() {
		    login = "admin"
		    senha = "admin123"
                    click "Login"
		}
		get(this.defaultLocation)
                form() {
                    click "Imprimir"
                }
		assertTitle("Impressão de Encontros")
		assertContentContains "Encontro Paróquia São Cristóvão"
		assertContentContains "Dirigente Espiritual: Andre"
		assertContentContains "Tema: Mei do Mato"
		assertContentContains "Local: Manaus"
	}
}
