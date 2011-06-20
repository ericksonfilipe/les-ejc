
<%@ page import="les.ejc.Oficio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oficio.label', default: 'Oficio')}" />
        <title>Of&iacute;cios</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Of&iacute;cios</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'oficio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nomeRemetente" title="${message(code: 'oficio.nomeRemetente.label', default: 'Nome Remetente')}" />
                                              
                            <g:sortableColumn property="nomeDestinatario" title="${message(code: 'oficio.nomeDestinatario.label', default: 'Nome Destinatario')}" />
							
							<g:sortableColumn property="solicitacao" title="${message(code: 'oficio.solicitacao.label', default: 'Solicitacao')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${oficioInstanceList}" status="i" var="oficioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${oficioInstance.id}">${fieldValue(bean: oficioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "nomeRemetente")}</td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "nomeDestinatario")}</td>
							
							<td>${fieldValue(bean: oficioInstance, field: "solicitacao")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${oficioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
