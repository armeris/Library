
<%@ page import="com.biblio.Author" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
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
                            <td valign="top" class="name"><g:message code="author.nombre.label" default="Nombre" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: authorInstance, field: "nombre")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="author.apellido1.label" default="Apellido1" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: authorInstance, field: "apellido1")}</td>
                            
                        </tr>
                    
                    	<g:if test="${authorInstance.apellido2!=null && authorInstance.apellido2.length()>0}">
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="author.apellido2.label" default="Apellido2" /></td>
	                            
	                            <td valign="top" class="value">${fieldValue(bean: authorInstance, field: "apellido2")}</td>
	                            
	                        </tr>
                        </g:if>
                    
                    	<g:if test="${authorInstance.libros!=null && authorInstance.libros.size()>0}">
	                        <tr class="prop">
	                            <td valign="top" class="name"><g:message code="author.libros.label" default="Libros" /></td>
	                            
	                            <td valign="top" style="text-align: left;" class="value">
	                                <ul>
	                                <g:each in="${authorInstance.libros}" var="l">
	                                    <li><g:link controller="book" action="show" id="${l.id}">${l?.titulo}</g:link></li>
	                                </g:each>
	                                </ul>
	                            </td>
	                            
	                        </tr>
                        </g:if>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${authorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
