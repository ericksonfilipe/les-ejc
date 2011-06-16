package les.ejc

class OpcaoEnqueteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
	
	def votar = {
		def opcaoEnqueteInstance = OpcaoEnquete.get(params.id)
		
		if (opcaoEnqueteInstance) {
			opcaoEnqueteInstance.computarVotos();
			redirect(controller: 'enquete', action:'votar', id: opcaoEnqueteInstance.enquete.id)
		} else {
			
		}
	}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [opcaoEnqueteInstanceList: OpcaoEnquete.list(params), opcaoEnqueteInstanceTotal: OpcaoEnquete.count()]
    }

    def create = {
        def opcaoEnqueteInstance = new OpcaoEnquete()
        opcaoEnqueteInstance.properties = params
        return [opcaoEnqueteInstance: opcaoEnqueteInstance]
    }

    def save = {
        def opcaoEnqueteInstance = new OpcaoEnquete(params)
        if (opcaoEnqueteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), opcaoEnqueteInstance.id])}"
            redirect(action: "show", id: opcaoEnqueteInstance.id)
        }
        else {
            render(view: "create", model: [opcaoEnqueteInstance: opcaoEnqueteInstance])
        }
    }

    def show = {
        def opcaoEnqueteInstance = OpcaoEnquete.get(params.id)
        if (!opcaoEnqueteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), params.id])}"
            redirect(action: "list")
        }
        else {
            [opcaoEnqueteInstance: opcaoEnqueteInstance]
        }
    }

    def edit = {
        def opcaoEnqueteInstance = OpcaoEnquete.get(params.id)
        if (!opcaoEnqueteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [opcaoEnqueteInstance: opcaoEnqueteInstance]
        }
    }

    def update = {
        def opcaoEnqueteInstance = OpcaoEnquete.get(params.id)
        if (opcaoEnqueteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (opcaoEnqueteInstance.version > version) {
                    
                    opcaoEnqueteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete')] as Object[], "Another user has updated this OpcaoEnquete while you were editing")
                    render(view: "edit", model: [opcaoEnqueteInstance: opcaoEnqueteInstance])
                    return
                }
            }
            opcaoEnqueteInstance.properties = params
            if (!opcaoEnqueteInstance.hasErrors() && opcaoEnqueteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), opcaoEnqueteInstance.id])}"
                redirect(action: "show", id: opcaoEnqueteInstance.id)
            }
            else {
                render(view: "edit", model: [opcaoEnqueteInstance: opcaoEnqueteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def opcaoEnqueteInstance = OpcaoEnquete.get(params.id)
        if (opcaoEnqueteInstance) {
            try {
                opcaoEnqueteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete'), params.id])}"
            redirect(action: "list")
        }
    }
}
