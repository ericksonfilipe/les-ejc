package les.ejc

class EquipeDeTrabalho {

    NomeEquipe nomeEquipe
    //Usuario[] participantes
    Usuario jovemCoordenador1
    Usuario jovemCoordenador2
    Usuario casalCoordenador

    /*
    static hasMany = [participantes:Usuario]
    static belongsTo = Usuario
    static mapping = {
        participantes column:'equipeDeTrabalho', joinTable:'usuario_nomeEquipe'
    }

    static has = [encontro:Encontro]
    static mapping = {
        encontro column:'equipeDeTrabalho_id', joinTable:'equipeDeTrabalho_tema'
    }
    */

    static constraints = {
        nomeEquipe(nullable:false)
        jovemCoordenador1(nullable:true, tipo: Usuario.Tipo.Jovem)
        jovemCoordenador2(nullable:true, tipo: Usuario.Tipo.Jovem)
        casalCoordenador(nullable:true, tipo: Usuario.Tipo.Casal)
        //Deve-se ter pelo menos um coordenador por equipe.
    }

    enum NomeEquipe {
        DIRIGENTE_ESPIRITUAL,
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
