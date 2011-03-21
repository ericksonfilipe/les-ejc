package les.ejc

class MudarSenhaFunctionalTests extends functionaltestplugin.FunctionalTestCase {

    private String defaultLocation = "http://localhost:8080/les-ejc/"

    void testMudarSenhaNovaSenhaErradas(){
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
            novasenha1 = "oie1"
            novasenha2 = "oie2"
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
            novasenha1 = "oie"
            novasenha2 = "oie"
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
            novasenha1 = "oie"
            novasenha2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Desculpa, Campos senha ou login invalido."

    }
 


    void testMudarSenhaNovaSenhaCerto(){
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
            novasenha1 = "oie"
            novasenha2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "oie"
            novasenha1 = "admin"
            novasenha2 = "admin"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"

    }
 
}
