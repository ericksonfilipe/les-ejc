package les.ejc

class Encontro {

    Usuario dirigenteEspiritual
    Date data
    String tema
    String local

    static hasMany = [circulos:Circulo, equipesDeTrabalho:EquipeDeTrabalho]

    static constraints = {
        dirigenteEspiritual(nullable:false)
        data(nullable:false)
        tema(nullable:false, blank:false)
        local(nullable:false, blank:false)
    }

}
