
<%@ page import="les.ejc.Ata" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ata.label', default: 'Ata')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ata.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="data" title="${message(code: 'ata.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="pauta" title="${message(code: 'ata.pauta.label', default: 'Pauta')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ataInstanceList}" status="i" var="ataInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ataInstance.id}">${fieldValue(bean: ataInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${ataInstance.data}" /></td>
                        
                            <td>${fieldValue(bean: ataInstance, field: "pauta")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ataInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
