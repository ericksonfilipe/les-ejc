package les.ejc

class Telefone {

	String ddd
	String prefixo
	String sufixo
	
    static constraints = {
		ddd(blank:false, maxSize:2, minSize:2, matches:'([0-9])+')
		prefixo(blank:false, maxSize:4, minSize:4, matches:'([0-9])+')
		sufixo(blank:false, maxSize:4, minSize:4, matches:'([0-9])+')
    }
	
	String toString() {
		return "(${ddd})${prefixo}-${sufixo}";
	}
}
