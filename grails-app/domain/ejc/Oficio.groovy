package ejc

class Oficio {

	private final int tamanhoLinha = 100;
	private final String SEPARADOR_DE_LINHA = "<br />";

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
		"Oficio de Solicitacao" + SEPARADOR_DE_LINHA + pegaDestinatario() + SEPARADOR_DE_LINHA + pegaCorpo() +
			SEPARADOR_DE_LINHA + pegaFinalizacao();
	}
	
	public String pegaDestinatario() {
		return "Senhor " + "<b>" + nomeDestinatario + "</b>" + SEPARADOR_DE_LINHA + "<b>" + cargoDestinatario + "</b>" + " do(a) " + "<b>" + empresaDestinatario + "</b>";
	}
	
	public String pegaRemetente() {
		return "Eu,  " + "<b>" + nomeRemetente + "</b>" + ", brasileiro(a), " + "<b>" + estadoCivilRemetente + "</b>" + ", " + "<b>" + profissaoRemetente + 
			"</b>" + ", residente e domiciliado a " + "<b>" + enderecoRemetente + "</b>";
	}
	
	public String pegaCorpo() {
		return pegaRemetente() + ", sirvo-me do presente para solicitar a Vossa Excelencia " + "<b>" + solicitacao +
			"</b>" + " com a finalidade de " + "<b>" + objetivoSolicitacao + "</b>" + ".";
	}
	
	public String pegaLinha() {
		String linha = "";
		for(int i = 0; i < tamanhoLinha; i++)
			linha += "_";		
		return linha;
	}
	
	public String pegaFinalizacao() {
		return "Limitado ao exposto, fique com meus votos de estima e consideracao." + SEPARADOR_DE_LINHA + 
			pegaLinha() + SEPARADOR_DE_LINHA + local + ", " + data.toString() + SEPARADOR_DE_LINHA + pegaLinha() +
			SEPARADOR_DE_LINHA + nomeRemetente;
	}
}
