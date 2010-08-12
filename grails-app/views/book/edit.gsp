
<%@ page import="com.biblio.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bookInstance}">
            <div class="errors">
                <g:renderErrors bean="${bookInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${bookInstance?.id}" />
                <g:hiddenField name="version" value="${bookInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="titulo"><g:message code="libro.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" maxlength="50" value="${bookInstance?.titulo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ISBN"><g:message code="libro.ISBN.label" default="ISBN" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'ISBN', 'errors')}">
                                    <g:textField name="ISBN" value="${bookInstance?.ISBN}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fechaDePublicacion"><g:message code="libro.fechaDePublicacion.label" default="Fecha De Publicacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'fechaDePublicacion', 'errors')}">
                                    <g:textField name="fechaDePublicacion" value="${bookInstance?.sFechaPublicacion}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="comentario"><g:message code="libro.comentario.label" default="Comentario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'comentario', 'errors')}">
                                    <g:textArea name="comentario" cols="40" rows="5" value="${bookInstance?.comentario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valoracion"><g:message code="libro.valoracion.label" default="Valoracion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'valoracion', 'errors')}">
                                    <g:select name="valoracion" from="${bookInstance.constraints.valoracion.inList}" value="${fieldValue(bean: bookInstance, field: 'valoracion')}" valueMessagePrefix="libro.valoracion"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="editorial"><g:message code="libro.editorial.label" default="Editorial" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'editorial', 'errors')}">
                                    <g:select name="editorial.id" from="${com.biblio.Editorial.list()}" optionKey="id" value="${bookInstance?.editorial?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="autores"><g:message code="libro.autores.label" default="Autores" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'autores', 'errors')}">
                                    <g:select name="autores" from="${com.biblio.Author.list()}" multiple="yes" optionKey="id" size="5" value="${bookInstance?.autores*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="leido"><g:message code="libro.leido.label" default="Leido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'leido', 'errors')}">
                                    <g:checkBox name="leido" value="${bookInstance?.leido}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
