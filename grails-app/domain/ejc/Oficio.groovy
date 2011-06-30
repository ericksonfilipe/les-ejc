package ejc

class Oficio {

	private final int tamanhoLinha = 100;
	private final String SEPARADOR_DE_LINHA = "<br>";

	String nomeDestinatario
	String cargoDestinatario
	String empresaDestinatario
	
	String nomeRemetente
	String estadoCivilRemetente
	String profissaoRemetente
	String enderecoRemetente
	
	String solicitacao
	String objetivoSolicitacao
	
	String local
	Date data

    static constraints = {
		nomeRemetente(blank:false, size:2..100, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
		estadoCivilRemetente(inList:["Solteiro(a)", "Casado(a)", "Separado(a)", "Divorciado(a)", "Viúvo(a)"])
		profissaoRemetente(blank:false, size:2..100, matches:'([a-zA-Z]||é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
		enderecoRemetente(blank:false, size:2..200)
		
		nomeDestinatario(blank:false, size:2..100, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
		cargoDestinatario(blank:false, size:2..100, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
		empresaDestinatario(blank:false, size:2..100)
		
		solicitacao(blank:false, size:2..500)
		objetivoSolicitacao(blank:false, size:2..500)
		local(blank:false, size:2..100, matches:'([a-zA-Z]|é|É|á|Á|ó|Ó|ã|Ã|ü|Ü|ç|Ç|ô|Ô| |)+')
    }
	
    public getOficio() {
		"Oficio de Solicitacao" + SEPARADOR_DE_LINHA + getDestinatario() + SEPARADOR_DE_LINHA + getCorpo() +
			SEPARADOR_DE_LINHA + getFinalizacao();
	}
	
	private String getDestinatario() {
		return "Senhor " + nomeDestinatario + SEPARADOR_DE_LINHA + cargoDestinatario + " do(a) " + empresaDestinatario;
	}
	
	private String getRemetente() {
		return "Eu,  " + nomeRemetente + ", brasileiro(a), " + estadoCivilRemetente + ", " + profissaoRemetente + 
			", residente e domiciliado a " + enderecoRemetente;
	}
	
	private String getCorpo() {
		return getRemetente() + ", sirvo-me do presente para solicitar a Vossa Excelencia " + solicitacao +
			" com a finalidade de " + objetivoSolicitacao + ".";
	}
	
	private String getLinha() {
		String linha = "";
		for(int i = 0; i < tamanhoLinha; i++)
			linha += "_";		
		return linha;
	}
	
	private String getFinalizacao() {
		return "Limitado ao exposto, fique com meus votos de estima e consideracao." + SEPARADOR_DE_LINHA + 
			getLinha() + SEPARADOR_DE_LINHA + local + ", " + data.toString() + SEPARADOR_DE_LINHA + getLinha() +
			SEPARADOR_DE_LINHA + nomeRemetente;
	}
}
