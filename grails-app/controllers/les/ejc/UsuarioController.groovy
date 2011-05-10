package les.ejc

class UsuarioController {

def senderService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    def error = {}

    def index = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        redirect(action: "list", params: params)
    }

    def enviarLoginESenha = {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
            redirect(action: 'list')
            return
        }
	Random random = new Random()
        String orig = (1..10).collect { random.nextInt(9) }.join()
        String origmd5 = orig.encodeAsMD5Hex()
        usuarioInstance.setSenha(origmd5)
        usuarioInstance.emailEnviado = true
        usuarioInstance.save()
	if (usuarioInstance.email != null) {		
                if (usuarioInstance.login == null) { usuarioInstance.login = usuarioInstance.email }
                String mensagem = "Você foi cadastrado(a) no sistema\n\nlogin: ${usuarioInstance.login}\nsenha: ${orig}\n" + 
			  "Aconselhamos que ao logar no sistema, você modifique sua senha!\nAbraços,"
		senderService.enviaEmail(usuarioInstance.email, "Bem Vindo ao Sistema do EJC - Paróquia de São Cristóvão", mensagem)
	}
        flash.message = "Enviado Login e Senha para ${usuarioInstance.email} (Usuário Ativo)"
        redirect(action: 'list')
    }


    def listNotAtivado = {
        if (!session.user) {
            flash.message = "Permissão Negada"
            redirect(controller: 'app', action: 'login')
            return
        }  
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def usuarioInstance = Usuario.findAllByEmailEnviado(false) + Usuario.findAllByStatusNotEqual('Ativo')
        [usuarioInstanceList: usuarioInstance, usuarioInstanceTotal: Usuario.count()]
    }

    def emailNotEnviado = {
         if (!session.user) {
            flash.message = "Permissão Negada"
            redirect(controller: 'app', action: 'login')
            return
        }  
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def usuarioInstance = Usuario.findAllByNotEmailEnviado()
        [usuarioInstanceList: usuarioInstance, usuarioInstanceTotal: Usuario.count()]     
    }

    def list = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def create = {
		//println("Params: " + params)
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		} else if (!session.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def usuarioInstance = new Usuario()
        usuarioInstance.properties = params
        return [usuarioInstance: usuarioInstance]
    }

    def save = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
		def usuarioInstance = new Usuario(params)
		
		//cria nomeUsual, login e senha, caso possivel
		usuarioInstance.realizaCriacoesAutomaticas()
		
		def senhaNaoCriptografada = usuarioInstance.senha

		if (!usuarioInstance.hasErrors() && usuarioInstance.save(flush: true)) {
		
			//envia email notificando login e senha
			if (usuarioInstance.email != null) {
				//String mensagem = "Você foi cadastrado(a) no sistema\n\nlogin: ${usuarioInstance.login}\nsenha: ${senhaNaoCriptografada}\n" + 
				//				  "Aconselhamos que ao logar no sistema, você modifique sua senha!\nAbraços,"
				//senderService.enviaEmail(usuarioInstance.email, "Bem Vindo ao Sistema do EJC - Paróquia de São Cristóvão", mensagem)
            }
			
			usuarioInstance.senha = new String(usuarioInstance.senha.encodeAsMD5Hex())
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
            redirect(action: "show", id: usuarioInstance.id)
        }
        else {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
        }
    }

    def show = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
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
	
	def perfil = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
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
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
		else if (!session.user?.j5Atual) {
			if (params.id.toLong() != session.user.id) {
                        	flash.message = "Permissão Negada"
				redirect(controller: 'app', action:'login')
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
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
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
			def foto = usuarioInstance.foto
			def ficha = usuarioInstance.ficha
            usuarioInstance.properties = params
			//garante nomeUsual automatico se for branco
			usuarioInstance.geraNomeUsualAutomatico()
			if (foto != [] && usuarioInstance.foto == []) {
				usuarioInstance.foto = foto
			}
			if (ficha != [] && usuarioInstance.ficha == []) {
				usuarioInstance.ficha = ficha
			}
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
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
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
