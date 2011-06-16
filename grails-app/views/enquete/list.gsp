
<%@ page import="les.ejc.Enquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enquete.label', default: 'Enquete')}" />
        <title>Enquetes</title>
    </head>
    <body>
        <div id="pageBody">
            <h1>Enquetes</h1>
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'enquete.id.label', default: 'Id')}" />
                            <g:sortableColumn property="titulo" title="${message(code: 'enquete.titulo.label', default: 'Titulo')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enqueteInstanceList}" status="i" var="enqueteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${enqueteInstance.id}">${fieldValue(bean: enqueteInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: enqueteInstance, field: "titulo")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${enqueteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
