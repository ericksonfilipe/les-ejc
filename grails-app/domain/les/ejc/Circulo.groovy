package les.ejc

class Circulo {

    Cor cor
    String nomeCirculo
    //Usuario[] participantes
    Usuario jovemCoordenador
    Usuario casalApoio

    /*
    static hasMany = [participantes:Usuario]
    static belongsTo = Usuario
    static mapping = {
        participantes column:'circulo', joinTable:'usuario_nomeCirculo'
    }

    static has = [encontro:Encontro]
    static mapping = {
        encontro column:'circulo_id', joinTable:'circulo_tema'
    }
    */

    static constraints = {
        cor(nullable:false)
        nomeCirculo(nullable:false)
        jovemCoordenador(nullable:false, tipo: Usuario.Tipo.Jovem)
        casalApoio(nullable:false, tipo: Usuario.Tipo.Casal)
    }

    enum Cor {
	Azul,
        Vermelho,
        Amarelo,
        Verde,
        Laranja,
        Rosa,
        Lilas,
        Marrom
    }
}
