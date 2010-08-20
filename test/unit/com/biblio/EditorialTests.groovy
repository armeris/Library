package com.biblio

import grails.test.*
import com.biblio.Editorial

class EditorialTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Editorial, [])
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testEditorial() {
    	Editorial e1 = new Editorial()
		assertFalse e1.validate()
		assertEquals 'nullable', e1.errors['nombre']
		
		e1.nombre = ""
		assertFalse e1.validate()
		assertEquals 'blank', e1.errors['nombre']
		
		e1.nombre = "ab"
		assertFalse e1.validate()
		assertEquals 'size', e1.errors['nombre']
    }
}
