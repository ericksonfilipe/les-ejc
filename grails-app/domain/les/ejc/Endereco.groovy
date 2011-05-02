package les.ejc

class Endereco {

    String rua
    int numero
    String complemento
    String bairro
    String cidade
    String estado
	
	static belongsTo = [usuario : Usuario ]

    static constraints = {
        rua(blank:false, size:2..100)
        bairro(blank:false, size:2..100)
        cidade(blank:false, size:2..100)
        estado(inList:["PB", "AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"])
    }
	
	String toString() {
		return "Rua: ${rua} - numero: ${numero}. ${bairro} - ${cidade}/${estado} ";
	}

}
