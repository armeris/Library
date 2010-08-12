
<%@ page import="com.biblio.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript>
        	function redirect(id){
        		location.href='/Library/libro/show/'+id;
        	}
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'libro.titulo.label', default: 'Titulo')}" />
                        
                            <g:sortableColumn property="ISBN" title="${message(code: 'libro.ISBN.label', default: 'ISBN')}" />
                        
                            <g:sortableColumn property="fechaPublicacion" title="${message(code: 'libro.fechaPublicacion.label', default: 'Fecha Publicacion')}" />
                        
                            <g:sortableColumn property="comentario" title="${message(code: 'libro.comentario.label', default: 'Comentario')}" />
                        
                            <g:sortableColumn property="valoracion" title="${message(code: 'libro.valoracion.label', default: 'Valoracion')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bookInstanceList}" status="i" var="bookInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick="redirect(${bookInstance.id});">
                        
                            <td>${fieldValue(bean: bookInstance, field: "titulo")}</td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "ISBN")}</td>
                        
                            <td><g:formatDate date="${bookInstance.fechaPublicacion}" /></td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "comentario")}</td>
                        
                            <td>${fieldValue(bean: bookInstance, field: "valoracion")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bookInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
