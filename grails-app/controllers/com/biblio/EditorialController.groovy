package com.biblio

class EditorialController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [editorialInstanceList: Editorial.list(params), editorialInstanceTotal: Editorial.count()]
    }

    def create = {
        def editorialInstance = new Editorial()
        editorialInstance.properties = params
		flash.referer = params.referer
        return [editorialInstance: editorialInstance]
    }

    def save = {
        def editorialInstance = new Editorial(params)
        if (editorialInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'editorial.label', default: 'Editorial'), editorialInstance.nombre])}"
			if(!flash.referer){
				redirect(action: "show", id: editorialInstance.id)
			}else{
				redirect(action: "create", controller: "book")
			}
        }
        else {
            render(view: "create", model: [editorialInstance: editorialInstance])
        }
    }

    def show = {
        def editorialInstance = Editorial.get(params.id)
        if (!editorialInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), params.id])}"
            redirect(action: "list")
        }
        else {
            [editorialInstance: editorialInstance]
        }
    }

    def edit = {
        def editorialInstance = Editorial.get(params.id)
        
        if (!editorialInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [editorialInstance: editorialInstance]
        }
    }

    def update = {
        def editorialInstance = Editorial.get(params.id)
        if (editorialInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (editorialInstance.version > version) {
                    
                    editorialInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'editorial.label', default: 'Editorial')] as Object[], "Another user has updated this Editorial while you were editing")
                    render(view: "edit", model: [editorialInstance: editorialInstance])
                    return
                }
            }
            editorialInstance.properties = params
            if (!editorialInstance.hasErrors() && editorialInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'editorial.label', default: 'Editorial'), editorialInstance.nombre])}"
                redirect(action: "show", id: editorialInstance.id)
            }
            else {
                render(view: "edit", model: [editorialInstance: editorialInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def editorialInstance = Editorial.get(params.id)
        if (editorialInstance) {
            try {
				def nombreEditorial = editorialInstance.nombre
                editorialInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'editorial.label', default: 'Editorial'), nombreEditorial])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'editorial.label', default: 'Editorial'), nombreEditorial])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'editorial.label', default: 'Editorial'), nombreEditorial])}"
            redirect(action: "list")
        }
    }
}
