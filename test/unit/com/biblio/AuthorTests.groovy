package com.biblio

import grails.test.*
import com.biblio.Editorial
import com.biblio.EditorialController 

class AuthorTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Author, [])
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testEditorial() {
    	Author a1 = new Author()
		assertFalse a1.validate()
		assertEquals 'nullable', a1.errors['nombre']
		assertEquals 'nullable', a1.errors['apellido1']
    }
}
