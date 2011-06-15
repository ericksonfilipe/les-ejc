package les.ejc

class FuncaoJCinco {
	
	Calendar dataInicio
	Calendar dataFim
	EnumFuncao funcao
	
	static belongsTo = [usuario : Usuario]
	
    static constraints = {
		dataInicio(nullable: false)
		funcao(nullable: false)
		dataFim(nullable: true)
    }
	
	enum EnumFuncao {
		PosEncontro, Montagem, Financas, Palestras, Fichas
	}
	
	String toString() {
		return "${funcao}"
	}
}