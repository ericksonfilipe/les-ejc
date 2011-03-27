package les.ejc

class OficioMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {

	private String defaultLocation =  "http://localhost:8080/les-ejc/"

	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}

		get("http://localhost:8080/les-ejc/oficio/index");

		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}

	void testCriarOficio() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}

		get("http://localhost:8080/les-ejc/oficio/create");
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}

	void testVisualizarOficio() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre"
			click "Login"
		}

		get("http://localhost:8080/les-ejc/oficio/index");
		click "1"
		assertTitle("Permissao Negada")
		assertContentContains("Voce nao tem permissao para visualizar essa pagina.")
	}
}