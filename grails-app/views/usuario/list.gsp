
<%@ page import="les.ejc.Usuario" %>
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
            <g:if test="${session.user.j5Atual == true}">
			<span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			</g:if>
			Debug:
 			<%="usuario: "%>
			<%=session.user%>
			<%=session.user.tipo%>
			<%=session.user.j5Atual%>
 			<%=" | param: " + params%>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nomeCompleto" title="${message(code: 'usuario.nomeCompleto.label', default: 'Nome Completo')}" />
                        
                            <g:sortableColumn property="nomeUsual" title="${message(code: 'usuario.nomeUsual.label', default: 'Nome Usual')}" />
                        
                            <g:sortableColumn property="dataDeNascimento" title="${message(code: 'usuario.dataDeNascimento.label', default: 'Data De Nascimento')}" />
                        
                            <th><g:message code="usuario.endereco.label" default="Endereco" /></th>
                        
                            <g:sortableColumn property="telefone" title="${message(code: 'usuario.telefone.label', default: 'Telefone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "nomeUsual")}</td>
                        
                            <td><g:formatDate date="${usuarioInstance.dataDeNascimento}" /></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "endereco")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "telefone")}</td>
                        
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
