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
                    click "Detalhes Círculo"
                }
		assertTitle("Impressão de Círculos")
		assertContentContains "Círculos do Encontro Mei do Mato"
		assertContentContains "Dirigente Espiritual: Andre"
		assertContentContains "Local: Manaus"
	}
}
