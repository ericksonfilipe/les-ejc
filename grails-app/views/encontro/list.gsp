
<%@ page import="les.ejc.Encontro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'encontro.label', default: 'Encontro')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'encontro.id.label', default: 'Id')}" />
                        
                            <th><g:message code="encontro.dirigenteEspiritual.label" default="Dirigente Espiritual" /></th>
                        
                            <g:sortableColumn property="data" title="${message(code: 'encontro.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="tema" title="${message(code: 'encontro.tema.label', default: 'Tema')}" />
                        
                            <g:sortableColumn property="local" title="${message(code: 'encontro.local.label', default: 'Local')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${encontroInstanceList}" status="i" var="encontroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${encontroInstance.id}">${fieldValue(bean: encontroInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: encontroInstance, field: "dirigenteEspiritual")}</td>
                        
                            <td><g:formatDate date="${encontroInstance.data}" /></td>
                        
                            <td>${fieldValue(bean: encontroInstance, field: "tema")}</td>
                        
                            <td>${fieldValue(bean: encontroInstance, field: "local")}</td>
                        
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
