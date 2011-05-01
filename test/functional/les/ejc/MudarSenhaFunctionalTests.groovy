package les.ejc

class MudarSenhaFunctionalTests extends functionaltestplugin.FunctionalTestCase {

    private String defaultLocation = "http://localhost:8080/les-ejc/"

    void testMudarSenhasenhanovaErradas(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		
        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "admin123"
            senhanova1 = "oie11234"
            senhanova2 = "oie21234"
            click "Mudar Senha"
        }
        assertContentContains "Campos de nova senha não são iguais."

    }
      
    void testMudarSenhaAntigaSenhaErrada(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
	
        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "adminnnnn"
            senhanova1 = "oie12345"
            senhanova2 = "oie12345"
            click "Mudar Senha"
        }
        assertContentContains "Campos senha ou login inválido."

    }

    void testMudarSenhaLoginErrado(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}

        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "adminn"
            senha = "admin123"
            senhanova1 = "oie"
            senhanova2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Campos senha ou login inválido."

    }
 


    void testMudarSenhasenhanovaCerto(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}

        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "admin123"
            senhanova1 = "oie12345"
            senhanova2 = "oie12345"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "oie12345"
            senhanova1 = "admin123"
            senhanova2 = "admin123"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"

    }
 
}
