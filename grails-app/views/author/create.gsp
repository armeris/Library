
<%@ page import="com.biblio.Author" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${authorInstance}">
            <div class="errors">
                <g:renderErrors bean="${authorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="author.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" maxlength="15" value="${authorInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido1"><g:message code="author.apellido1.label" default="Apellido1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'apellido1', 'errors')}">
                                    <g:textField name="apellido1" maxlength="15" value="${authorInstance?.apellido1}" />
                                </td>
                            </tr>
                        
                        	
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="apellido2"><g:message code="author.apellido2.label" default="Apellido2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: authorInstance, field: 'apellido2', 'errors')}">
                                    <g:textField name="apellido2" maxlength="15" value="${authorInstance?.apellido2}" />
                                </td>
                            </tr>
                            
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
