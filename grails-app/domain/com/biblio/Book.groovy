package com.biblio

import java.text.SimpleDateFormat
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.springframework.context.i18n.LocaleContextHolder as LCH

class Book implements Serializable {
	
	String titulo
	String ISBN
	Date fechaPublicacion
	String sFechaPublicacion
	String comentario
	int valoracion
	boolean leido
	Editorial editorial
	
	def messageSource
	
	static hasMany = [autores:Author]
	                  
    static transients = ["sFechaPublicacion"]
	                  
    static constraints = {
		titulo(nullable:false,blank:false,size:3..50)
		ISBN(nullable:true,blank:true,unique:true,validator:{val->
			if(val==null || (val.length()==10 || val.length()==13)){
				return true
			}else{
				return false
			}
		})
		autores(nullable:false)
		fechaPublicacion(nullable:true,blank:true)
		comentario(nullable:true,blank:true,size:0..2000)
		valoracion(nullable:true,blank:true,inList:[-1,0,1,2,3,4])
    }

	void setFechaPublicacion(String fecha){
		SimpleDateFormat sdf = new SimpleDateFormat(getDateFormat())
		try{
			this.fechaPublicacion = sdf.parse(fecha)
		}catch(Exception e){
			this.fechaPublicacion = null
		}
	}
	
	void setSFechaPublicacion(String fecha){
		SimpleDateFormat sdf = new SimpleDateFormat(getDateFormat())
		
		this.sFechaPublicacion = fecha
		this.fechaPublicacion = sdf.parse(fecha)
	}
	
	String getSFechaPublicacion(){
		SimpleDateFormat sdf = new SimpleDateFormat(getDateFormat())
		
		if(sFechaPublicacion){
			return sFechaPublicacion
		}else{
			try{
				return sdf.parse(fechaPublicacion)
			}catch(Exception e){
				return ""
			}
		}
	}
	
	static List<Book> getMostValued(){
		List<Book> books = new ArrayList<Book>()
		books = Book.listOrderByValoracion(max:5,order:'desc')
	}
	
	private String getDateFormat() {
		if (!messageSource){
			messageSource = ApplicationHolder.getApplication().getMainContext().getBean("messageSource")
		}
		return messageSource.getMessage('dateFormat', [this] as Object[],
		LCH.getLocale())
	}
}
