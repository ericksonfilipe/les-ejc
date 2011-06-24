package les.ejc

import java.util.Random

class Usuario {

    String nomeCompleto
	String nomeCompleto2
    String nomeUsual
    Date dataDeNascimento
	Date dataDeNascimento2
	
    String rua
    Integer numero
    String complemento
    String bairro
    String cidade
    String estado	
	
    String telefone1
    String telefone2
    String telefone3
    
    String email
	String email2
    byte[] foto
	byte[] ficha
    String paroquia
    String equipesTrabalhadas
    String observacoes
    Status status
    Tipo tipo
    boolean j5Atual
	boolean foiJ5
    boolean emailEnviado
	
	Integer idCirculoQueParticipou
	Integer idCirculoQueCoordenou
	
	Integer[] idsEquipesQueParticipouEmSaoCristovao
	Integer[] idsEquipesQueCoordenouEmSaoCristovao
	
    private String login
    private String senha

	static hasMany = [atas:Ata, funcoes : FuncaoJCinco]
	static belongsTo = [Ata]
	
    static constraints = {
		funcoes(nullable:true)
        rua(nullable:true, blank:false, size:2..100)
		numero(nullable:true, blank:false)
		complemento(nullable:true, blank:false, size:2..100)
        bairro(nullable:true, blank:false, size:2..100)
        cidade(nullable:true, blank:false, size:2..100)
        estado(nullable:true, blank:false, inList:["PB", "AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"])
        nomeCompleto(blank:false, size:2..100, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
		nomeCompleto2(nullable:true, size:2..100, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+', validator: {nome, usuario ->
																						if (nome!= null && usuario.tipo != Tipo.Casal) 
																						return ["usuario.nome2.error.usuarioNaoCasal"]
																						else return true})
        nomeUsual(blank:true, size:2..40, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
        dataDeNascimento(nullable:true)
		dataDeNascimento2(nullable:true, validator: {nascimento, usuario -> if (nascimento!= null && usuario.tipo != Tipo.Casal) 
														return ["usuario.dataDeNascimento2.error.usuarioNaoCasal"]
														else return true})
        telefone1(blank:true, maxSize:13, minSize:13, matches:'\\([0-9][0-9]\\)[0-9][0-9][0-9][0-9]\\-[0-9][0-9][0-9][0-9]', validator: {valor, objeto -> 
			if (valor != "" && (objeto.telefone2 == valor || objeto.telefone3 == valor)) return ["erro.telefone.duplicado", valor] else return true })
		telefone2(blank:true, maxSize:13, minSize:13, matches:'\\([0-9][0-9]\\)[0-9][0-9][0-9][0-9]\\-[0-9][0-9][0-9][0-9]', validator: {valor, objeto -> 
			if (valor != "" && (objeto.telefone1 == valor || objeto.telefone3 == valor)) return ["erro.telefone.duplicado", valor] else return true })
		telefone3(blank:true, maxSize:13, minSize:13, matches:'\\([0-9][0-9]\\)[0-9][0-9][0-9][0-9]\\-[0-9][0-9][0-9][0-9]', validator: {valor, objeto -> 
			if (valor != "" && (objeto.telefone1 == valor || objeto.telefone2 == valor)) return ["erro.telefone.duplicado", valor] else return true })
        email(nullable:true, email:true, unique:true)
		email2(nullable:true, email:true, unique:true, validator: {e, usuario -> if ((e!= null && e != "") && usuario.tipo != Tipo.Casal) 
														return ["usuario.email2.error.usuarioNaoCasal"]
														else return true})
		foto(nullable:true)
		ficha(nullable:true)
        paroquia(blank:true, matches:'([a-zA-Z]| )+')
        equipesTrabalhadas(blank:true)
        observacoes(blank:true, matches:'([a-zA-Z]| )+')
		senha(nullable:true, password:true, minSize:8)
		login(nullable:true, unique:true)
		j5Atual()
		idCirculoQueParticipou(nullable:true)
		idCirculoQueCoordenou(nullable:true)
		idsEquipesQueParticipouEmSaoCristovao(nullable:true)
		idsEquipesQueCoordenouEmSaoCristovao(nullable:true)	
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
                emailEnviado = false
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
	public geraNomeUsualAutomatico() {
		if (nomeUsual.equals("")) {
			nomeUsual = nomeCompleto.split(" ")[0]
			if (nomeCompleto2 != null && !nomeCompleto2?.equals("")) {
				nomeUsual += " e "+nomeCompleto2.split(" ")[0]
			}
		}
	}

	/**
	Se usuario tem email e eh cadastrado Ativo, deve ter login e senha
	*/
	private geraLoginSenhaAutomaticos() {
        if (email != null) {
			login = email
			//def novaSenha = nomeUsual
			//if (dataDeNascimento != null) { novaSenha += dataDeNascimento.get(Calendar.YEAR) }
			senha = getSenhaAleatoria(8)
		}
	}

	String toString() {
		return "${nomeUsual}";
	}
	
	String endereco() {
		return "Rua: ${rua} - numero: ${numero}. ${bairro} - ${cidade}/${estado} ";
	}
		
}
