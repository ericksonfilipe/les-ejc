package les.ejc

import java.util.Random

class Usuario {

    String nomeCompleto
    String nomeUsual
    Calendar dataDeNascimento
	
    Telefone telefone1
    Telefone telefone2
    Telefone telefone3
    
    String email
    byte[] foto
	byte[] ficha
    String paroquia
    String equipesTrabalhadas
    String observacoes
    Status status
    Tipo tipo
    boolean j5Atual
	
    private String login
    private String senha

	static hasMany = [atas:Ata]
	static belongsTo = [Ata]
	static hasOne = [ endereco : Endereco ]

	
    static constraints = {
        nomeCompleto(blank:false, size:2..100, matches:'([a-zA-Z]| )+')
        nomeUsual(blank:true, size:2..40, matches:'([a-zA-Z]| )+')
        dataDeNascimento(nullable:true)
        endereco(nullable:true)
		telefone1(nullable:true)
		telefone3(nullable:true)
		telefone2(nullable:true)
		//telefone1(blank:true, maxSize:13, minSize:13, matches:'.[0-9][0-9].[0-9][0-9][0-9][0-9].[0-9][0-9][0-9][0-9]')
        //telefone2(blank:true, maxSize:13, minSize:13, matches:'.[0-9][0-9].[0-9][0-9][0-9][0-9].[0-9][0-9][0-9][0-9]')
        //telefone3(blank:true, maxSize:13, minSize:13, matches:'.[0-9][0-9].[0-9][0-9][0-9][0-9].[0-9][0-9][0-9][0-9]')
        email(nullable:true, email:true, unique:true)
		foto(nullable:true)
		ficha(nullable:true)
        paroquia(blank:true, matches:'([a-zA-Z]| )+')
        equipesTrabalhadas(blank:true, matches:'([a-zA-Z]| )+')
        observacoes(blank:true, matches:'([a-zA-Z]| )+')
		//senha(nullable:true, password:true, minSize:8)
		senha(nullable:true, password:true)
		login(nullable:true, unique:true)
		j5Atual()
    }
	
    enum Status {
	Ativo, Casado, Impedido, Sem_Contato
    }

    enum Tipo {
	Jovem, Casal, Padre
    }
	
	public String getLogin(){
		return login
	}
	
	public setLogin(String novoLogin) {
		login = novoLogin
	}
	
	public String getSenha(){
		return senha
	}
	
	public setSenha(String novaSenha) {
		senha = novaSenha
	}
	
	/**
	Altera a senha fazendo testes de senha segura - metodo a ser modificado dependendo do cliente
	*/
	public alteraSenha(String novaSenha) {
		senha=novaSenha
	}
	
	/**
	Uma vez que um usuario eh criado, testa se ele terah alguns preenchimentos automaticos
	*/
	public realizaCriacoesAutomaticas() {
		geraNomeUsualAutomatico()
		geraLoginSenhaAutomaticos()
	}
	
	private String getSenhaAleatoria(int digitos) {
		String senha = "";
		(1..digitos).each {  
			senha += getRandomChar()
		}
		
		return senha
	}
	
	private String getRandomChar() {
		def randomIntegerList = []
		
		randomIntegerList << getRandomNumber()
		randomIntegerList << getRandomCharMaiusculo()
		randomIntegerList << getRandomCharMinusculo()
		
		Random random = new Random()
		return randomIntegerList[random.nextInt(3)]
	}
	
	private String getRandomNumber() {
		Random random = new Random()
		return (char) (48 + random.nextInt(10))
	}
	
	private String getRandomCharMaiusculo() {
		Random random = new Random()
		return (char) (65 + random.nextInt(26))
	}
	
	private String getRandomCharMinusculo() {
		Random random = new Random()
		return (char) (97 + random.nextInt(26))
	}
	
	/**
	Se usuario tem nomeUsual em branco, deve ser seu primeiro nome
	*/
	private geraNomeUsualAutomatico() {
		if (nomeUsual.equals("")) {
			nomeUsual = nomeCompleto.split(" ")[0]
		}
	}

	/**
	Se usuario tem email e eh cadastrado Ativo, deve ter login e senha
	*/
	private geraLoginSenhaAutomaticos() {
        if (status == Status.Ativo && (email != null)) {
			login = email
			//def novaSenha = nomeUsual
			//if (dataDeNascimento != null) { novaSenha += dataDeNascimento.get(Calendar.YEAR) }
			senha = getSenhaAleatoria(8)
		}
	}

	String toString() {
		return "${nomeCompleto}";
	}
		
}
