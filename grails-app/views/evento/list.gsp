
<%@ page import="les.ejc.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
        <title>Eventos</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Eventos</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'evento.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="data" title="${message(code: 'evento.data.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'evento.nome.label', default: 'Nome')}" />
							
							<g:sortableColumn property="descricao" title="${message(code: 'evento.descricao.label', default: 'Descricao')}" />
                        
                            <g:sortableColumn property="horario" title="${message(code: 'evento.horario.label', default: 'Horario')}" />
                        
                            <g:sortableColumn property="local" title="${message(code: 'evento.local.label', default: 'Local')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${eventoInstance.id}">${fieldValue(bean: eventoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${eventoInstance.data}" /></td>
                        
                            <td>${fieldValue(bean: eventoInstance, field: "nome")}</td>
							
							<td>${fieldValue(bean: eventoInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: eventoInstance, field: "horario")}</td>
                        
                            <td>${fieldValue(bean: eventoInstance, field: "local")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${eventoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
