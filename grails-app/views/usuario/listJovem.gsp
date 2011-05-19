
<%@ page import="les.ejc.Usuario" %>
<%@ page import="les.ejc.Usuario.Tipo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<style type="text/css" media="screen">
			.lista {
				margin-top: 20px;
				margin-left: 20px;
			}
        </style>
    </head>
    <body>
        <div id="pageBody">
            <h1>Usu&aacute;rios > Jovens</h1>
			<div class="lista">
				<ul>
					<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
						<g:if test="${usuarioInstance.tipo == Tipo.Jovem}">
							<li><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</g:link></li>
						</g:if>
					</g:each>
				</ul>
			</div>
        </div>
    </body>
</html>
