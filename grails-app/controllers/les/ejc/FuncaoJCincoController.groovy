package les.ejc

class FuncaoJCincoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
		if (!session.user?.j5Atual) {
            flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        redirect(action: "list", params: params)
    }

    def list = {
		if (!session.user?.j5Atual) {
            flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [funcaoJCincoInstanceList: FuncaoJCinco.list(params), funcaoJCincoInstanceTotal: FuncaoJCinco.count()]
    }

    def create = {
		if (!session.user?.j5Atual) {
            flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def funcaoJCincoInstance = new FuncaoJCinco()
        funcaoJCincoInstance.properties = params
        return [funcaoJCincoInstance: funcaoJCincoInstance]
    }

    def save = {
        def funcaoJCincoInstance = new FuncaoJCinco(params)
        if (funcaoJCincoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), funcaoJCincoInstance.id])}"
            redirect(action: "show", id: funcaoJCincoInstance.id)
        }
        else {
            render(view: "create", model: [funcaoJCincoInstance: funcaoJCincoInstance])
        }
    }

    def show = {
		if (!session.user?.j5Atual) {
            flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def funcaoJCincoInstance = FuncaoJCinco.get(params.id)
        if (!funcaoJCincoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), params.id])}"
            redirect(action: "list")
        }
        else {
            [funcaoJCincoInstance: funcaoJCincoInstance]
        }
    }

    def edit = {
		if (!session.user?.j5Atual) {
            flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def funcaoJCincoInstance = FuncaoJCinco.get(params.id)
        if (!funcaoJCincoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [funcaoJCincoInstance: funcaoJCincoInstance]
        }
    }

    def update = {
        def funcaoJCincoInstance = FuncaoJCinco.get(params.id)
        if (funcaoJCincoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (funcaoJCincoInstance.version > version) {
                    
                    funcaoJCincoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco')] as Object[], "Another user has updated this FuncaoJCinco while you were editing")
                    render(view: "edit", model: [funcaoJCincoInstance: funcaoJCincoInstance])
                    return
                }
            }
            funcaoJCincoInstance.properties = params
            if (!funcaoJCincoInstance.hasErrors() && funcaoJCincoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), funcaoJCincoInstance.id])}"
                redirect(action: "show", id: funcaoJCincoInstance.id)
            }
            else {
                render(view: "edit", model: [funcaoJCincoInstance: funcaoJCincoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def funcaoJCincoInstance = FuncaoJCinco.get(params.id)
        if (funcaoJCincoInstance) {
            try {
                funcaoJCincoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco'), params.id])}"
            redirect(action: "list")
        }
    }
}
