
<%@ page import="les.ejc.Usuario" %>
<%@ page import="les.ejc.Usuario.Tipo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
		<g:if test="${session?.user?.j5Atual}">
		    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
		</g:if>
            <span class="menuButton"><a class="list" href="${createLink(uri: '/usuario/listNotAtivado')}"><g:message code="Lista de Inativos"/></a></span>

        </div>
        <div class="body">
            <h1><g:message code="Lista de Padres" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />

                            <g:sortableColumn property="nomeCompleto" title="${message(code: 'usuario.nomeCompleto.label', default: 'Nome Completo')}" />

                            <g:sortableColumn property="nomeUsual" title="${message(code: 'usuario.nomeUsual.label', default: 'Nome Usual')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
						<g:if test="${usuarioInstance.tipo == Tipo.Padre}">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

								<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>

								<td>${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</td>

								<td>${fieldValue(bean: usuarioInstance, field: "nomeUsual")}</td>


							</tr>
						</g:if>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${usuarioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>