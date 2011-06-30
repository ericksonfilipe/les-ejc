package ejc

class DetalhesCirculoEncontroTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation = "http://localhost:8080/ejc/encontro/show/1"
	
	void testHTML() {
		get("http://localhost:8080/ejc/app/login");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		get(this.defaultLocation);
		form() {
			click "Detalhes Círculos"
		}
		assertContentContains "Círculos do Encontro Mei do Mato"
		assertContentContains "Dirigente Espiritual: Andre"
		assertContentContains "Local: Manaus"
	}
}
