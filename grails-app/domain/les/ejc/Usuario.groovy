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
        email(nullable:true, blank:false, email:true, unique:true)
		foto(nullable:true)
        paroquia(blank:true, matches:'([a-zA-Z]| )+')
        equipesTrabalhadas(blank:true, matches:'([a-zA-Z]| )+')
        observacoes(blank:true, matches:'([a-zA-Z]| )+')
        j5Atual()
		login(nullable:true)
		senha(nullable:true)
    }
	
    enum Status {
	Ativo, Casado, Impedido, Sem_Contato
    }

    enum Tipo {
	Jovem, Casal, Padre
    }
	
	public String getLogin(){ return login }
	public String getSenha(){ return senha }
	public setLogin(String novoLogin) { login = novoLogin }
	public setSenha(String novaSenha) { senha = novaSenha }
	
	public alteraSenha(String novaSenha) { setSenha(novaSenha) } //alterar pra fazer testes de senha segura
	
	
	
}