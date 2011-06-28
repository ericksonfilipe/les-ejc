
<%@ page import="les.ejc.Enquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enquete.label', default: 'Enquete')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
		<div class="body">
			<h2>Enquetes</h2>
			
			<g:if test="${session.user?.j5Atual}">
				<span class="menuButton"><g:link class="create" action="create"><g:message code="Criar Enquete" args="[entityName]" /></g:link></span>
				<br/><br/>
			</g:if>
			
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="list">
				<table>
					<thead>
						<tr>
							<g:sortableColumn property="titulo" title="${message(code: 'enquete.titulo.label', default: 'Titulo')}" />
							<g:sortableColumn property="descricao" title="${message(code: 'enquete.descricao.label', default: 'Descrição')}" />
						</tr>
					</thead>
					<tbody>
					<g:each in="${enqueteInstanceList}" status="i" var="enqueteInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td>${fieldValue(bean: enqueteInstance, field: "titulo")}</td>
							<td>${fieldValue(bean: enqueteInstance, field: "descricao")}</td>
							<g:if test="${session.user?.j5Atual}">
								<td><g:form>
									<g:hiddenField name="id" value="${enqueteInstance?.id}" />
									<g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
								</g:form></td>
						
								<td><g:form>
									<g:hiddenField name="id" value="${enqueteInstance?.id}" />
									<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
								</g:form></td>
							</g:if>
							<td><g:form>
									<g:hiddenField name="id" value="${enqueteInstance?.id}" />
									<g:actionSubmit class="edit" action="votar" value="Votar" />
								</g:form></td>
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
