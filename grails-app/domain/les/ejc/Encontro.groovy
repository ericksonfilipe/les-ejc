package les.ejc

import les.ejc.Usuario.Tipo;
import les.ejc.EquipeDeTrabalho.NomeEquipe;
import les.ejc.EquipeDeTrabalho;

class Encontro {

	Integer codigo
    Usuario dirigenteEspiritual
    Date data
    String tema
    String local
	
	//EquipeDeTrabalho coordenacao_geral
    EquipeDeTrabalho j5
    /*EquipeDeTrabalho coordenacao_de_circulos
    EquipeDeTrabalho apresentadores
    EquipeDeTrabalho bandinha
    EquipeDeTrabalho boa_vontade
    EquipeDeTrabalho cozinha
    EquipeDeTrabalho liturgia_e_vigilia
    EquipeDeTrabalho correio_interno
    EquipeDeTrabalho recepcao_aos_palestrantes
    EquipeDeTrabalho som_e_iluminacao
    EquipeDeTrabalho compras
    EquipeDeTrabalho secretaria
    EquipeDeTrabalho transito_e_sociodrama
    EquipeDeTrabalho ordem_e_limpeza
    EquipeDeTrabalho mini_box
    EquipeDeTrabalho lanchinho
    EquipeDeTrabalho visitacao_e_externa*/

    static hasMany = [circulos:Circulo]

    static constraints = {
		codigo(nullable:false, unique:true, validator: { cod, encontro -> for (Encontro e: Encontro.list()) {
															if (e.data < encontro.data && e.codigo > cod) return ["encontro.codigo.validator.dataMaior.error", encontro.data]
															if (e.data > encontro.data && e.codigo < cod) return ["encontro.codigo.validator.dataMenor.error", encontro.data]
														 }
														 return true })
        dirigenteEspiritual(nullable:false, validator: {if (it?.tipo == Tipo.Padre) return true
                                                        else return ["erro.tipo.invalido", it?.tipo]})
        data(nullable:false)
        tema(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
        local(nullable:false, blank:false)
		j5(nullable:true)
    }

	String toString() {
		return "${tema}";
	}
	

	public criaEquipesPredefinidas() {
		//coordenacao_geral
		j5 = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.J5, encontro:this).save(failOnError: true)
		/*coordenacao_de_circulos
		apresentadores
		bandinha
		boa_vontade
		cozinha
		liturgia_e_vigilia
		correio_interno,
		recepcao_aos_palestrantes
		som_e_iluminacao
		compras
		secretaria
		transito_e_sociodrama
		ordem_e_limpeza
		mini_box
		lanchinho
		visitacao_e_externa*/
	}

}
