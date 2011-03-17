package les.ejc

class Circulo {

    Cor cor
    String nome
    Usuario[] participantes
    Usuario jovemCoordenador
    Usuario casalApoio

    static constraints = {
        cor(nullable:false)
        nome(nullable:false)
        jovemCoordenador(nullable:false, tipo: Usuario.Tipo.Jovem)
        casalApoio(nullable:false, tipo: Usuario.Tipo.Casal)
    }

    enum Cor {
	Azul, Vermelho, Amarelo, Verde, Laranja, Rosa, Lilas, Marrom
    }
}
