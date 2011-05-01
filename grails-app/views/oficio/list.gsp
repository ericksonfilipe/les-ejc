
<%@ page import="les.ejc.Oficio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oficio.label', default: 'Oficio')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'oficio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nomeRemetente" title="${message(code: 'oficio.nomeRemetente.label', default: 'Nome Remetente')}" />
                        
                            <g:sortableColumn property="estadoCivilRemetente" title="${message(code: 'oficio.estadoCivilRemetente.label', default: 'Estado Civil Remetente')}" />
                        
                            <g:sortableColumn property="profissaoRemetente" title="${message(code: 'oficio.profissaoRemetente.label', default: 'Profissao Remetente')}" />
                        
                            <g:sortableColumn property="enderecoRemetente" title="${message(code: 'oficio.enderecoRemetente.label', default: 'Endereco Remetente')}" />
                        
                            <g:sortableColumn property="nomeDestinatario" title="${message(code: 'oficio.nomeDestinatario.label', default: 'Nome Destinatario')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${oficioInstanceList}" status="i" var="oficioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${oficioInstance.id}">${fieldValue(bean: oficioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "nomeRemetente")}</td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "estadoCivilRemetente")}</td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "profissaoRemetente")}</td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "enderecoRemetente")}</td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "nomeDestinatario")}</td>
                        
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
