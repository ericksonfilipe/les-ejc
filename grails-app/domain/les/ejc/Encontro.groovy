package les.ejc

class Encontro {

    Usuario dirigenteEspiritual
    //Circulo[] circulos
    //EquipesDeTrabalho[] equipes
    Date data
    String tema
    String local

    /*
    static hasMany = [circulos:Circulo]
    static belongsTo = Circulo
    static mapping = {
        circulos column:'circulos', joinTable:'circulo_tema'
    }


    static hasMany = [equipes:Usuario]
    static belongsTo = Usuario
    static mapping = {
        equipes column:'equipeDeTrabalho', joinTable:'usuario_nomeEquipe'
    }
    */

    static constraints = {
        dirigenteEspiritual(nullable:false)
        //circulos(nullable:false)
        //equipes(nullable:false)
        data(nullable:false)
        tema(nullable:false, blank:false)
        local(nullable:false, blank:false)
    }
}
