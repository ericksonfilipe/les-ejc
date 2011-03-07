package les.ejc

class Usuario {

	String nome
	String sobrenome
	String apelido
	Date dataDeNascimento
	String email
	Status status
	
	private String login
	private String senha

    static constraints = {
		nome(blank : false)
		sobrenome()
		apelido()
		dataDeNascimento()
		email(email : true)
	}
	
}

enum Status {
	ATIVO, INATIVO
}
