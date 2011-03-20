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
        tema(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
        local(nullable:false, blank:false)
    }
	
	String toString() {
		return "${tema}";
	}

}
