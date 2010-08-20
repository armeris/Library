package com.biblio

import grails.test.*
import com.biblio.Author

class AuthorTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Author, [])
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAuthor() {
    	Author a1 = new Author()
		assertFalse a1.validate()

		//Validación Author.nombre
		assertEquals 'nullable', a1.errors['nombre']
		a1.nombre = ""
		assertFalse a1.validate()
		assertEquals 'blank', a1.errors['nombre']
		a1.nombre = "ab"
		assertFalse a1.validate()
		assertEquals 'size', a1.errors['nombre']
		a1.nombre = "Francisco"
		
		//Validación Author.apellido1
		assertEquals 'nullable', a1.errors['apellido1']
		a1.apellido1 = ""
		assertFalse a1.validate()
		assertEquals 'blank', a1.errors['apellido1']
		a1.apellido1 = "ab"
		assertFalse a1.validate()
		assertEquals 'size', a1.errors['apellido1']
		a1.apellido1 = "Gómez"

		//Validación Author.apellido2
		a1.apellido2 = 'ab'
		assertFalse a1.validate()
		assertEquals 'size', a1.errors['apellido2']
		a1.apellido2 = ''
		assertTrue a1.validate()
		a1.apellido2 = null
		assertTrue a1.validate()
		
		a1 = new Author(nombre : 'Francisco', apellido1 : 'Gómez', apellido2 : 'de Quevedo')
 		assertTrue a1.validate()
    }
}
