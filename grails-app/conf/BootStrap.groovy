import les.ejc.Usuario
import les.ejc.Encontro
import les.ejc.Circulo
import les.ejc.EquipeDeTrabalho
import les.ejc.Oficio

class BootStrap {

    def init = { servletContext ->
		println("-------------------------------Iniciando Servidor")
		println("Cadastrando Usuarios...")
		println("Cadastrando Usuario Admin...")
		new Usuario(nomeCompleto:"admin", nomeUsual:"admin", dataDeNascimento:null,
					endereco:null, email:"admin@plecas.com", foto:null, telefone1:"", telefone2:"", telefone3:"",
					paroquia:"", equipesTrabalhadas:"", observacoes:"", idCirculoQueParticipou:null, idCirculoQueCoordenou:null,
					idsEquipesQueParticipouEmSaoCristovao:null, idsEquipesQueCoordenouEmSaoCristovao:null,
					status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:true, emailEnviado: true, login:"admin", senha:new String("admin123".encodeAsMD5Hex())).save(failOnError: true)
		println("Usuario Admin cadastrado!")
		println("Cadastrando Usuario Andre...")
		new Usuario(nomeCompleto:"Andre", nomeUsual:"Andre", dataDeNascimento:null,
					endereco:null, email:"andre@plecas.com", foto:null, telefone1:"", telefone2:"", telefone3:"",
					paroquia:"", equipesTrabalhadas:"", observacoes:"", idCirculoQueParticipou:null, idCirculoQueCoordenou:null,
					idsEquipesQueParticipouEmSaoCristovao:null, idsEquipesQueCoordenouEmSaoCristovao:null,
					status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Padre, j5Atual:false, emailEnviado: true, login:"andre", senha:new String("andre123".encodeAsMD5Hex())).save(failOnError: true)
		println("Usuario Andre cadastrado!")
		println("Cadastrando Usuario Casal...")
		new Usuario(nomeCompleto:"Casado", nomeCompleto2:"Casada", nomeUsual:"Casado e Casada", dataDeNascimento:null,
					endereco:null, email:"casal@plecas.com", foto:null, telefone1:"", telefone2:"", telefone3:"",
					paroquia:"", equipesTrabalhadas:"", observacoes:"", idCirculoQueParticipou:null, idCirculoQueCoordenou:null,
					idsEquipesQueParticipouEmSaoCristovao:null, idsEquipesQueCoordenouEmSaoCristovao:null,
					status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Casal, j5Atual:false, emailEnviado: true, login:"casal", senha:new String("casal123".encodeAsMD5Hex())).save(failOnError: true)
		println("Usuario Casal cadastrado!")
		println("Usuarios cadastrados!")
		println()
		
		println("Cadastrando Encontros...")
		println("Cadastrando Encontro Mei do Mato e, portanto, as equipes predefinidas...")
		new Encontro(numero:1, dirigenteEspiritual:Usuario.findByEmail("andre@plecas.com"),
						coordenacao_geral: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.COORDENACAO_GERAL,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						j5: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.J5,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						coordenacao_de_circulos: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.COORDENACAO_DE_CIRCULOS,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						apresentadores: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.APRESENTADORES,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						bandinha: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.BANDINHA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						boa_vontade: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.BOA_VONTADE,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						cozinha: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.COZINHA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						liturgia_e_vigilia: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.LITURGIA_E_VIGILIA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						correio_interno: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.CORREIO_INTERNO,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						recepcao_aos_palestrantes: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.RECEPCAO_AOS_PALESTRANTES,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						som_e_iluminacao: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.SOM_E_ILUMINACAO,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						compras: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.COMPRAS,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						secretaria: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.SECRETARIA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						transito_e_sociodrama: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.TRANSITO_E_SOCIODRAMA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						ordem_e_limpeza: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.ORDEM_E_LIMPEZA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						mini_box: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.MINI_BOX,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						lanchinho: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.LANCHINHO,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
						visitacao_e_externa: new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.VISITACAO_E_EXTERNA,
										jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
										casalCoordenador: Usuario.findByEmail("casal@plecas.com")).save(failOnError: true),
		
						data: new Date() , tema: "Mei do Mato", local:"Manaus").save(failOnError: true)
		println("Encontro Mei do Mato cadastrado!")
		println("Encontros e suas Equipes cadastradas!")
		println()
		
		println("Cadastrando Circulos...")
		println("Cadastrando Circulo Azul...")
		new Circulo(cor: Circulo.Cor.Azul, nomeCirculo: "Sem civilizacao", jovemCoordenador: Usuario.findByEmail("admin@plecas.com"), 
		casalApoio: Usuario.findByEmail("casal@plecas.com"), encontro: Encontro.findByTema("Mei do Mato")).save(failOnError: true)
		println("Circulo Azul cadastrado!")
		println("Circulos cadastrados!")
		println()
		
		println("Cadastrando Oficio...")
		new Oficio(nomeDestinatario: "Lula", cargoDestinatario: "Presidente", empresaDestinatario: "Brasil",
			nomeRemetente: "Andre Farias", estadoCivilRemetente: "Solteiro(a)", profissaoRemetente: "CEO",
			enderecoRemetente: "Rua: Bossuet Wanderley, no. 74, centro", solicitacao: "1 trilhao de reais",
			objetivoSolicitacao: "Ser o homem mais rico do mundo", local: "Patos", data: new Date()).save(failOnError: true)
		println("Oficio cadastrado!")
		println()
		
		println("Usuarios:")
		println("Login     Senha")
		println(Usuario.findByEmail("admin@plecas.com").login + "     admin123")
		println(Usuario.findByEmail("andre@plecas.com").login + "     andre123")
		println(Usuario.findByEmail("casal@plecas.com").login + "     casal123")
		println("-------------------------------------------------")
		
    }
    def destroy = {
    }
}
