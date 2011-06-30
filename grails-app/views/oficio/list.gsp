
<%@ page import="ejc.Oficio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oficio.label', default: 'Oficio')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<g:javascript library="prototype" />
    </head>
    <body>
        <div id="pageBody">
            <h2>Of&iacute;cios</h2>
			
			<g:if test="${session.user?.j5Atual}">
				<span class="menuButton"><g:link class="create" action="create"><g:message code="Criar Oficio" args="[entityName]" /></g:link></span>
				<br/><br/>
			</g:if>
			
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="nomeRemetente" title="${message(code: 'oficio.nomeRemetente.label', default: 'Nome Remetente')}" />
                                              
                            <g:sortableColumn property="nomeDestinatario" title="${message(code: 'oficio.nomeDestinatario.label', default: 'Nome Destinatario')}" />
							
							<g:sortableColumn property="solicitacao" title="${message(code: 'oficio.solicitacao.label', default: 'Solicitacao')}" />
							
							<g:sortableColumn property="nomeRemetente" title="Imprimir" />
							
							<g:sortableColumn property="nomeRemetente" title="Editar" />
							
							<g:sortableColumn property="nomeRemetente" title="Excluir" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${oficioInstanceList}" status="i" var="oficioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: oficioInstance, field: "nomeRemetente")}</td>
                        
                            <td>${fieldValue(bean: oficioInstance, field: "nomeDestinatario")}</td>
							
							<td>${fieldValue(bean: oficioInstance, field: "solicitacao")}</td>
							
							<g:if test="${session.user?.j5Atual}">
								<td><g:form target="_blank">
									<g:hiddenField name="id" value="${oficioInstance?.id}" />
									<g:actionSubmit class="print" action="gerarhtml" value="Imprimir" />
								</g:form></td>
								
								<td><g:form>
									<g:hiddenField name="id" value="${oficioInstance?.id}" />
									<g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
								</g:form></td>
						
								<td><g:form>
									<g:hiddenField name="id" value="${oficioInstance?.id}" />
									<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
								</g:form></td>
							</g:if>
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
