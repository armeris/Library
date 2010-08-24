package com.biblio

import grails.test.*
import com.biblio.Book
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class BookTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Book, [])
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testBook() {
    	Book a1 = new Book()
		assertFalse a1.validate()

		//Validación Author.nombre
		assertEquals 'nullable', a1.errors['titulo']
		a1.titulo = ""
		assertFalse a1.validate()
		assertEquals 'blank', a1.errors['titulo']
		a1.titulo = "ab"
		assertFalse a1.validate()
		assertEquals 'size', a1.errors['titulo']
		a1.titulo = "Francisco"
	}
}
