package les.ejc

class DetalhesEquipesEncontroTests extends functionaltestplugin.FunctionalTestCase {
  
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
		assertContentContains "Equipes do Encontro Mei do Mato"
	}
}
