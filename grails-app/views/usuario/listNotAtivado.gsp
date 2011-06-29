
<%@ page import="ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<g:javascript library="prototype" />
		<g:javascript>
			function exibe(id) {
				link = "/les-ejc/usuario/show/" + id;
				window.open(link, "_self");
			}
		</g:javascript>
    </head>
    <body>
        <div id="pageBody">
            <h2>Usu&aacute;rios Inativos</h2>
			<h3>(Não receberam E-Mail ou não estão com Status Ativo) </h3>
			<br/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="nomeCompleto" title="${message(code: 'usuario.nomeCompleto.label', default: 'Nome Completo')}" />
                        
                            <g:sortableColumn property="nomeUsual" title="${message(code: 'usuario.nomeUsual.label', default: 'Nome Usual')}" />
                        
                            <g:sortableColumn property="dataDeNascimento" title="${message(code: 'usuario.dataDeNascimento.label', default: 'Data De Nascimento')}" />
                        
                            <th><g:message code="usuario.endereco.label" default="Endereco" /></th>
                        
                            <g:sortableColumn property="telefone1" title="${message(code: 'usuario.telefone1.label', default: 'Telefone1')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onMouseDown="exibe('${usuarioInstance.id}');">
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "nomeUsual")}</td>
                        
                            <td><g:formatDate date="${usuarioInstance.dataDeNascimento}" /></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "endereco")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "telefone1")}</td>
                        
                        </tr>
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
