package les.ejc

class TelefoneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [telefoneInstanceList: Telefone.list(params), telefoneInstanceTotal: Telefone.count()]
    }

    def create = {
        def telefoneInstance = new Telefone()
        telefoneInstance.properties = params
        return [telefoneInstance: telefoneInstance]
    }

    def save = {
        def telefoneInstance = new Telefone(params)
        if (telefoneInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'telefone.label', default: 'Telefone'), telefoneInstance.id])}"
            redirect(action: "show", id: telefoneInstance.id)
        }
        else {
            render(view: "create", model: [telefoneInstance: telefoneInstance])
        }
    }

    def show = {
        def telefoneInstance = Telefone.get(params.id)
        if (!telefoneInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])}"
            redirect(action: "list")
        }
        else {
            [telefoneInstance: telefoneInstance]
        }
    }

    def edit = {
        def telefoneInstance = Telefone.get(params.id)
        if (!telefoneInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [telefoneInstance: telefoneInstance]
        }
    }

    def update = {
        def telefoneInstance = Telefone.get(params.id)
        if (telefoneInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (telefoneInstance.version > version) {
                    
                    telefoneInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'telefone.label', default: 'Telefone')] as Object[], "Another user has updated this Telefone while you were editing")
                    render(view: "edit", model: [telefoneInstance: telefoneInstance])
                    return
                }
            }
            telefoneInstance.properties = params
            if (!telefoneInstance.hasErrors() && telefoneInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'telefone.label', default: 'Telefone'), telefoneInstance.id])}"
                redirect(action: "show", id: telefoneInstance.id)
            }
            else {
                render(view: "edit", model: [telefoneInstance: telefoneInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def telefoneInstance = Telefone.get(params.id)
        if (telefoneInstance) {
            try {
                telefoneInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'telefone.label', default: 'Telefone'), params.id])}"
            redirect(action: "list")
        }
    }
}
