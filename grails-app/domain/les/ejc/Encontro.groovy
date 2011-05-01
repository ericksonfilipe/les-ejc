package les.ejc

import les.ejc.Usuario.Tipo;

class Encontro {

	Integer codigo
    Usuario dirigenteEspiritual
    Date data
    String tema
    String local

    static hasMany = [circulos:Circulo, equipesDeTrabalho:EquipeDeTrabalho]

    static constraints = {
		codigo(nullable:false, unique:true, validator: { cod, encontro -> for (Encontro e: Encontro.list()) {
															if (e.data < encontro.data && e.codigo > cod) return ["encontro.codigo.validator.dataMaior.error", e.data]
															if (e.data > encontro.data && e.codigo < cod) return ["encontro.codigo.validator.dataMenor.error", e.data]
														 }
														 return true })
        dirigenteEspiritual(nullable:false, validator: {if (it?.tipo == Tipo.Padre) return true
                                                        else return ["erro.tipo.invalido", it?.tipo]})
        data(nullable:false)
        tema(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
        local(nullable:false, blank:false)
    }

	String toString() {
		return "${tema}";
	}

}
