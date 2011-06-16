
<%@ page import="les.ejc.OpcaoEnquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'opcaoEnquete.id.label', default: 'Id')}" />
                        
                            <th><g:message code="opcaoEnquete.enquete.label" default="Enquete" /></th>
                        
                            <g:sortableColumn property="opcao" title="${message(code: 'opcaoEnquete.opcao.label', default: 'Opcao')}" />
                        
                            <g:sortableColumn property="votos" title="${message(code: 'opcaoEnquete.votos.label', default: 'Votos')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${opcaoEnqueteInstanceList}" status="i" var="opcaoEnqueteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${opcaoEnqueteInstance.id}">${fieldValue(bean: opcaoEnqueteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: opcaoEnqueteInstance, field: "enquete")}</td>
                        
                            <td>${fieldValue(bean: opcaoEnqueteInstance, field: "opcao")}</td>
                        
                            <td>${fieldValue(bean: opcaoEnqueteInstance, field: "votos")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${opcaoEnqueteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
