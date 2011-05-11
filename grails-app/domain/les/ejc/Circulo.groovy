package les.ejc

import les.ejc.Usuario.Tipo;

class Circulo {

    Cor cor
    String nomeCirculo
    Usuario jovemCoordenador
    Usuario casalApoio

    static belongsTo = [ encontro : Encontro ]

    static hasMany = [ participantes : Usuario ]

    static constraints = {
		encontro(nullable:true, validator: {valor, objeto -> 
			for (i in valor.properties['circulos']) {
				for (j in i.properties['participantes']) {
					for (x in objeto.properties['participantes']) {
						if (i != objeto && j == x) {
							return ["erro.participantes.duplicado", x.nomeCompleto, i.nomeCirculo]
						}
					}
				}
			}
			for (i in valor.properties['circulos']) {
				for (j in i.properties['cor']) {
					if (i != objeto && j == objeto.properties['cor']) {
						return ["erro.cor.duplicado", i]
					}
				}
			}
		})
        cor(nullable:false, editable:false)
        nomeCirculo(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
        jovemCoordenador(nullable: true, validator: {valor, objeto -> 
            if (valor == null || valor.tipo == Tipo.Jovem) return true else return ["erro.tipo.invalido", valor.tipo]})
        casalApoio(nullable:false, validator: {valor, objeto -> 
            if (valor == null || valor.tipo == Tipo.Casal) return true else return ["erro.tipo.invalido", valor.tipo]})
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

	public atualizaDadosDosUsuariosDesseCirculo() {
		this.jovemCoordenador?.idCirculoQueCoordenou = this.id
		this.casalApoio?.idCirculoQueCoordenou = this.id
		for (usuario in participantes) {
			usuario.idCirculoQueParticipou = this.id
		}
	}
	
}