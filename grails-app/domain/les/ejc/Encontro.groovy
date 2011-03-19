package les.ejc

class Encontro {

    Usuario dirigenteEspiritual
    Date data
    String tema
    String local

    static hasMany = [ circulos : Circulo ]

    static equipesDeTrabalho = [
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.COORDENACAO_GERAL),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.J5),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.COORDENACAO_DE_CIRCULOS),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.APRESENTADORES),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.BANDINHA),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.BOA_VONTADE),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.COZINHA),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.LITURGIA_E_VIGILIA),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.CORREIO_INTERNO),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.RECEPCAO_AOS_PALESTRANTES),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.SOM_E_ILUMINACAO),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.COMPRAS),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.SECRETARIA),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.TRANSITO_E_SOCIODRAMA),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.ORDEM_E_LIMPEZA),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.MINI_BOX),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.LANCHINHO),
        new EquipeDeTrabalho(nomeEquipe:EquipeDeTrabalho.NomeEquipe.VISITACAO_E_EXTERNA)
    ]

    static constraints = {
        dirigenteEspiritual(nullable:false)
        data(nullable:false)
        tema(nullable:false, blank:false)
        local(nullable:false, blank:false)
        //equipesDeTrabalho(nullable:false)
    }

}
