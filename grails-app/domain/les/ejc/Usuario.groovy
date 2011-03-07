package les.ejc

class Usuario {

	String nome
	String sobrenome
	String apelido
	Date dataDeNascimento
	String email

    static constraints = {
		nome(blank : false)
		sobrenome()
		dataDeNascimento()
		email(email : true)
    }
}
