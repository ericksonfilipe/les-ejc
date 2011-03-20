package les.ejc

class EnderecoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def error = {}

    def index = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
        redirect(action: "list", params: params)
    }

    def list = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [enderecoInstanceList: Endereco.list(params), enderecoInstanceTotal: Endereco.count()]
    }

    def create = {
		if (!session.user) {
			redirect(action:'error')
			return
		} else if (!session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def enderecoInstance = new Endereco()
        enderecoInstance.properties = params
        return [enderecoInstance: enderecoInstance]
    }

    def save = {
		if (!session.user) {
			redirect(action:'error')
			return
		} else if (!session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def enderecoInstance = new Endereco(params)
        if (enderecoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'endereco.label', default: 'Endereco'), enderecoInstance.id])}"
            redirect(action: "show", id: enderecoInstance.id)
        }
        else {
            render(view: "create", model: [enderecoInstance: enderecoInstance])
        }
    }

    def show = {
		if (!session.user) {
			redirect(action:'error')
			return
		}
        def enderecoInstance = Endereco.get(params.id)
        if (!enderecoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])}"
            redirect(action: "list")
        }
        else {
            [enderecoInstance: enderecoInstance]
        }
    }

    def edit = {
		if (!session.user) {
			redirect(action:'error')
			return
		} else if (!session.user?.j5Atual) {
			println(params.id)
			//println(session.user.endereco)
			//if (session.user.endereco?.id != params.id.toLong()) {
				//redirect(action:'error')
				//return
			//}
		}
        def enderecoInstance = Endereco.get(params.id)
        if (!enderecoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [enderecoInstance: enderecoInstance]
        }
    }

    def update = {
		if (!session.user) {
			redirect(action:'error')
			return
		} else if (!session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def enderecoInstance = Endereco.get(params.id)
        if (enderecoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (enderecoInstance.version > version) {
                    
                    enderecoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'endereco.label', default: 'Endereco')] as Object[], "Another user has updated this Endereco while you were editing")
                    render(view: "edit", model: [enderecoInstance: enderecoInstance])
                    return
                }
            }
            enderecoInstance.properties = params
            if (!enderecoInstance.hasErrors() && enderecoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'endereco.label', default: 'Endereco'), enderecoInstance.id])}"
                redirect(action: "show", id: enderecoInstance.id)
            }
            else {
                render(view: "edit", model: [enderecoInstance: enderecoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user) {
			redirect(action:'error')
			return
		} else if (!session.user?.j5Atual) {
			redirect(action:'error')
			return
		}
        def enderecoInstance = Endereco.get(params.id)
        if (enderecoInstance) {
            try {
                enderecoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'endereco.label', default: 'Endereco'), params.id])}"
            redirect(action: "list")
        }
    }
}
