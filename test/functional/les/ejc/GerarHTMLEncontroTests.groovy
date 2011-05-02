package les.ejc

class GerarHTMLEncontroTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "localhost:8080/les-ejc/encontro/show/1"
	
	void testTituloBasico() {
		get("http://localhost:8080/les-ejc/");
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
		get(this.defaultLocation)
		assertTitle("Mostrar Encontro")
	}
	
	void testHTML() {
		get("localhost:8080/les-ejc/encontro/show/1");
		form() {
			click "Imprimir"
		}

		assertTitle("Impressão de Encontros")
		assertContentContains "Encontro Paróquia São Cristóvão"
		assertContentContains "Data: 02/05/2011"
		assertContentContains "Dirigente Espiritual: Andre"
		assertContentContains "Tema: Mei do Mato"
		assertContentContains "Local: Manaus"
		assertContentContains "Círculo(s):"
		assertContentContains "Nome da Equipe: COORDENACAO_GERAL"

}
