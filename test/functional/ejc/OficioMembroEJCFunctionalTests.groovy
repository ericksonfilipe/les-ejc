package ejc

class OficioMembroEJCFunctionalTests extends functionaltestplugin.FunctionalTestCase {

	private String defaultLocation =  "http://localhost:8080/les-ejc/"

	void testTituloBasico(){
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}

		get("http://localhost:8080/les-ejc/oficio/index");

		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}

	void testCriarOficio() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}

		get("http://localhost:8080/les-ejc/oficio/create");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}

	void testVisualizarOficio() {
		get(this.defaultLocation);
		form() {
			login = "andre"
			senha = "andre123"
			click "Login"
		}

		get("http://localhost:8080/les-ejc/oficio/index");
		assertContentContains "Permiss"
		assertContentContains "o Negada"
	}
}