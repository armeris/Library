package com.biblio

class Editorial {
	
	String nombre
	static hasMany = [libros:Book]
	
    static constraints = {
		nombre(nullable:false,blank:false,size:3..30)
    }
	
	String toString(){
		return nombre
	}
}
