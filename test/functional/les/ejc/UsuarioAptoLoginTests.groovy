package les.ejc

class UsuarioAptoLoginTests extends functionaltestplugin.FunctionalTestCase {
  
	private String defaultLocation =  "http://localhost:8080/les-ejc/usuario/create"
	
	void testButton() {
            get("http://localhost:8080/les-ejc/");
            form() {
                login = "admin"
                senha = "admin123"
                click "Login"
            }
            get(this.defaultLocation);
            form() {
                nomeCompleto = "leandro"
                email = "leandrodiassis@gmail.com"
                click "Criar"
            }
            assertContentContains "Enviar Login"
            get("http://localhost:8080/les-ejc/usuario/listNotAtivado");
            assertContentContains "leandro"
        }

}
