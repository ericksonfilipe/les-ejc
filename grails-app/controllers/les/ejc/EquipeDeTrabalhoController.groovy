package les.ejc

class EquipeDeTrabalhoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [equipeDeTrabalhoInstanceList: EquipeDeTrabalho.list(params), equipeDeTrabalhoInstanceTotal: EquipeDeTrabalho.count()]
    }

    def create = {
        def equipeDeTrabalhoInstance = new EquipeDeTrabalho()
        equipeDeTrabalhoInstance.properties = params
        return [equipeDeTrabalhoInstance: equipeDeTrabalhoInstance]
    }

    def save = {
        def equipeDeTrabalhoInstance = new EquipeDeTrabalho(params)
        if (equipeDeTrabalhoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), equipeDeTrabalhoInstance.id])}"
            redirect(action: "show", id: equipeDeTrabalhoInstance.id)
        }
        else {
            render(view: "create", model: [equipeDeTrabalhoInstance: equipeDeTrabalhoInstance])
        }
    }

    def show = {
        def equipeDeTrabalhoInstance = EquipeDeTrabalho.get(params.id)
        if (!equipeDeTrabalhoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), params.id])}"
            redirect(action: "list")
        }
        else {
            [equipeDeTrabalhoInstance: equipeDeTrabalhoInstance]
        }
    }

    def edit = {
        def equipeDeTrabalhoInstance = EquipeDeTrabalho.get(params.id)
        if (!equipeDeTrabalhoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [equipeDeTrabalhoInstance: equipeDeTrabalhoInstance]
        }
    }

    def update = {
        def equipeDeTrabalhoInstance = EquipeDeTrabalho.get(params.id)
        if (equipeDeTrabalhoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (equipeDeTrabalhoInstance.version > version) {
                    
                    equipeDeTrabalhoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho')] as Object[], "Another user has updated this EquipeDeTrabalho while you were editing")
                    render(view: "edit", model: [equipeDeTrabalhoInstance: equipeDeTrabalhoInstance])
                    return
                }
            }
            equipeDeTrabalhoInstance.properties = params
            if (!equipeDeTrabalhoInstance.hasErrors() && equipeDeTrabalhoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), equipeDeTrabalhoInstance.id])}"
                redirect(action: "show", id: equipeDeTrabalhoInstance.id)
            }
            else {
                render(view: "edit", model: [equipeDeTrabalhoInstance: equipeDeTrabalhoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def equipeDeTrabalhoInstance = EquipeDeTrabalho.get(params.id)
        if (equipeDeTrabalhoInstance) {
            try {
                equipeDeTrabalhoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho'), params.id])}"
            redirect(action: "list")
        }
    }
}
