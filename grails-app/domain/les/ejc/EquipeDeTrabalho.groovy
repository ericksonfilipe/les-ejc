package les.ejc

import les.ejc.Usuario.Tipo;

class EquipeDeTrabalho {

    NomeEquipe nomeEquipe
    Usuario jovemCoordenador1
    Usuario jovemCoordenador2
    Usuario casalCoordenador

    static hasMany = [ encontreiros : Usuario ]

    static belongsTo = [ encontro : Encontro ]

    static constraints = {
        nomeEquipe(nullable:false)
        jovemCoordenador1(nullable:true, validator: {if (it.tipo == Tipo.Jovem) return true
                                                        else return ["erro.tipo.invalido", it.tipo]})
        jovemCoordenador2(nullable:true, validator: {if (it.tipo == Tipo.Jovem) return true
                                                        else return ["erro.tipo.invalido", it.tipo]})
        casalCoordenador(nullable:true, validator: {if (it.tipo == Tipo.Casal) return true
                                                        else return ["erro.tipo.invalido", it.tipo]})
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
	
}
