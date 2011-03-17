package les.ejc

class Encontro {

    Usuario dirigenteEspiritual
    Circulo[] circulos
    EquipesDeTrabalho[] equipes
    Date data
    String tema
    String local

    static constraints = {
        dirigenteEspiritual(nullable:false)
        circulos(nullable:false)
        equipes(nullable:false)
        data(nullable:false)
        tema(nullable:false, blank:false)
        local(nullable:false, blank:false)
    }
}
