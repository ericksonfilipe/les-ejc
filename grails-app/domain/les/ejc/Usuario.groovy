package les.ejc

class Usuario {

    Tipo tipo
    String nome
    String sobrenome
    String apelido
    String endereco
    String telefone
    String email
    byte[] foto
    String paroquia
    String equipesTrabalhadas
    Status status
    String observacoes
    Date dataDeNascimento
	
    private String login
    private String senha

    static constraints = {
        nome(blank:false, size:2..40, matches:'([a-zA-Z]| )+')
        sobrenome(blank:false, size:2..100, matches:'([a-zA-Z]| )+')
        sobrenome()
	dataDeNascimento()
	email(email : true)
    }
	
    enum Status {
	ATIVO, INATIVO
    }

    enum Tipo {
	Jovem, Casal, Padre
    }
}