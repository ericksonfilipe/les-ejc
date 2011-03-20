
<%@ page import="les.ejc.Circulo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'circulo.label', default: 'Circulo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'circulo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="cor" title="${message(code: 'circulo.cor.label', default: 'Cor')}" />
                        
                            <g:sortableColumn property="nomeCirculo" title="${message(code: 'circulo.nomeCirculo.label', default: 'Nome Circulo')}" />
                        
                            <th><g:message code="circulo.jovemCoordenador.label" default="Jovem Coordenador" /></th>
                        
                            <th><g:message code="circulo.casalApoio.label" default="Casal Apoio" /></th>
                        
                            <th><g:message code="circulo.encontro.label" default="Encontro" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${circuloInstanceList}" status="i" var="circuloInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${circuloInstance.id}">${fieldValue(bean: circuloInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: circuloInstance, field: "cor")}</td>
                        
                            <td>${fieldValue(bean: circuloInstance, field: "nomeCirculo")}</td>
                        
                            <td>${fieldValue(bean: circuloInstance, field: "jovemCoordenador")}</td>
                        
                            <td>${fieldValue(bean: circuloInstance, field: "casalApoio")}</td>
                        
                            <td>${fieldValue(bean: circuloInstance, field: "encontro")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${circuloInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
