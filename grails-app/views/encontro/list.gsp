
<%@ page import="ejc.Encontro" %>
<html>
    <head>
		<resource:autoComplete skin="default" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'encontro.label', default: 'Encontro')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<g:javascript library="prototype" />
		<g:javascript>
			function exibe(id) {
				link = "/ejc/encontro/show/" + id;
				window.open(link, "_self");
			}
		</g:javascript>
    </head>
    <body>
        <div id="pageBody">
            <h2>Encontros</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			
			<h3>Procurar Encontro</h3>
			<richui:autoComplete name="pegarEncontro" action="${createLinkTo('dir': 'encontro/pegarEncontros')}" onItemSelect="document.location.href = \'${createLinkTo(dir: 'encontro/show')}/\' + id;" />
			<br />
			
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
							<g:sortableColumn property="numero" title="${message(code: 'encontro.numero.label', default: 'Número')}" />
                        
                            <g:sortableColumn property="data" title="${message(code: 'encontro.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="tema" title="${message(code: 'encontro.tema.label', default: 'Tema')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${encontroInstanceList}" status="i" var="encontroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onMouseDown="exibe('${encontroInstance.id}');">
                        
							<td>${fieldValue(bean: encontroInstance, field: "numero")}</td>
							                        
                            <td><g:formatDate format="dd/MM/yyyy" date="${encontroInstance.data}" /></td>
                        
                            <td>${fieldValue(bean: encontroInstance, field: "tema")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${encontroInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
