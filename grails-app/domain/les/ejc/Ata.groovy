package les.ejc

class Ata {

	Calendar data
	String pauta
	static hasMany = [pessoasPresentes:Usuario, pessoasAusentes:Usuario]

    static constraints = {
		data()
		pessoasPresentes(nullable:false, minSize:2)
		pessoasAusentes()
		pauta(nullable:false, blank:false, maxSize:2000)
    }

	String toString() {
		return "Ata da reunião do dia: ${data}"
	}
}
