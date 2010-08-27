package com.biblio

import grails.test.*
import com.biblio.Book

class BookTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Book, [])
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testBook() {
    	Book book = new Book()
		assertFalse book.validate()

		//Validación Book.titulo
		assertEquals 'nullable', book.errors['titulo']
		book.titulo = ""
		assertFalse book.validate()
		assertEquals 'blank', book.errors['titulo']
		book.titulo = "La Celestina"
		assertFalse book.validate()
		assertNull 'nullable', book.errors['titulo']
		assertNull 'blank', book.errors['titulo']
		
		//Validación Book.ISBN
		book.ISBN = "123123123"
		assertFalse book.validate()
		assertEquals 'validator', book.errors['ISBN']
		book.ISBN = "12312312312312"
		assertFalse book.validate()
		assertEquals 'validator', book.errors['ISBN']
		book.ISBN = ""
		assertFalse book.validate()
		assertEquals 'blank', book.errors['ISBN']
		book.ISBN = null
		book.validate()
		assertNull book.errors['ISBN']
		
		//Validación autores
		assertEquals 'nullable', book.errors['autores']
		Author author = new Author(nombre : 'Fernando', apellido1: 'de Rojas')
		book.autores = new ArrayList()
		book.autores.add author
		assertFalse book.validate()
		assertNull book.errors['autores']
		
		//Validación editorial
		assertEquals 'nullable', book.errors['editorial']
		Editorial ed = new Editorial(nombre:'nova')
		book.editorial = ed
		assertTrue book.validate()
		assertNull book.errors['editorial']
		
		book.valoracion = 9
		assertFalse book.validate()
		
	}
}
