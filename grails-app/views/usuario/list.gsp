
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
            <h1><g:message code="Lista de Usuários" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <tbody>
                        <tr><g:link action="listJovem">Listar Jovens</g:link></tr>
						<br \>
						<tr><g:link action="listCasal">Listar Casais</g:link></tr>
						<br \>
						<tr><g:link action="listPadre">Listar Padres</g:link></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
