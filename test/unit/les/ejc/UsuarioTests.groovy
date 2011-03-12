package les.ejc

import grails.test.*

class UsuarioTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testConstraints() {
		mockDomain Usuario
		
		
		def usuario_naovalido = new Usuario()
		assertFalse usuario_naovalido.validate()

		
		//usuario deve possuir pelo menos nome
		def usuario_null = new Usuario(nomeCompleto:null, nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_null.validate()
		
		
		//nome completo nao deve ter caracteres especiais e numeros
		def usuario_problemaNomeCompleto2 = new Usuario(nomeCompleto:"Janderson 1", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_problemaNomeCompleto2.validate()
		
		
		//nome completo nao pode ser vazio
		def usuario_problemaNomeCompleto1 = new Usuario(nomeCompleto:"", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_J5Completo.validate()
		
		
		//pode ter soh o nome
		def usuario_apenasNome = new Usuario(nomeCompleto:"Janderson J B A", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertTrue usuario_apenasNome.validate()
		
		
		//exemplo de usuario com dados completos
		data = newDate("22/03/1990")
		def usuario_J5Completo = new Usuario(nomeCompleto:"Janderson J B A", nomeUsual:"Jason", dataDeNascimento:data,
										endereco:"Santa Rosa ...", telefone:"99999999", email:"janderson@email.com", foto:null, 
										paroquia:"Sao Cristovao", equipesTrabalhadas:"secretaria", observacoes:"",
										status:ATIVO, tipo:Jovem, j5Atual:true)
		assertTrue usuario_J5Completo.validate()
		
		
		//email deve ser valido
		def usuario_problemaEmail = new Usuario(nomeCompleto:"Janderson", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:"email", foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_problemaEmail.validate()
		
		
		//nome usual nao deve ter caracteres especiais e numeros
		def usuario_problemaNomeUsual = new Usuario(nomeCompleto:"Janderson 1", nomeUsual:"123", dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_problemaNomeUsual.validate()
		
		
		//nome da paroquia nao deve ter caracteres especiais e numeros
		def usuario_problemaParoquia = new Usuario(nomeCompleto:"Janderson 1", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:"3 irmas", equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_problemaParoquia.validate()
		
		
		//nome das equipes nao deve ter caracteres especiais e numeros
		def usuario_problemaEquipes = new Usuario(nomeCompleto:"Janderson 1", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:"equipe A e equipe 10", observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario_problemaEquipes.validate()
		
    }
	
	void testUnicidadeDeEmail() {
		mockDomain Usuario, []
		def usuario1 = new Usuario(nomeCompleto:"Maria Joao", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:"mariaj@email.com", foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		usuario1.save()
		def usuario2 = new Usuario(nomeCompleto:"Maria Jose", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:"mariaj@email.com", foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		assertFalse usuario2.validate() // ja existe email mariaj@email.com
	}
	
	void testNomeUsualAutomatico() {
		mockDomain Usuario, []
		def usuario1 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:null, tipo:null, j5Atual:null)
		usuario1.save()
		assertEquals usuario1.nomeUsual,"Janderson"
	}
	
	void testCriacaoLoginSenhaAutomatica() {
		mockDomain Usuario, []
		
		
		def usuario1 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:Status.IMPEDIDO, tipo:null, j5Atual:null)
		usuario1.save()
		//usuario nao ativo nao tem login/senha
		assertEquals usuario1.login, null
		assertEquals usuario1.senha, null
		
		
		def usuario2 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:null, foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:Status.ATIVO, tipo:null, j5Atual:null)
		usuario2.save()
		//usuario sem email cadastrado nao tem login/senha
		assertEquals usuario2.login, null
		assertEquals usuario2.senha, null
		
		
		def usuario3 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:null, dataDeNascimento:newDate("22/03/1990"),
										endereco:null, telefone:null, email:"janderson_jason@yahoo.com.br", foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:Status.ATIVO, tipo:null, j5Atual:null)
		usuario3.save()
		//usuario ok com login/senha
		assertEquals usuario3.login, usuario3.email
		assertEquals usuario3.senha, "Janderson1990"
		
		
		def usuario4 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:null, dataDeNascimento:null,
										endereco:null, telefone:null, email:"janderson_jason@yahoo.com.br", foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:Status.ATIVO, tipo:null, j5Atual:null)
		usuario4.save()
		//usuario sem data de nascimento com login/senha
		assertEquals usuario4.login, usuario4.email
		assertEquals usuario4.senha, "Janderson" //ver como fica com data null

	}
	
	void testEnvioDeEmailNotificandoLoginSenha() {
		//As informacoes de Login e Senha de um novo Usuario devem ser enviadas para o seu email. Entretanto, usuarios cadastrados sem email, mesmo com status Ativo, nao terao login/senha e, consequentemente, nao receberao email com essas informacoes e nao poderao logar no sistema.
	}
	
	void testAlteracaoDeSenha() {
		mockDomain Usuario, []
		
		def usuario = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:null, dataDeNascimento:newDate("22/03/1990"),
										endereco:null, telefone:null, email:"janderson_jason@yahoo.com.br", foto:null, 
										paroquia:null, equipesTrabalhadas:null, observacoes:null,
										status:Status.ATIVO, tipo:null, j5Atual:null)
		usuario.save()

		assertEquals usuario.login, usuario3.email
		assertEquals usuario.senha, "Janderson1990"
		
		usuario.alteraSenha("janderson123")
		assertEquals usuario.senha, "janderson123"
		
	}
	
	void testEnvioDeEmailNotificandoAniversario() {
		//Uma vez que existam usuarios cadastrados no sistema, sera analisado diariamente se ha usuarios aniversariantes no dia corrente, para que seja enviada uma mensagem de aniversario.
		//As mensagens automaticas de aniversario so poderao ser enviadas aos usuarios que possuirem em seu cadastro um e-mail.
		//A mensagem de aniversario seguira um padrao, devendo conter o nome do aniversariante e uma mensagem a ser especificada posteriormente. Em tempo, sera: “Parabens, Fulano(a)! O EJC da Paroquia de Sao Cristovao o(a) felicita por mais um ano de vida. Deus o(a) abencoe cada vez mais. Abracos!”
	}
	
	
	
}
