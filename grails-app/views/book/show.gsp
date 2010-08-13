
<%@ page import="com.biblio.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="libro.titulo.label" default="Titulo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "titulo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="libro.ISBN.label" default="ISBN" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "ISBN")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="libro.fechaDePublicacion.label" default="Fecha De Publicacion" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "sFechaPublicacion")}</td>
                            
                        </tr>
                    
                    	<g:if test="${bookInstance.comentario}">
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="libro.comentario.label" default="Comentario" /></td>
	                            
	                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "comentario")}</td>
	                            
	                        </tr>
                        </g:if>
                    
                    	<g:if test="${bookInstance.leido}">
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="libro.valoracion.label" default="Valoracion" /></td>
	                            
	                            <td valign="top" class="value">${fieldValue(bean: bookInstance, field: "valoracion")}</td>
	                            
	                        </tr>
                        </g:if>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="libro.editorial.label" default="Editorial" /></td>
                            
                            <td valign="top" class="value"><g:link controller="editorial" action="show" id="${bookInstance?.editorial?.id}">${bookInstance?.editorial?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="libro.autores.label" default="Autores" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${bookInstance.autores}" var="a">
                                    <li><g:link controller="author" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="libro.leido.label" default="Leido" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${bookInstance?.leido}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bookInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
