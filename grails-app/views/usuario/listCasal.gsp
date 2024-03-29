<%@ page import="ejc.Usuario" %>
<%@ page import="ejc.Usuario.Tipo" %>
<html>
    <head>
		<resource:autoComplete skin="default" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<g:javascript library="prototype" />
		<g:javascript>
			function exibe(id) {
				link = "/ejc/usuario/show/" + id;
				window.open(link, "_self");
			}
		</g:javascript>
    </head>
    <body>
        <div id="pageBody">
            <h2>Casais</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			
			<h3>Procurar Casal</h3>
			<richui:autoComplete name="pegarUsuarioCasal" action="${createLinkTo('dir': 'usuario/pegarUsuariosCasados')}" onItemSelect="document.location.href = \'${createLinkTo(dir: 'usuario/show')}/\' + id;" />
			<br />
			
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="nomeCompleto" title="${message(code: 'usuario.nomeCompleto.label', default: 'Nome Completo')}" />

                            <g:sortableColumn property="nomeUsual" title="${message(code: 'usuario.nomeUsual.label', default: 'Nome Usual')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
						<g:if test="${usuarioInstance.tipo == Tipo.Casal}">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onMouseDown="exibe('${usuarioInstance.id}');">

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