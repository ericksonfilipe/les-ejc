
<%@ page import="ejc.Oficio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oficio.label', default: 'Oficio')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Dados do Of&iacute;cio</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			
			<g:form target="_blank">
                <g:hiddenField name="id" value="${oficioInstance?.id}" />
				<g:if test="${session?.user?.j5Atual}">
					<td text-align="right">
						<span class="button"><g:actionSubmit class="print" action="gerarhtml" value="Imprimir"/></span>
					</td>
				</g:if>
			</g:form>
		
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.nomeRemetente.label" default="Nome Remetente" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "nomeRemetente")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.estadoCivilRemetente.label" default="Estado Civil Remetente" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "estadoCivilRemetente")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.profissaoRemetente.label" default="Profissao Remetente" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "profissaoRemetente")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.enderecoRemetente.label" default="Endereco Remetente" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "enderecoRemetente")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.nomeDestinatario.label" default="Nome Destinatario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "nomeDestinatario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.cargoDestinatario.label" default="Cargo Destinatario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "cargoDestinatario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.empresaDestinatario.label" default="Empresa Destinatario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "empresaDestinatario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.solicitacao.label" default="Solicitacao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "solicitacao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.objetivoSolicitacao.label" default="Objetivo Solicitacao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "objetivoSolicitacao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.local.label" default="Local" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: oficioInstance, field: "local")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="oficio.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${oficioInstance?.data}" /></td>
                            
                        </tr>
						
						<tr class="prop">
                            <td valign="top" class="name">Oficio</td>
                            
                            <td valign="top" class="value">${oficioInstance?.getOficio()}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${oficioInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
