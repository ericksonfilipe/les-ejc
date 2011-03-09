package les.ejc

class Usuario {

    String tipo
    
    String nome
    String sobrenome
    String endereco
    String telefone
    String email
    byte[] foto
    String paroquia
    List<String> equipesTrabalhadas
    String status
    List<String> observacoes
    Date dataDeNascimento

    static constraints = {
        nome(blank : false)
	sobrenome()
	dataDeNascimento()
	email(email : true)
        tipo(inList: ["Jovem", "Casal", "Padre"])
        status(inList: ["Ativo", "Casado", "Impedido", "Sem Contato"])
    }
}