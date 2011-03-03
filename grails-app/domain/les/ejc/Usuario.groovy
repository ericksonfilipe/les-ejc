package les.ejc

class Usuario {

    String nome
    String sobrenome
    
    static constraints = {
        nome(nullable:false, blank:false, size:2..20, matches:'[a-zA-Z]+')
        sobrenome(nullable:false, blank:false, size:2..100, matches:'([a-zA-Z]| )+')
    }
}
