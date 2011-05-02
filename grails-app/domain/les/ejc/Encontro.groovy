package les.ejc

import les.ejc.Usuario.Tipo;
import les.ejc.EquipeDeTrabalho.NomeEquipe;
import les.ejc.EquipeDeTrabalho;

class Encontro {

	Integer numero
    Usuario dirigenteEspiritual
    Date data
    String tema
    String local
	
	EquipeDeTrabalho coordenacao_geral
    EquipeDeTrabalho j5
    EquipeDeTrabalho coordenacao_de_circulos
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
    EquipeDeTrabalho visitacao_e_externa

    static hasMany = [circulos:Circulo]

    static constraints = {
		numero(nullable:false, unique:true, validator: { num, encontro -> for (Encontro e: Encontro.list()) {
															if (e.data < encontro.data && e.numero > num) return ["encontro.numero.validator.dataMaior.error", encontro.data]
															if (e.data > encontro.data && e.numero < num) return ["encontro.numero.validator.dataMenor.error", encontro.data]
														 }
														 return true })
        dirigenteEspiritual(nullable:false, validator: {if (it?.tipo == Tipo.Padre) return true
                                                        else return ["erro.tipo.invalido", it?.tipo]})
        data(nullable:false)
        tema(nullable:false, blank:false, matches:'([a-zA-Z]| )+')
        local(nullable:false, blank:false)
		
		coordenacao_geral(nullable:true)
		j5(nullable:true)
		coordenacao_de_circulos(nullable:true)
		apresentadores(nullable:true)
		bandinha(nullable:true)
		boa_vontade(nullable:true)
		cozinha(nullable:true)
		liturgia_e_vigilia(nullable:true)
		correio_interno(nullable:true)
		recepcao_aos_palestrantes(nullable:true)
		som_e_iluminacao(nullable:true)
		compras(nullable:true)
		secretaria(nullable:true)
		transito_e_sociodrama(nullable:true)
		ordem_e_limpeza(nullable:true)
		mini_box(nullable:true)
		lanchinho(nullable:true)
		visitacao_e_externa(nullable:true)
		
    }

	String toString() {
		return "${tema}";
	}
	
	public getEquipes() {
		[coordenacao_geral, j5, coordenacao_de_circulos, apresentadores, bandinha, boa_vontade, cozinha, liturgia_e_vigilia, correio_interno, recepcao_aos_palestrantes, som_e_iluminacao, compras, secretaria, transito_e_sociodrama, ordem_e_limpeza, mini_box, lanchinho, visitacao_e_externa]
	}

	public criaEquipesPredefinidas() {
		coordenacao_geral = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.COORDENACAO_GERAL, encontro:this).save(failOnError: true)
		j5 = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.J5, encontro:this).save(failOnError: true)
		coordenacao_de_circulos = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.COORDENACAO_DE_CIRCULOS, encontro:this).save(failOnError: true)
		apresentadores = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.APRESENTADORES, encontro:this).save(failOnError: true)
		bandinha = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.BANDINHA, encontro:this).save(failOnError: true)
		boa_vontade = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.BOA_VONTADE, encontro:this).save(failOnError: true)
		cozinha = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.COZINHA, encontro:this).save(failOnError: true)
		liturgia_e_vigilia = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.LITURGIA_E_VIGILIA, encontro:this).save(failOnError: true)
		correio_interno = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.CORREIO_INTERNO, encontro:this).save(failOnError: true)
		recepcao_aos_palestrantes = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.RECEPCAO_AOS_PALESTRANTES, encontro:this).save(failOnError: true)
		som_e_iluminacao = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.SOM_E_ILUMINACAO, encontro:this).save(failOnError: true)
		compras = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.COMPRAS, encontro:this).save(failOnError: true)
		secretaria = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.SECRETARIA, encontro:this).save(failOnError: true)
		transito_e_sociodrama = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.TRANSITO_E_SOCIODRAMA, encontro:this).save(failOnError: true)
		ordem_e_limpeza = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.ORDEM_E_LIMPEZA, encontro:this).save(failOnError: true)
		mini_box = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.MINI_BOX, encontro:this).save(failOnError: true)
		lanchinho = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.LANCHINHO, encontro:this).save(failOnError: true)
		visitacao_e_externa = new EquipeDeTrabalho(nomeEquipe: NomeEquipe.VISITACAO_E_EXTERNA, encontro:this).save(failOnError: true)
	}

}
