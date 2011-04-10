
<%@ page import="les.ejc.EquipeDeTrabalho" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'equipeDeTrabalho.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nomeEquipe" title="${message(code: 'equipeDeTrabalho.nomeEquipe.label', default: 'Nome Equipe')}" />
                        
                            <th><g:message code="equipeDeTrabalho.jovemCoordenador1.label" default="Jovem Coordenador1" /></th>
                        
                            <th><g:message code="equipeDeTrabalho.jovemCoordenador2.label" default="Jovem Coordenador2" /></th>
                        
                            <th><g:message code="equipeDeTrabalho.casalCoordenador.label" default="Casal Coordenador" /></th>
                        
                            <th><g:message code="equipeDeTrabalho.encontro.label" default="Encontro" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${equipeDeTrabalhoInstanceList}" status="i" var="equipeDeTrabalhoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${equipeDeTrabalhoInstance.id}">${fieldValue(bean: equipeDeTrabalhoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: equipeDeTrabalhoInstance, field: "nomeEquipe")}</td>
                        
                            <td>${fieldValue(bean: equipeDeTrabalhoInstance, field: "jovemCoordenador1")}</td>
                        
                            <td>${fieldValue(bean: equipeDeTrabalhoInstance, field: "jovemCoordenador2")}</td>
                        
                            <td>${fieldValue(bean: equipeDeTrabalhoInstance, field: "casalCoordenador")}</td>
                        
                            <td>${fieldValue(bean: equipeDeTrabalhoInstance, field: "encontro")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${equipeDeTrabalhoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
