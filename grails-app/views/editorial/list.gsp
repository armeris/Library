
<%@ page import="com.biblio.Editorial" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'editorial.label', default: 'Editorial')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript>
        	function redirect(id){
        		location.href='/Library/editorial/show/'+id;
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
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'editorial.nombre.label', default: 'Nombre')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${editorialInstanceList}" status="i" var="editorialInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick="redirect(${editorialInstance.id});">
                        
                            <td>${fieldValue(bean: editorialInstance, field: "nombre")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${editorialInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
