package ejc

class SenhaCriptografadaFunctionalTests extends functionaltestplugin.FunctionalTestCase {
	private String defaultLocation =  "http://localhost:8080/les-ejc/"
	
	void testCriptografiaAoLogar(){
		get(this.defaultLocation)
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")
		assertContentContains "<td>admin</td><td>" + new String("admin123".encodeAsMD5Hex()) + "</td>"
	}

	void testCriptografiaAoMudarSenhaDeUsuario() {
		get(this.defaultLocation)
		form() {
			login = "admin"
			senha = "admin123"
			click "Login"
		}
		//mensagem "Olá, admin!" separada por causa de problema com acento
		assertContentContains "Ol"
		assertContentContains ", admin!"

        get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "admin123"
            senhanova1 = "oie12345"
            senhanova2 = "oie12345"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")	
		assertContentContains "<td>admin</td><td>" + new String("oie12345".encodeAsMD5Hex()) + "</td>"
		
		get("http://localhost:8080/les-ejc/app/trocarsenha")
        form() {
            login = "admin"
            senha = "oie12345"
            senhanova1 = "admin123"
            senhanova2 = "admin123"
            click "Mudar Senha"
        }
        assertContentContains "Senha atualizada com sucesso"
		
		get ("http://localhost:8080/les-ejc/usuario/senhacriptografada")	
		assertContentContains "<td>admin</td><td>" + new String("admin123".encodeAsMD5Hex()) + "</td>"
	}

	void testCriptografiaAoCriarUsuario(){
		get(this.defaultLocation)
		form() {
			login = "admin"
			senha = "admin123"
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
		assertContentContains "novato@email.test"
		String test = new String("Novato2011".encodeAsMD5Hex())
		//assertContentContains test
	}

}