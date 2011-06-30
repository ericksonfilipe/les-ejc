package ejc

class ReflexaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        redirect(action: "list", params: params)
    }

    def list = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reflexaoInstanceList: Reflexao.list(params), reflexaoInstanceTotal: Reflexao.count()]
    }

    def create = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def reflexaoInstance = new Reflexao()
        reflexaoInstance.properties = params
        return [reflexaoInstance: reflexaoInstance]
    }

    def save = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def reflexaoInstance = new Reflexao(params)
        if (reflexaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), reflexaoInstance.id])}"
            redirect(action: "list", id: reflexaoInstance.id)
        }
        else {
            render(view: "create", model: [reflexaoInstance: reflexaoInstance])
        }
    }

    def show = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def reflexaoInstance = Reflexao.get(params.id)
        if (!reflexaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reflexaoInstance: reflexaoInstance]
        }
    }

    def edit = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def reflexaoInstance = Reflexao.get(params.id)
        if (!reflexaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reflexaoInstance: reflexaoInstance]
        }
    }

    def update = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def reflexaoInstance = Reflexao.get(params.id)
        if (reflexaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reflexaoInstance.version > version) {
                    
                    reflexaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reflexao.label', default: 'Reflexao')] as Object[], "Another user has updated this Reflexao while you were editing")
                    render(view: "edit", model: [reflexaoInstance: reflexaoInstance])
                    return
                }
            }
            reflexaoInstance.properties = params
            if (!reflexaoInstance.hasErrors() && reflexaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), reflexaoInstance.id])}"
                redirect(action: "list", id: reflexaoInstance.id)
            }
            else {
                render(view: "edit", model: [reflexaoInstance: reflexaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def reflexaoInstance = Reflexao.get(params.id)
        if (reflexaoInstance) {
            try {
                reflexaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reflexao.label', default: 'Reflexao'), params.id])}"
            redirect(action: "list")
        }
    }
}
