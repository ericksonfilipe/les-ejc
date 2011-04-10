package les.ejc

import les.ejc.Usuario.Tipo;

class Encontro {

    Usuario dirigenteEspiritual
    Date data
    String tema
    String local

    static hasMany = [circulos:Circulo, equipesDeTrabalho:EquipeDeTrabalho]

    static constraints = {
        dirigenteEspiritual(nullable:false, validator: {if (it.tipo == Tipo.Padre) return true
                                                        else return ["erro.tipo.invalido", it.tipo]})
        data(nullable:false)
        tema(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
        local(nullable:false, blank:false)
    }
	
	String toString() {
		return "${tema}";
	}

}
