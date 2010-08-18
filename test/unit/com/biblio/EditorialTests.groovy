package com.biblio

import grails.test.*
import com.biblio.Editorial
import com.biblio.EditorialController 

class EditorialTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Editorial, [])
        mockController(EditorialController)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testEditorial() {
    	Editorial e1 = new Editorial()
		assertFalse e1.validate()
		assertEquals 'nullable', e1.errors['nombre']
		
		def editorialController = new EditorialController()
		editorialController.params.nombre = 'Nova'
		
		editorialController.save
		
		
    }
}
