package ejc

import ejc.Noticia

class NoticiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [noticiaInstanceList: Noticia.list(params), noticiaInstanceTotal: Noticia.count()]
    }

    def create = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def noticiaInstance = new Noticia()
        noticiaInstance.properties = params
        return [noticiaInstance: noticiaInstance]
    }

    def save = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def noticiaInstance = new Noticia(params)
		if (noticiaInstance.noticiaPrincipal == true && existeNoticiaPrincipal(noticiaInstance)) {
			flash.message = "Já existe uma Notícia cadastrada para ser visualizada na página inicial!"
			render(view: "create", model: [noticiaInstance: noticiaInstance])
			return					
		}

		if (noticiaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'noticia.label', default: 'Noticia'), noticiaInstance.id])}"
			redirect(action: "list", id: noticiaInstance.id)
        }
        else {
            render(view: "create", model: [noticiaInstance: noticiaInstance])
        }
    }

    def show = {
        def noticiaInstance = Noticia.get(params.id)
        if (!noticiaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [noticiaInstance: noticiaInstance]
        }
    }

    def edit = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def noticiaInstance = Noticia.get(params.id)
        if (!noticiaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [noticiaInstance: noticiaInstance]
        }
    }

    def update = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def noticiaInstance = Noticia.get(params.id)
			
        if (noticiaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (noticiaInstance.version > version) {
                    
                    noticiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'noticia.label', default: 'Noticia')] as Object[], "Another user has updated this Noticia while you were editing")
                    render(view: "edit", model: [noticiaInstance: noticiaInstance])
                    return
                }
            }
            noticiaInstance.properties = params

			if (noticiaInstance.noticiaPrincipal == true && existeNoticiaPrincipal(noticiaInstance)) {
				flash.message = "Já existe uma Notícia cadastrada para ser visualizada na página inicial!"
				render(view: "edit", model: [noticiaInstance: noticiaInstance])
				return					
			}	

            if (!noticiaInstance.hasErrors() && noticiaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'noticia.label', default: 'Noticia'), noticiaInstance.id])}"
                redirect(action: "list", id: noticiaInstance.id)
            }
            else {
                render(view: "edit", model: [noticiaInstance: noticiaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user?.j5Atual) {
            flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'login')
			return
		}	
        def noticiaInstance = Noticia.get(params.id)
        if (noticiaInstance) {
            try {
                noticiaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
                redirect(action: "list", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'noticia.label', default: 'Noticia'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def existeNoticiaPrincipal(noticiaInstance){
		for (noticia in ejc.Noticia.list()) {
			if (noticia.noticiaPrincipal == true && noticia != noticiaInstance) return true
		}
		return false
	}
}
