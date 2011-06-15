
<%@ page import="les.ejc.Noticia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'noticia.label', default: 'Noticia')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h2>Notícias</h2>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Inserir Notícia" args="[entityName]" /></g:link></span>
			<br/><br/>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'noticia.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'noticia.descricao.label', default: 'Descricao')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${noticiaInstanceList}" status="i" var="noticiaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${noticiaInstance.id}">${fieldValue(bean: noticiaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: noticiaInstance, field: "descricao")}</td>
							
                    <td><g:form>
                    <g:hiddenField name="id" value="${noticiaInstance?.id}" />
                    <g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    </g:form></td>
					
					<td><g:form>
                    <g:hiddenField name="id" value="${noticiaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:form></td>							
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${noticiaInstanceTotal}" />
            </div>
        </div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    </body>
</html>
