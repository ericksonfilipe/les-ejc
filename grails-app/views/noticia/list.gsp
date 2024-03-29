
<%@ page import="ejc.Noticia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'noticia.label', default: 'Noticia')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div class="body">
            <h2>Notícias</h2>
			
			<g:if test="${session.user?.j5Atual}">
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Inserir Notícia" args="[entityName]" /></g:link></span>
			<br/><br/>
			</g:if>
			
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
			
			
                <table>
				
                    <thead>
                        <tr>
                            <g:sortableColumn property="descricao" title="${message(code: 'noticia.descricao.label', default: 'Descri&ccedil;&atilde;o')}" />
                        </tr>
                    </thead>
                    <tbody>
					<g:form>
                    <g:each in="${noticiaInstanceList}" status="i" var="noticiaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							
							<g:if test="${noticiaInstance.noticiaPrincipal}">
							<td><b>${fieldValue(bean: noticiaInstance, field: "descricao")}</b></td>
							</g:if>
							<g:else>
							<td>${fieldValue(bean: noticiaInstance, field: "descricao")}</td>
							</g:else>

							<g:if test="${session.user?.j5Atual}">

						    <td><g:form>
								<g:hiddenField name="id" value="${noticiaInstance?.id}" />
								<g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
							</g:form></td>
					
							<td><g:form>
								<g:hiddenField name="id" value="${noticiaInstance?.id}" />
								<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</g:form></td>

							</g:if>
                        </tr>
                    </g:each>
					</g:form>

					
					
                    </tbody>
                </table>

				
            </div>
            <div class="paginateButtons">
                <g:paginate total="${noticiaInstanceTotal}" />
            </div>
			
        </div>
    </body>
</html>
