package les.ejc

class UsuarioController {

	def senderService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def error = {}

    def index = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
        redirect(action: "list", params: params)
    }

    def list = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def create = {
		//println("Params: " + params)
		if (!session.user) {
			redirect(action:'error')
			return
		} else if (!session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    }

    def save = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
		
		/*def tel = '(' + params.get('telefone1ddd') + ')' + params.get('telefone1prefixo') + '-' + params.get('telefone1sufixo')
		if (tel.size() != 13)
			tel = ''
		params['telefone1'] = tel
		tel = '(' + params.get('telefone2ddd') + ')' + params.get('telefone2prefixo') + '-' + params.get('telefone2sufixo')
		if (tel.size() != 13)
			tel = ''
		params['telefone2'] = tel
		tel = '(' + params.get('telefone3ddd') + ')' + params.get('telefone3prefixo') + '-' + params.get('telefone3sufixo')
		if (tel.size() != 13)
			tel = ''
		params['telefone3'] = tel*/
		//println(params)
		def usuarioInstance = new Usuario(params)
		
		//cria nomeUsual, login e senha, caso possivel
		usuarioInstance.realizaCriacoesAutomaticas()
		
		def senhaNaoCriptografada = usuarioInstance.senha
		usuarioInstance.senha = new String(usuarioInstance.senha.encodeAsMD5Hex())

		if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
		
			//envia email notificando login e senha
			if (usuarioInstance.email != null) {
				//String mensagem = "Voc� foi cadastrado(a) no sistema\n\nlogin: ${usuarioInstance.login}\nsenha: ${senhaNaoCriptografada}\n" + 
				//				  "Aconselhamos que ao logar no sistema, voc� modifique sua senha!\nAbra�os,"
				//senderService.enviaEmail(usuarioInstance.email, "Bem Vindo ao Sistema do EJC - Par�quia de S�o Crist�v�o", mensagem)
            }
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
            redirect(action: "show", id: usuarioInstance.id)
        }
        else {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
        }
    }

    def show = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
		
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [usuarioInstance: usuarioInstance]
        }
    }

    def edit = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
		else if (!session.user?.j5Atual) {
			if (params.id.toLong() != session.user.id) {
				redirect(action:'error')
				return
			}
		}
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [usuarioInstance: usuarioInstance]
        }
    }

    def update = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
        def usuarioInstance = Usuario.get(params.id)
        if (usuarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (usuarioInstance.version > version) {
                    
                    usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'usuario.label', default: 'Usuario')] as Object[], "Another user has updated this Usuario while you were editing")
                    render(view: "edit", model: [usuarioInstance: usuarioInstance])
                    return
                }
            }
            usuarioInstance.properties = params
            if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
                redirect(action: "show", id: usuarioInstance.id)
            }
            else {
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
		def usuarioInstance = Usuario.get(params.id)
		if (usuarioInstance) {
			try {
				usuarioInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])}"
			redirect(action: "list")
		}
    }
	
	
	def senhacriptografada = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
 	}

	def renderFoto = {
		def usuarioInstance = Usuario.get(params.id)
		if (usuarioInstance?.foto) {
			response.setContentLength(usuarioInstance.foto.length)
			response.outputStream.write(usuarioInstance.foto)
		} else {
			response.sendError(404)
		}
	}
}
