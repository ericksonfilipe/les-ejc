package les.ejc

class Circulo {

    Cor cor
    String nomeCirculo
    Usuario jovemCoordenador
    Usuario casalApoio

    static belongsTo = [ encontro : Encontro ]

    static hasMany = [ participantes : Usuario ]

    static constraints = {
        cor(nullable:false, editable:false)
        nomeCirculo(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
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
	
	String toString() {
		return "${nomeCirculo}";
	}

}