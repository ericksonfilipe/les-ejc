package les.ejc

class Usuario {

    String nomeCompleto
    String nomeUsual
    Date dataDeNascimento
    Endereco endereco
    String telefone
    String email
    byte[] foto
    String paroquia
    String equipesTrabalhadas
    String observacoes
    Status status
    Tipo tipo
    boolean j5Atual
	
    private String login
    private String senha

    static constraints = {
        nomeCompleto(blank:false, size:2..100, matches:'([a-zA-Z]| )+')
        nomeUsual(blank:true, size:2..40, matches:'([a-zA-Z]| )+')
        dataDeNascimento(nullable:true)
        endereco(nullable:true)
        telefone(blank:true, maxSize:10, minSize:10, matches:'([0-9])+')
        email(nullable:true, email:true, unique:true)
		foto(nullable:true)
        paroquia(blank:true, matches:'([a-zA-Z]| )+')
        equipesTrabalhadas(blank:true, matches:'([a-zA-Z]| )+')
        observacoes(blank:true, matches:'([a-zA-Z]| )+')
		senha(nullable:true)
		login(nullable:true)
		
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
		setSenha(novaSenha)
	}
	
	/**
	Uma vez que um usuario eh criado, testa se ele terah alguns preenchimentos automaticos
	*/
	public realizaCriacoesAutomaticas() {
		geraNomeUsualAutomatico()
		geraLoginSenhaAutomaticos()
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
			setLogin(email)
			def novaSenha = nomeUsual
			if (dataDeNascimento != null) { novaSenha += dataDeNascimento.year+1900 }
			setSenha(novaSenha)
		}
	}
		
}