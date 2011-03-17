package les.ejc

class EquipesDeTrabalho {

    Equipes nome
    Usuario[] participantes
    Usuario jovemCoordenador1
    Usuario jovemCoordenador2
    Usuario casalCoordenador


    static constraints = {
        nome(nullable:false)
        jovemCoordenador1(nullable:true, tipo: Usuario.Tipo.Jovem)
        jovemCoordenador2(nullable:true, tipo: Usuario.Tipo.Jovem)
        casalApoio(nullable:true, tipo: Usuario.Tipo.Casal)
        //Deve-se ter pelo menos um coordenador por equipe.
    }

    enum Equipes {
        Coordenacao_Geral, Dirigente_Espiritual, Outros_a_definir
    }

}
