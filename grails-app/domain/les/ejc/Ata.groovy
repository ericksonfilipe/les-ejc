package les.ejc

class Ata {

	Calendar data
	String pauta
	static hasMany = [pessoasPresentes:Usuario, pessoasAusentes:Usuario]

    static constraints = {
		data()
		
//		dirigenteEspiritual(nullable:false, validator: {if (it.tipo == Tipo.Padre) return true else return ["erro.tipo.invalido", it.tipo]})
//		 senha2(validator:  {valor, objeto -> if (objeto.properties['senha2'] == valor) return true else return "erro.senhas.diferentes" })
		pessoasPresentes(nullable:false, minSize:2)
		pessoasAusentes(validator: {valor, objeto -> 
		for (Usuario u : valor)
		    if (objeto.properties['pessoasPresentes'].contains(u)) return  "erro.valor.invalido";
        return true })
		
//		pessoasAusentes()
		pauta(nullable:false, blank:false, maxSize:2000)
    }

	String toString() {
		return "Ata da reunião do dia: ${data}"
	}
}
