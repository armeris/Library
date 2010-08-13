package com.biblio

import java.text.SimpleDateFormat 

class Book implements Serializable {
	
	String titulo
	String ISBN
	Date fechaPublicacion
	String sFechaPublicacion
	String comentario
	int valoracion
	boolean leido
	Editorial editorial
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
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy")
		try{
			this.fechaPublicacion = sdf.parse(fecha)
		}catch(Exception e){
			this.fechaPublicacion = null
		}
	}
	
	void setSFechaPublicacion(String fecha){
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy")
		
		this.sFechaPublicacion = fecha
		this.fechaPublicacion = sdf.parse(fecha)
	}
	
	String getSFechaPublicacion(){
		if(sFechaPublicacion){
			return sFechaPublicacion
		}else{
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy")
			try{
				return sdf.parse(fechaPublicacion)
			}catch(Exception e){
				return ""
			}
		}
		
		
	}
}
