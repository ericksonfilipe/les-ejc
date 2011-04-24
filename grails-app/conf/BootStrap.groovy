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
		new Usuario(nomeCompleto:"admin", nomeUsual:"", dataDeNascimento:null,
					endereco:null, email:"admin@plecas.com", foto:null, 
					paroquia:"", equipesTrabalhadas:"", observacoes:"",
					status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:true, login:"admin", senha:new String("admin".encodeAsMD5Hex())).save(failOnError: true)
		println("Usuario Admin cadastrado!")
		println("Cadastrando Usuario Andre...")
		new Usuario(nomeCompleto:"Andre", nomeUsual:"", dataDeNascimento:null,
					endereco:null, email:"andre@plecas.com", foto:null, 
					paroquia:"", equipesTrabalhadas:"", observacoes:"",
					status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Padre, j5Atual:false, login:"andre", senha:new String("andre".encodeAsMD5Hex())).save(failOnError: true)
		println("Usuario Andre cadastrado!")
		println("Cadastrando Usuario Casal...")
		new Usuario(nomeCompleto:"Casal", nomeUsual:"", dataDeNascimento:null,
					endereco:null, email:"casal@plecas.com", foto:null, 
					paroquia:"", equipesTrabalhadas:"", observacoes:"",
					status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Casal, j5Atual:false, login:"casal", senha:new String("casal".encodeAsMD5Hex())).save(failOnError: true)
		println("Usuario Casal cadastrado!")
		println("Usuarios cadastrados!")
		println()
		
		println("Cadastrando Encontros...")
		println("Cadastrando Encontro Mei do Mato...")
		new Encontro(dirigenteEspiritual:Usuario.findByEmail("andre@plecas.com") , data: new Date() , tema: "Mei do Mato", local:"Manaus").save(failOnError: true)
		println("Encontro Mei do Mato cadastrado!")
		println("Encontros cadastrados!")
		println()
		
		println("Cadastrando Circulos...")
		println("Cadastrando Circulo Azul...")
		new Circulo(cor: Circulo.Cor.Azul, nomeCirculo: "Sem civilizacao", jovemCoordenador: Usuario.findByEmail("andre@plecas.com"), 
		casalApoio: Usuario.findByEmail("admin@plecas.com"), encontro: Encontro.findByTema("Mei do Mato")).save(failOnError: true)
		println("Circulo Azul cadastrado!")
		println("Circulos cadastrados!")
		println()
		
		println("Cadastrando Equipes de Trabalho...")
		println("Cadastrando Equipe J5...")
		new EquipeDeTrabalho(nomeEquipe: EquipeDeTrabalho.NomeEquipe.J5, jovemCoordenador1: Usuario.findByEmail("admin@plecas.com"),
		casalCoordenador: Usuario.findByEmail("casal@plecas.com"), encontro: Encontro.findByTema("Mei do Mato")).save(failOnError: true)
		println("Equipe J5 cadastrado!")
		println("Equipes de Trabalho cadastrados!")
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
		println(Usuario.findByEmail("admin@plecas.com").login + "      admin")
		println(Usuario.findByEmail("andre@plecas.com").login + "      andre")
		println(Usuario.findByEmail("casal@plecas.com").login + "      casal")
		println("-------------------------------------------------")
		
    }
    def destroy = {
    }
}
