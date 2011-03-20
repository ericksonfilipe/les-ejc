import les.ejc.Usuario

class BootStrap {

    def init = { servletContext ->
		println("-------------------------------bootstrap")
		new Usuario(nomeCompleto:"admin", nomeUsual:"", dataDeNascimento:null,
					endereco:null, telefone:"", email:"admin@plecas.com", foto:null, 
					paroquia:"", equipesTrabalhadas:"", observacoes:"",
					status:Usuario.Status.Sem_Contato, tipo:Usuario.Tipo.Jovem, j5Atual:true, login:"admin", senha:"admin").save(failOnError: true)
		new Usuario(nomeCompleto:"Andre", nomeUsual:"", dataDeNascimento:null,
					endereco:null, telefone:"", email:"", foto:null, 
					paroquia:"", equipesTrabalhadas:"", observacoes:"",
					status:Usuario.Status.Ativo, tipo:Usuario.Tipo.Jovem, j5Atual:false, login:"andre", senha:"andre").save(failOnError: true)
		println(Usuario.findByEmail("admin@plecas.com").login + " " + Usuario.findByEmail("admin@plecas.com").senha)
		
    }
    def destroy = {
    }
}
