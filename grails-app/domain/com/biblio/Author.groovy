package com.biblio

import com.biblio.Book;

class Author implements Comparable {
	
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

	public int compareTo(Object a2){
		if(a2 instanceof Book){
			Book book = (Book)a2
			if(this.libros==null){
				return -1
			}else if(book.libros==null){
				return 1
			}else{
				if(this.libros.size()<book.libros.size()){
					return -1
				}else if(this.libros.size()>book.libros.size()){
					return 1
				}else{
					return 0
				}
			}
		}else{
			return -1
		}
	}
	
	static List<Author> getPreferredAuthors(){
		List<Author> autores = Author.list()
		Collections.sort(autores)
		if(autores.size()>3){
			return autores.subList (0, 3)
		}else{
			return autores
		}
	}
}
