
<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
		<center>
				<span class="imagem">
					<g:link controller="usuario" action="listJovem"><img src="${resource(dir:'images',file:'jovens.png')}" /></g:link>
				</span>
				<span class="imagem">
					<g:link controller='usuario' action='listCasal'><img src="${resource(dir:'images',file:'casais.png')}" /></g:link>
				</span>
				<span class="imagem">
					<g:link controller='usuario' action='listPadre'><img src="${resource(dir:'images',file:'padres.png')}" /></g:link>
				</span>				
        </center>
		</div>
    </body>
</html>
