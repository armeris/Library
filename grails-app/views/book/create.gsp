
<%@ page import="com.biblio.Book" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'libro.label', default: 'Libro')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript>
        	function hideValoracion(elem){
                var val = document.getElementById('valoracion');
                var sel = document.getElementById('sValoracion');
                
                if(elem.checked){
                    val.style.display='';
                    sel.options.length=0;
                    sel.options[0] = new Option(0,0,true,true);
                    sel.options[1] = new Option(1,1,false,false);
                    sel.options[2] = new Option(2,2,false,false);
                    sel.options[3] = new Option(3,3,false,false);
                    sel.options[4] = new Option(4,4,false,false);
                }else{
                    val.style.display='none';
                    sel.options.length=0;
                    sel.options[0] = new Option('1',1,true,true);
                }
            }
        </g:javascript>
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
            <g:hasErrors bean="${bookInstance}">
            <div class="errors">
                <g:renderErrors bean="${bookInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
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
                        
                        	<g:if test="${com.biblio.Editorial.list().size()>0}">
	                        	<tr class="prop">
	                                <td valign="top" class="name">
	                                    <label for="editorial"><g:message code="libro.editorial.label" default="Editorial" /></label>
	                                </td>
	                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'editorial', 'errors')}">
	                                    <g:select name="editorial.id" from="${com.biblio.Editorial.list()}" optionKey="id" value="${bookInstance?.editorial?.id}"  />
	                                </td>
	                            </tr>
                            </g:if>
                            <g:else>
                            	<tr class="prop">
                            		<td valign="top" class="name">
	                                    <label for="editorial"><g:message code="libro.editorial.label" default="Editorial" /></label>
	                                </td>
	                                
                            		<td valigh="top">
                            			<g:link controller="editorial" action="create"><g:message code="libro.editorial.add"/></g:link>
                            		</td>
                            	</tr>
                            </g:else>
                            
                            <g:if test="${com.biblio.Author.list().size()>0}">
	                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="autores"><g:message code="libro.autores.label" default="Autores" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'autores', 'errors')}">
                                    <g:select name="autores" from="${com.biblio.Author.list()}" multiple="yes" optionKey="id" size="5" value="${bookInstance?.autores*.id}" />
                                </td>
                            </tr>
                            </g:if>
                            <g:else>
                            	<tr class="prop">
                            		<td valign="top" class="name">
	                                    <label for="author"><g:message code="libro.author.label" default="Autores" /></label>
	                                </td>
	                                
                            		<td valigh="top">
                            			<g:link controller="author" action="create"><g:message code="libro.autor.add"/></g:link>
                            		</td>
                            	</tr>
                            </g:else>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="fechaPublicacion"><g:message code="libro.fechaPublicacion.label" default="Fecha Publicacion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'fechaPublicacion', 'errors')}">
                                    <g:textField name="sFechaPublicacion" value="${bookInstance.sFechaPublicacion}" />
                                </td>
                            </tr>
                        
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="leido"><g:message code="libro.leido.label" default="Leido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'leido', 'errors')}">
                                    <g:checkBox name="leido" value="${bookInstance?.leido}" onclick='hideValoracion(this);'/>
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
                        
                            <tr class="prop" id="valoracion" style="display:none;">
                                <td valign="top" class="name">
                                    <label for="valoracion"><g:message code="libro.valoracion.label" default="Valoracion" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bookInstance, field: 'valoracion', 'errors')}">
                                    <g:select id="sValoracion" name="valoracion" from="${bookInstance.constraints.valoracion.inList}" value="${fieldValue(bean: bookInstance, field: 'valoracion')}" valueMessagePrefix="libro.valoracion"  />
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
