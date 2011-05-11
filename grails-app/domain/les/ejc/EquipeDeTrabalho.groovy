package les.ejc

import les.ejc.Usuario.Tipo;

class EquipeDeTrabalho {

    NomeEquipe nomeEquipe
    Usuario jovemCoordenador1
    Usuario jovemCoordenador2
    Usuario casalCoordenador
	Encontro encontro

    static hasMany = [ encontreiros : Usuario ]

    static constraints = {
		encontro(nullable:true, validator: {valor, objeto -> 
			for (i in valor?.getEquipes()) {
				for (j in i?.encontreiros) {
					for (x in objeto?.encontreiros) {
						if (i != objeto && j == x) {
							return ["erro.encontreiro.duplicado", x.nomeCompleto, i.nomeEquipe]
						}
					}
				}
			}
		})
        nomeEquipe(nullable:true)
        jovemCoordenador1(nullable: true, validator: {valor, objeto -> 
            if (valor != null && valor == objeto.properties['jovemCoordenador2']) return ["erro.coordenador.duplicado", valor.nomeUsual] 
			else if (valor == null || valor.tipo == Tipo.Jovem) return true 
			else return ["erro.tipo.invalido", valor.tipo]})
        jovemCoordenador2(nullable: true, validator: {valor, objeto -> 
            if (valor == null || valor.tipo == Tipo.Jovem) return true else return ["erro.tipo.invalido", valor.tipo]})
        casalCoordenador(nullable: true, validator: {valor, objeto -> 
            if (valor == null || valor.tipo == Tipo.Casal) return true else return ["erro.tipo.invalido", valor.tipo]})
    }

    enum NomeEquipe {
        COORDENACAO_GERAL,
        J5,
        COORDENACAO_DE_CIRCULOS,
        APRESENTADORES,
        BANDINHA,
        BOA_VONTADE,
        COZINHA,
        LITURGIA_E_VIGILIA,
        CORREIO_INTERNO,
        RECEPCAO_AOS_PALESTRANTES,
        SOM_E_ILUMINACAO,
        COMPRAS,
        SECRETARIA,
        TRANSITO_E_SOCIODRAMA,
        ORDEM_E_LIMPEZA,
        MINI_BOX,
        LANCHINHO,
        VISITACAO_E_EXTERNA
    }

	String toString() {
		return "${nomeEquipe}";
	}
	
        String toStringEncontreiros() {
            return encontreiros.join(", ")

        }

}
