package com.biblio

class BookController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [bookInstanceList: Book.list(params), bookInstanceTotal: Book.count()]
    }

    def create = {
        def bookInstance = new Book()
        bookInstance.properties = params
        return [bookInstance: bookInstance]
    }

    def save = {
        def bookInstance = new Book(params)
		if(!bookInstance.leido){
			bookInstance.valoracion = -1
		}
        if (bookInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'libro.label', default: 'Libro'), bookInstance.titulo])}"
            redirect(action: "show", id: bookInstance.id)
        }
        else {
            render(view: "create", model: [bookInstance: bookInstance])
        }
    }

    def show = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
            redirect(action: "list")
        }
        else {
            [bookInstance: bookInstance]
        }
    }

    def edit = {
        def bookInstance = Book.get(params.id)
        if (!bookInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [bookInstance: bookInstance]
        }
    }

    def update = {
        def bookInstance = Book.get(params.id)
        if (bookInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (bookInstance.version > version) {
                    
                    bookInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'libro.label', default: 'Libro')] as Object[], "Another user has updated this Libro while you were editing")
                    render(view: "edit", model: [bookInstance: bookInstance])
                    return
                }
            }
            bookInstance.properties = params
			if(!bookInstance.leido){
				bookInstance.valoracion = -1
			}
            if (!bookInstance.hasErrors() && bookInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'libro.label', default: 'Libro'), bookInstance.titulo])}"
                redirect(action: "show", id: bookInstance.id)
            }
            else {
                render(view: "edit", model: [bookInstance: bookInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def bookInstance = Book.get(params.id)
        
        if (bookInstance) {
			def titulo = bookInstance.titulo
            try {
				bookInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'libro.label', default: 'Libro'), titulo])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'libro.label', default: 'Libro'), titulo])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'libro.label', default: 'Libro'), params.id])}"
            redirect(action: "list")
        }
    }
}
