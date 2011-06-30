
<%@ page import="ejc.Reflexao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reflexao.label', default: 'Reflexao')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div class="body">
            <h2>Reflex&otilde;es</h2>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Inserir Reflex&atilde;o" args="[entityName]" /></g:link></span>
            <br/><br/>
			<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="texto" title="${message(code: 'reflexao.texto.label', default: 'Frase de Reflex&atilde;o')}" />
						</tr>
                    </thead>
                    <tbody>
                    <g:each in="${reflexaoInstanceList}" status="i" var="reflexaoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: reflexaoInstance, field: "texto")}</td>
							<td><g:form>
								<g:hiddenField name="id" value="${reflexaoInstance?.id}" />
								<g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
								</g:form>
					        </td>
					        <td><g:form>
								<g:hiddenField name="id" value="${reflexaoInstance?.id}" />
								<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
								</g:form>
					         </td>
            </div>
						
						
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reflexaoInstanceTotal}" />
            </div>
        </div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </body>
</html>
