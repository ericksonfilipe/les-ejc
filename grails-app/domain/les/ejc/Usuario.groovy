package les.ejc

class Usuario {

    String nome
    String sobrenome
    
    static constraints = {
        nome(nullable:false, blank:false, size:2..20)
        sobrenome(nullable:false, blank:false, size:2..100)
    }
}
