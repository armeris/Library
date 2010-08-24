package com.biblio

import java.text.SimpleDateFormat
import org.codehaus.groovy.grails.commons.ApplicationHolder
import org.springframework.context.i18n.LocaleContextHolder as LCH

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

class Book implements Serializable {
	
	String titulo
	String ISBN
	Date fechaPublicacion
	String SFechaPublicacion
	String comentario
	int valoracion
	boolean leido
	Editorial editorial
	
	def messageSource
	
	static hasMany = [autores:Author]
	                  
    static transients = ["SFechaPublicacion"]
	                  
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
	
	void setSFechaPublicacion(String fecha){
		SimpleDateFormat sdf
		if(getDateFormat()){
			sdf = new SimpleDateFormat(getDateFormat())
			this.SFechaPublicacion = fecha
			try{
				this.fechaPublicacion = sdf.parse(fecha)
			}catch(Exception e){
				e.printStackTrace()
				this.fechaPublicacion = null
				this.SFechaPublicacion = null
			}
		}
	}
	
	String getSFechaPublicacion(){
		SimpleDateFormat sdf
		if(getDateFormat()){
			sdf = new SimpleDateFormat(getDateFormat())
		
			if(SFechaPublicacion){
				return SFechaPublicacion
			}else{
				try{
					return sdf.format(fechaPublicacion)
				}catch(Exception e){
					return ""
				}
			}
		}else{
			return ""
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
		if(messageSource){
			return messageSource.getMessage('dateFormat', [this] as Object[],LCH.getLocale())
		}else{
			return null
		}
	}
}
