
<%@ page import="com.biblio.Author" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript>
        	function redirect(id){
        		location.href='/Library/author/show/'+id;
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
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'author.nombre.label', default: 'Nombre')}" />
                        
                            <g:sortableColumn property="apellido1" title="${message(code: 'author.apellido1.label', default: 'Apellido1')}" />
                        
                            <g:sortableColumn property="apellido2" title="${message(code: 'author.apellido2.label', default: 'Apellido2')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${authorInstanceList}" status="i" var="authorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick="redirect(${authorInstance.id});">
                        
                            <td>${fieldValue(bean: authorInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: authorInstance, field: "apellido1")}</td>
                        
                            <td>${fieldValue(bean: authorInstance, field: "apellido2")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${authorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
