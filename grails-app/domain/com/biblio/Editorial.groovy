package com.biblio

class Editorial {
	
	String nombre
	static hasMany = [libros:Book]
    static belongsTo = Book
	
    static constraints = {
		nombre(nullable:false,blank:false,size:3..30)
    }
}
