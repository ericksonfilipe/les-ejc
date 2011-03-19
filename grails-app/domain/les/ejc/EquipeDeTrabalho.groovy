package les.ejc

class EquipeDeTrabalho {

    NomeEquipe nomeEquipe
    Usuario jovemCoordenador1
    Usuario jovemCoordenador2
    Usuario casalCoordenador

    static hasMany = [ encontreiros : Usuario ]

    static belongsTo = [ encontro : Encontro ]

    static constraints = {
        nomeEquipe(nullable:false)
        jovemCoordenador1(nullable:true, tipo: Usuario.Tipo.Jovem)
        jovemCoordenador2(nullable:true, tipo: Usuario.Tipo.Jovem)
        casalCoordenador(nullable:true, tipo: Usuario.Tipo.Casal)    
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

}