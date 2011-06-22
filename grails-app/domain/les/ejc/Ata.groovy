package les.ejc

class Ata {

	Date data
	String pauta
	static hasMany = [pessoasPresentes:Usuario, pessoasAusentes:Usuario]

    static constraints = {
		data()
		pessoasPresentes(nullable:false, minSize:2)

		pessoasAusentes(validator: {valor, objeto -> 
		for (Usuario u : valor)
		    if (objeto.properties['pessoasPresentes'].contains(u)) return  "erro.valor.invalido";
        return true })
        
		pauta(nullable:false, blank:false, maxSize:2000)
    }

	String toString() {
		return "Ata da reunião do dia: ${data}"
	}
}
