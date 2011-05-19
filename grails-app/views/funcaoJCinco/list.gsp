
<%@ page import="les.ejc.FuncaoJCinco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'funcaoJCinco.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dataInicio" title="${message(code: 'funcaoJCinco.dataInicio.label', default: 'Data Inicio')}" />
                        
                            <g:sortableColumn property="funcao" title="${message(code: 'funcaoJCinco.funcao.label', default: 'Funcao')}" />
                        
                            <g:sortableColumn property="dataFim" title="${message(code: 'funcaoJCinco.dataFim.label', default: 'Data Fim')}" />
                        
                            <th><g:message code="funcaoJCinco.usuario.label" default="Usuario" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${funcaoJCincoInstanceList}" status="i" var="funcaoJCincoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${funcaoJCincoInstance.id}">${fieldValue(bean: funcaoJCincoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${funcaoJCincoInstance.dataInicio}" /></td>
                        
                            <td>${fieldValue(bean: funcaoJCincoInstance, field: "funcao")}</td>
                        
                            <td><g:formatDate date="${funcaoJCincoInstance.dataFim}" /></td>
                        
                            <td>${fieldValue(bean: funcaoJCincoInstance, field: "usuario")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${funcaoJCincoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
