package les.ejc

class MudarSenhaFunctionalTests extends functionaltestplugin.FunctionalTestCase {

    private String defaultLocation = "http://localhost:8080/les-ejc/"

    void testMudarSenhasenhanovaErradas(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		
        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "admin"
            senhanova1 = "oie1"
            senhanova2 = "oie2"
            click "Mudar Senha"
        }
        assertContentContains "Campos de nova senha não são iguais."

    }
      
    void testMudarSenhaAntigaSenhaErrada(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
	
        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "adminnnnn"
            senhanova1 = "oie"
            senhanova2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Desculpa, Campos senha ou login invalido."

    }

    void testMudarSenhaLoginErrado(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}

        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "adminn"
            senha = "admin"
            senhanova1 = "oie"
            senhanova2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Desculpa, Campos senha ou login invalido."

    }
 


    void testMudarSenhasenhanovaCerto(){
		get(this.defaultLocation);
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}

        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "admin"
            senhanova1 = "oie"
            senhanova2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "oie"
            senhanova1 = "admin"
            senhanova2 = "admin"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"

    }
 
}
