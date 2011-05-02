package les.ejc

class Circulo {

    Cor cor
    String nomeCirculo
    Usuario jovemCoordenador
    Usuario casalApoio

    static belongsTo = [ encontro : Encontro ]

    static hasMany = [ participantes : Usuario ]

    static constraints = {
		encontro(nullable:true, validator: {valor, objeto -> 
			for (i in valor?.circulos) {
				for (j in i?.participantes) {
					for (x in objeto?.participantes) {
						if (i != objeto && j == x) {
							return ["erro.participantes.duplicado", x.nomeCompleto, i.nomeCirculo]
						}
					}
				}
			}
		})
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
	
	Boolean setCor() {
		//se jah tiver um circulo com aquela cor, nao criar outro
	}

}