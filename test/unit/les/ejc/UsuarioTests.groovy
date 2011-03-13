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
		def usuario_null = new Usuario(nomeCompleto:null, nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_null.validate()
		
		
		//nome completo nao deve ter caracteres especiais e numeros
		def usuario_problemaNomeCompleto1 = new Usuario(nomeCompleto:"Janderson 1", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_problemaNomeCompleto1.validate()
		
		
		//nome completo nao pode ser vazio
		def usuario_problemaNomeCompleto2 = new Usuario(nomeCompleto:"", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_problemaNomeCompleto2.validate()

		
		//pode ter soh o nome
		def usuario_apenasNome = new Usuario(nomeCompleto:"Janderson J B A", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario_apenasNome.validate()
		
		
		//exemplo de usuario com dados completos
		def usuario_J5Completo = new Usuario(nomeCompleto:"Janderson J B A", nomeUsual:"Jason", dataDeNascimento:new Date("1990/03/22"),
										endereco:new Endereco(rua:"Avenida Jose Martins",bairro:"Santa Rosa",cidade:"CG",estado:"PB"),
										telefone:"8399999999", email:"janderson@email.com", foto:null, 
										paroquia:"Sao Cristovao", equipesTrabalhadas:"secretaria", observacoes:"xxx",
										status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:true)
		assertTrue usuario_J5Completo.validate()
		
		
		//email deve ser valido
		def usuario_problemaEmail = new Usuario(nomeCompleto:"Janderson", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:"email", foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_problemaEmail.validate()
		
		
		//nome usual nao deve ter caracteres especiais e numeros
		def usuario_problemaNomeUsual = new Usuario(nomeCompleto:"Janderson", nomeUsual:"123", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_problemaNomeUsual.validate()
		
		
		//nome da paroquia nao deve ter caracteres especiais e numeros
		def usuario_problemaParoquia = new Usuario(nomeCompleto:"Janderson", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"3 irmas", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_problemaParoquia.validate()
		
		
		//nome das equipes nao deve ter caracteres especiais e numeros
		def usuario_problemaEquipes = new Usuario(nomeCompleto:"Janderson", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"equipe A e equipe 10", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario_problemaEquipes.validate()
		
    }
	
	void testUnicidadeDeEmail() {
		mockDomain Usuario, []
		def usuario1 = new Usuario(nomeCompleto:"Maria Joao", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:"mariaj@email.com", foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		usuario1.save()
		def usuario2 = new Usuario(nomeCompleto:"Maria Jose", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:"mariaj@email.com", foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertFalse usuario2.validate() // ja existe email mariaj@email.com
	}
	
	void testNomeUsualAutomatico() {
		mockDomain Usuario, []
		def usuario = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario.validate()
		assertEquals "",usuario.nomeUsual
		usuario.save()
		assertEquals "Janderson",usuario.nomeUsual		//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
	}
	
	void testCriacaoLoginSenhaAutomatica() {
		mockDomain Usuario, []
		
		
		def usuario1 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Impedido, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario1.validate()
		usuario1.save()
		//usuario nao Ativo nao tem login/senha
		assertEquals null, usuario1.login
		assertEquals null, usuario1.senha
		
		
		def usuario2 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:null, foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario2.validate()
		usuario2.save()
		//usuario sem email cadastrado nao tem login/senha
		assertEquals null, usuario2.login
		assertEquals null, usuario2.senha
		
		
		def usuario3 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:"", dataDeNascimento:new Date("1990/03/22"),
										endereco:null, telefone:"", email:"aleatorio3@email.com", foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario3.validate()
		usuario3.save()
		//usuario ok com login/senha
		assertEquals usuario3.email, usuario3.login			//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
		assertEquals "Janderson1990", usuario3.senha		//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
		
		
		def usuario4 = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:"", dataDeNascimento:null,
										endereco:null, telefone:"", email:"aleatorio4@email.com", foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario4.validate()
		usuario4.save()
		//usuario sem data de nascimento com login/senha
		assertEquals usuario4.email, usuario4.login			//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
		assertEquals "Janderson", usuario4.senha			//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
	}
	
	void testEnvioDeEmailNotificandoLoginSenha() {
		//As informacoes de Login e Senha de um novo Usuario devem ser enviadas para o seu email. Entretanto, usuarios cadastrados sem email, mesmo com status Ativo, nao terao login/senha e, consequentemente, nao receberao email com essas informacoes e nao poderao logar no sistema.
	}
	
	void testAlteracaoDeSenha() {
		mockDomain Usuario, []
		
		def usuario = new Usuario(nomeCompleto:"Janderson Jason", nomeUsual:"", dataDeNascimento:new Date("1990/03/22"),
										endereco:null, telefone:"", email:"algumacoisa@email.com", foto:null, 
										paroquia:"", equipesTrabalhadas:"", observacoes:"",
										status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:false)
		assertTrue usuario.validate()
		usuario.save()
		
		assertEquals usuario.email, usuario.login		//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
		assertEquals "Janderson1990", usuario.senha		//pega qd se testa pelo browser - RESOLVER E TIRAR ESSE COMENTARIO!
		
		usuario.alteraSenha("janderson123")
		assertEquals "janderson123", usuario.senha
		
	}
	
	void testEnvioDeEmailNotificandoAniversario() {
		//Uma vez que existam usuarios cadastrados no sistema, sera analisado diariamente se ha usuarios aniversariantes no dia corrente, para que seja enviada uma mensagem de aniversario.
		//As mensagens automaticas de aniversario so poderao ser enviadas aos usuarios que possuirem em seu cadastro um e-mail.
		//A mensagem de aniversario seguira um padrao, devendo conter o nome do aniversariante e uma mensagem a ser especificada posteriormente. Em tempo, sera: “Parabens, Fulano(a)! O EJC da Paroquia de Sao Cristovao o(a) felicita por mais um ano de vida. Deus o(a) abencoe cada vez mais. Abracos!”
	}
	
	
	
}
