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
        nomeUsual(size:2..40, matches:'([a-zA-Z]| )+')
        dataDeNascimento()
        endereco(nullable:true)
        telefone(maxSize:10, minSize:10, matches:'([0-9])+')
        email(email:true)
        paroquia()
        equipesTrabalhadas()
        observacoes()
        j5Atual()
    }
	
    enum Status {
	ATIVO, INATIVO
    }

    enum Tipo {
	Jovem, Casal, Padre
    }
}