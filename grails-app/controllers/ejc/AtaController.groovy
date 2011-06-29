package ejc

class AtaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def gerarhtml = {
        def ataInstance = Ata.get(params.id)
        if (!ataInstance) {
            redirect(action: 'list')
            return
        }
        [ataInstance:ataInstance]
    }

    def index = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        redirect(action: "list", params: params)
    }

    def list = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ataInstanceList: Ata.list(params), ataInstanceTotal: Ata.count()]
    }

    def create = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def ataInstance = new Ata()
        ataInstance.properties = params
        return [ataInstance: ataInstance]
    }

    def save = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def ataInstance = new Ata(params)
        if (ataInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ata.label', default: 'Ata'), ataInstance.id])}"
            redirect(action: "show", id: ataInstance.id)
        }
        else {
            render(view: "create", model: [ataInstance: ataInstance])
        }
    }

    def show = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def ataInstance = Ata.get(params.id)
        if (!ataInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ata.label', default: 'Ata'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ataInstance: ataInstance]
        }
    }

    def edit = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def ataInstance = Ata.get(params.id)
        if (!ataInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ata.label', default: 'Ata'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ataInstance: ataInstance]
        }
    }

    def update = {
		if (!session?.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def ataInstance = Ata.get(params.id)
        if (ataInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ataInstance.version > version) {
                    
                    ataInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ata.label', default: 'Ata')] as Object[], "Another user has updated this Ata while you were editing")
                    render(view: "edit", model: [ataInstance: ataInstance])
                    return
                }
            }
            ataInstance.properties = params
            if (!ataInstance.hasErrors() && ataInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ata.label', default: 'Ata'), ataInstance.id])}"
                redirect(action: "show", id: ataInstance.id)
            }
            else {
                render(view: "edit", model: [ataInstance: ataInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ata.label', default: 'Ata'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session?.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def ataInstance = Ata.get(params.id)
        if (ataInstance) {
            try {
                ataInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ata.label', default: 'Ata'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ata.label', default: 'Ata'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ata.label', default: 'Ata'), params.id])}"
            redirect(action: "list")
        }
    }
}
