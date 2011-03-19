package les.ejc

class EncontroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [encontroInstanceList: Encontro.list(params), encontroInstanceTotal: Encontro.count()]
    }

    def create = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        def encontroInstance = new Encontro()
        encontroInstance.properties = params
        return [encontroInstance: encontroInstance]
    }

    def save = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        def encontroInstance = new Encontro(params)
        if (encontroInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'encontro.label', default: 'Encontro'), encontroInstance.id])}"
            redirect(action: "show", id: encontroInstance.id)
        }
        else {
            render(view: "create", model: [encontroInstance: encontroInstance])
        }
    }

    def show = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        def encontroInstance = Encontro.get(params.id)
        if (!encontroInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'encontro.label', default: 'Encontro'), params.id])}"
            redirect(action: "list")
        }
        else {
            [encontroInstance: encontroInstance]
        }
    }

    def edit = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        def encontroInstance = Encontro.get(params.id)
        if (!encontroInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'encontro.label', default: 'Encontro'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [encontroInstance: encontroInstance]
        }
    }

    def update = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        def encontroInstance = Encontro.get(params.id)
        if (encontroInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (encontroInstance.version > version) {
                    
                    encontroInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'encontro.label', default: 'Encontro')] as Object[], "Another user has updated this Encontro while you were editing")
                    render(view: "edit", model: [encontroInstance: encontroInstance])
                    return
                }
            }
            encontroInstance.properties = params
            if (!encontroInstance.hasErrors() && encontroInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'encontro.label', default: 'Encontro'), encontroInstance.id])}"
                redirect(action: "show", id: encontroInstance.id)
            }
            else {
                render(view: "edit", model: [encontroInstance: encontroInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'encontro.label', default: 'Encontro'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (session.user == null) {
			render(view:'../permissaoNegada')
		}
        def encontroInstance = Encontro.get(params.id)
        if (encontroInstance) {
            try {
                encontroInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'encontro.label', default: 'Encontro'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'encontro.label', default: 'Encontro'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'encontro.label', default: 'Encontro'), params.id])}"
            redirect(action: "list")
        }
    }
}