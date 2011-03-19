package les.ejc

class Circulo {

    Cor cor
    String nomeCirculo
    Usuario jovemCoordenador
    Usuario casalApoio

    static belongsTo = [ encontro : Encontro ]

    static hasMany = [ participantes : Usuario ]

    //static mapping = {
    //    sort nomeCirculo:"desc"
    //}

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
