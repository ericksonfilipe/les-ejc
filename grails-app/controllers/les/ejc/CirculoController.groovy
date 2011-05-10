package les.ejc

class CirculoController {

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
	
    def list = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [circuloInstanceList: Circulo.list(params), circuloInstanceTotal: Circulo.count()]
    }

    def create = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		} else if (!session.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def circuloInstance = new Circulo()
        circuloInstance.properties = params
        return [circuloInstance: circuloInstance]
    }

    def save = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		} else if (!session.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def circuloInstance = new Circulo(params)
        if (circuloInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'circulo.label', default: 'Circulo'), circuloInstance.id])}"
            redirect(action: "show", id: circuloInstance.id)
        }
        else {
            render(view: "create", model: [circuloInstance: circuloInstance])
        }
    }

    def show = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def circuloInstance = Circulo.get(params.id)
        if (!circuloInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'circulo.label', default: 'Circulo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [circuloInstance: circuloInstance]
        }
    }

    def edit = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		} else if (!session.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def circuloInstance = Circulo.get(params.id)
        if (!circuloInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'circulo.label', default: 'Circulo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [circuloInstance: circuloInstance]
        }
    }

    def update = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		} else if (!session.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def circuloInstance = Circulo.get(params.id)
        if (circuloInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (circuloInstance.version > version) {
                    
                    circuloInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'circulo.label', default: 'Circulo')] as Object[], "Another user has updated this Circulo while you were editing")
                    render(view: "edit", model: [circuloInstance: circuloInstance])
                    return
                }
            }
            circuloInstance.properties = params
            if (!circuloInstance.hasErrors() && circuloInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'circulo.label', default: 'Circulo'), circuloInstance.id])}"
                redirect(action: "show", id: circuloInstance.id)
            }
            else {
                render(view: "edit", model: [circuloInstance: circuloInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'circulo.label', default: 'Circulo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		} else if (!session.user?.j5Atual) {
                        flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}
        def circuloInstance = Circulo.get(params.id)
        if (circuloInstance) {
            try {
                circuloInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'circulo.label', default: 'Circulo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'circulo.label', default: 'Circulo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'circulo.label', default: 'Circulo'), params.id])}"
            redirect(action: "list")
        }
    }
}
