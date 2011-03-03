package les.ejc

/*
 * nome e sobrenome nao permitem o uso de acentos
*/

class Usuario {

    String nome
    String sobrenome
    Endereco endereco
    
    static constraints = {
        nome(nullable:false, blank:false, size:2..20, matches:'([a-zA-Z]| )+')
        sobrenome(nullable:false, blank:false, size:2..100, matches:'([a-zA-Z]| )+')
        endereco(nullable:false, blank:false)
    }
}
