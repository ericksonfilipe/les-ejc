package les.ejc

class OficioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
	
	def error = {}

    def list = {
		if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [oficioInstanceList: Oficio.list(params), oficioInstanceTotal: Oficio.count()]
    }

    def create = {
		if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def oficioInstance = new Oficio()
        oficioInstance.properties = params
        return [oficioInstance: oficioInstance]
    }

    def save = {
		if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
		def oficioInstance = new Oficio(params)
        if (oficioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'oficio.label', default: 'Oficio'), oficioInstance.id])}"
            redirect(action: "show", id: oficioInstance.id)
        }
        else {
            render(view: "create", model: [oficioInstance: oficioInstance])
        }
    }

    def show = {
		if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
		def oficioInstance = Oficio.get(params.id)
        if (!oficioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficio.label', default: 'Oficio'), params.id])}"
            redirect(action: "list")
        }
        else {
            [oficioInstance: oficioInstance]
        }
    }

    def edit = {
        if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
		def oficioInstance = Oficio.get(params.id)
        if (!oficioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficio.label', default: 'Oficio'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [oficioInstance: oficioInstance]
        }
    }

    def update = {
        if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
		def oficioInstance = Oficio.get(params.id)
        if (oficioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (oficioInstance.version > version) {
                    
                    oficioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'oficio.label', default: 'Oficio')] as Object[], "Another user has updated this Oficio while you were editing")
                    render(view: "edit", model: [oficioInstance: oficioInstance])
                    return
                }
            }
            oficioInstance.properties = params
            if (!oficioInstance.hasErrors() && oficioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'oficio.label', default: 'Oficio'), oficioInstance.id])}"
                redirect(action: "show", id: oficioInstance.id)
            }
            else {
                render(view: "edit", model: [oficioInstance: oficioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficio.label', default: 'Oficio'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        if (!session.user || !session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
		def oficioInstance = Oficio.get(params.id)
        if (oficioInstance) {
            try {
                oficioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'oficio.label', default: 'Oficio'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'oficio.label', default: 'Oficio'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'oficio.label', default: 'Oficio'), params.id])}"
            redirect(action: "list")
        }
    }
}
