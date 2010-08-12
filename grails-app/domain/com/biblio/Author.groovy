package com.biblio

import com.biblio.Book;

class Author {
	
	String nombre
	String apellido1
	String apellido2
	static hasMany = [libros:Book]
	static belongsTo = Book
	
	static constraints = {
		nombre(nullable:false,blank:false,size:3..15)
		apellido1(nullable:false,blank:false,size:3..15)
		apellido2(nullable:true,blank:true,size:3..15)
    }
	
	def String toString(){
		return "${nombre} ${apellido1}"
	}
}
