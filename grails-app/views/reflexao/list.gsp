
<%@ page import="les.ejc.Reflexao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reflexao.label', default: 'Reflexao')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h2>Reflexoes</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'reflexao.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="texto" title="${message(code: 'reflexao.texto.label', default: 'Texto')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reflexaoInstanceList}" status="i" var="reflexaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reflexaoInstance.id}">${fieldValue(bean: reflexaoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: reflexaoInstance, field: "texto")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reflexaoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
