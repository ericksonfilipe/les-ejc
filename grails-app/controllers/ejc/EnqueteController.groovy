package ejc

class EnqueteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
	
	def abrirFecharEnquete = {
		if (!session.user) {
                        flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}
		
		def enqueteInstance = Enquete.get(params.id)
		
		if (enqueteInstance.fechada)
			enqueteInstance.fechada = false
		else
			enqueteInstance.fechada = true
			
		redirect(action: "edit", params: params)
	}
	
	def votar = {
		if (!session.user) {
                        flash.message = "Permiss�o Negada"
			redirect(controller: 'app', action:'login')
			return
		}
		def enqueteInstance = Enquete.get(params.id)
		if (!enqueteInstance) {
            redirect(action: 'list')
            return
        }
        [enqueteInstance:enqueteInstance]
	}
	
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [enqueteInstanceList: Enquete.list(params), enqueteInstanceTotal: Enquete.count()]
    }

    def create = {
        def enqueteInstance = new Enquete()
        enqueteInstance.properties = params
        return [enqueteInstance: enqueteInstance]
    }

    def save = {
        def enqueteInstance = new Enquete(params)
        if (enqueteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'enquete.label', default: 'Enquete'), enqueteInstance.id])}"
            redirect(action: "show", id: enqueteInstance.id)
        }
        else {
            render(view: "create", model: [enqueteInstance: enqueteInstance])
        }
    }

    def show = {
        /*def enqueteInstance = Enquete.get(params.id)
        if (!enqueteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enquete.label', default: 'Enquete'), params.id])}"
            redirect(action: "list")
        }
        else {
            [enqueteInstance: enqueteInstance]
        }
		*/
		redirect(action: "list", params: params)
    }

    def edit = {
        def enqueteInstance = Enquete.get(params.id)
        if (!enqueteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enquete.label', default: 'Enquete'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [enqueteInstance: enqueteInstance]
        }
    }

    def update = {
        def enqueteInstance = Enquete.get(params.id)
        if (enqueteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (enqueteInstance.version > version) {
                    
                    enqueteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'enquete.label', default: 'Enquete')] as Object[], "Another user has updated this Enquete while you were editing")
                    render(view: "edit", model: [enqueteInstance: enqueteInstance])
                    return
                }
            }
            enqueteInstance.properties = params
            if (!enqueteInstance.hasErrors() && enqueteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'enquete.label', default: 'Enquete'), enqueteInstance.id])}"
                redirect(action: "show", id: enqueteInstance.id)
            }
            else {
                render(view: "edit", model: [enqueteInstance: enqueteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enquete.label', default: 'Enquete'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def enqueteInstance = Enquete.get(params.id)
        if (enqueteInstance) {
            try {
                enqueteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'enquete.label', default: 'Enquete'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'enquete.label', default: 'Enquete'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'enquete.label', default: 'Enquete'), params.id])}"
            redirect(action: "list")
        }
    }
}
