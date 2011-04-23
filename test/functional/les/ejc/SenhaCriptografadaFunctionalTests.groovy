package les.ejc

class SenhaCriptografadaFunctionalTests extends functionaltestplugin.FunctionalTestCase {
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testCriptografiaAoLogar(){
		get(this.defaultLocation)
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")
		assertContentContains "<td>admin</td><td>" + new String("admin".encodeAsMD5Hex()) + "</td>"
	}

	void testCriptografiaAoMudarSenhaDeUsuario() {
		get(this.defaultLocation)
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"

        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "admin"
            senhanova1 = "oie"
            senhanova2 = "oie"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")	
		assertContentContains "<td>admin</td><td>" + new String("oie".encodeAsMD5Hex()) + "</td>"
		
		get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "oie"
            senhanova1 = "admin"
            senhanova2 = "admin"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")	
		assertContentContains "<td>admin</td><td>" + new String("admin".encodeAsMD5Hex()) + "</td>"
	}

	void testCriptografiaAoCriarUsuario(){
		get(this.defaultLocation)
		form() {
			login = "admin"
			senha = "admin"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		get("http://localhost:8080/les-ejc/usuario/create")
		form() {
			nomeCompleto = "Novato da Silva"
			dataDeNascimento = new Date()
			email = "novato@email.test"
			click "Criar"
		}
		assertContentContains "criado"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")
		assertContentContains "<td>novato@email.test</td><td>" + new String("Novato2011".encodeAsMD5Hex()) + "</td>"
	}

}