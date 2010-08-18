<%@ page import="com.biblio.Book" %>
<%@ page import="com.biblio.Author" %>

<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
		<style type="text/css" media="screen">

			#nav {
				margin-top:20px;
				margin-left:30px;
				width:228px;
				float:left;

			}
			.homePagePanel * {
				margin:0px;
			}
			.homePagePanel .panelBody ul {
				list-style-type:none;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody h1 {
				text-transform:uppercase;
				font-size:1.1em;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody {
			    background: url(images/leftnav_midstretch.png) repeat-y top;
				margin:0px;
				padding:15px;
			}
			.homePagePanel .panelBtm {
			    background: url(images/leftnav_btm.png) no-repeat top;
				height:20px;
				margin:0px;
			}

			.homePagePanel .panelTop {
			    background: url(images/leftnav_top.png) no-repeat top;
				height:11px;
				margin:0px;
			}
			h2 {
				margin-top:15px;
				margin-bottom:15px;
				font-size:1.2em;
			}
			#pageBody {
				margin-left:280px;
				margin-right:20px;
			}
		</style>
    </head>
    <body>
		<div id="nav">
			<div class="homePagePanel">
				<g:if test="${Book.list().size()>0}">
					<div class="panelTop">
	
					</div>
					<div class="panelBody">
						<h1><g:message code="preferred.books"/></h1>
						<ul>
							<g:each var="book" in="${Book.getMostValued()}">
								<li><g:link action="show" controller="book" id="${book.id}">${book.titulo}</g:link></li>
							</g:each>
						</ul>
						<h1><g:message code="preferred.authors" /></h1>
						<ul>
							<g:each var="author" in="${Author.getPreferredAuthors()}">
								<li><g:link action="show" controller="author" id="${author.id}">${author.nombre+" "+author.apellido1}</g:link></li>
							</g:each>
						</ul>
					</div>
					<div class="panelBtm">
				</g:if>
				</div>
			</div>


		</div>
		<div id="pageBody">
			<div style="width:200px;height:200px;position:relative;float:left;margin:20 20 20 20;">
				<g:link action="list" controller="book"><img title="${message(code:'book.list')}" src="${createLinkTo(dir: 'images', file: 'libros.png')}"/></g:link>
			</div>
			<div style="width:200px;height:200px;position:relative;float:left;margin:20 20 20 20;">
				<g:link action="create" controller="book"><img title="${message(code:'add.book')}" src="${createLinkTo(dir: 'images', file: 'addbook.png')}"/></g:link>
			</div>
			<div style="width:200px;height:200px;position:relative;float:left;margin:20 20 20 20;">
				<g:link action="list" controller="author"><img title="${message(code:'author.list')}" src="${createLinkTo(dir: 'images', file: 'writers.png')}"/></g:link>
			</div>
			<div style="width:200px;height:200px;position:relative;float:left;margin:20 20 20 20;">
				<g:link action="list" controller="editorial"><img title="${message(code:'editorial.list')}" src="${createLinkTo(dir: 'images', file: 'editorials.png')}"/></g:link>
			</div>
		</div>
    </body>
</html>