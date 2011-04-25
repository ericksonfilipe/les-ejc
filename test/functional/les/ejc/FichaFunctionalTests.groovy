package les.ejc

class FichaFunctionalTests extends functionaltestplugin.FunctionalTestCase {
	
	void testCampoFichaCriar() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		get("http://localhost:8080/les-ejc/usuario/create")
		assertContentContains("Ficha")
	}

	void testCampoFichaEditar() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		get("http://localhost:8080/les-ejc/usuario/show/1")
		assertContentContains("Ficha")
	}

	void testCampoFichaExibir() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		get("http://localhost:8080/les-ejc/usuario/edit/1")
		assertContentContains("Ficha")
	}

}