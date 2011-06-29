

<%@ page import="ejc.Oficio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'oficio.label', default: 'Oficio')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<resource:dateChooser />
    </head>
    <body>
        <div id="pageBody">
            <h2>Editar Of&iacute;cio</h2>
			
			<span class="menuButton"><g:link class="list" action="list"><g:message code="Ver os oficios cadastrados" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Criar Oficio" args="[entityName]" /></g:link></span>
			<br/><br/>
			
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${oficioInstance}">
            <div class="errors">
                <g:renderErrors bean="${oficioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${oficioInstance?.id}" />
                <g:hiddenField name="version" value="${oficioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeRemetente"><g:message code="oficio.nomeRemetente.label" default="Nome Remetente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'nomeRemetente', 'errors')}">
                                    <g:textField name="nomeRemetente" maxlength="100" value="${oficioInstance?.nomeRemetente}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estadoCivilRemetente"><g:message code="oficio.estadoCivilRemetente.label" default="Estado Civil Remetente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'estadoCivilRemetente', 'errors')}">
                                    <g:select name="estadoCivilRemetente" from="${oficioInstance.constraints.estadoCivilRemetente.inList}" value="${oficioInstance?.estadoCivilRemetente}" valueMessagePrefix="oficio.estadoCivilRemetente"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="profissaoRemetente"><g:message code="oficio.profissaoRemetente.label" default="Profissao Remetente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'profissaoRemetente', 'errors')}">
                                    <g:textField name="profissaoRemetente" maxlength="100" value="${oficioInstance?.profissaoRemetente}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enderecoRemetente"><g:message code="oficio.enderecoRemetente.label" default="Endereco Remetente" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'enderecoRemetente', 'errors')}">
                                    <g:textField name="enderecoRemetente" maxlength="200" value="${oficioInstance?.enderecoRemetente}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeDestinatario"><g:message code="oficio.nomeDestinatario.label" default="Nome Destinatario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'nomeDestinatario', 'errors')}">
                                    <g:textField name="nomeDestinatario" maxlength="100" value="${oficioInstance?.nomeDestinatario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cargoDestinatario"><g:message code="oficio.cargoDestinatario.label" default="Cargo Destinatario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'cargoDestinatario', 'errors')}">
                                    <g:textField name="cargoDestinatario" maxlength="100" value="${oficioInstance?.cargoDestinatario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="empresaDestinatario"><g:message code="oficio.empresaDestinatario.label" default="Empresa Destinatario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'empresaDestinatario', 'errors')}">
                                    <g:textField name="empresaDestinatario" maxlength="100" value="${oficioInstance?.empresaDestinatario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="solicitacao"><g:message code="oficio.solicitacao.label" default="Solicitacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'solicitacao', 'errors')}">
                                    <g:textArea name="solicitacao" cols="40" rows="5" value="${oficioInstance?.solicitacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="objetivoSolicitacao"><g:message code="oficio.objetivoSolicitacao.label" default="Objetivo Solicitacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'objetivoSolicitacao', 'errors')}">
                                    <g:textArea name="objetivoSolicitacao" cols="40" rows="5" value="${oficioInstance?.objetivoSolicitacao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="local"><g:message code="oficio.local.label" default="Local" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'local', 'errors')}">
                                    <g:textField name="local" maxlength="100" value="${oficioInstance?.local}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="oficio.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: oficioInstance, field: 'data', 'errors')}">
									<richui:dateChooser name="data" format="dd.MM.yyyy" value="${new Date()}" locale="en" firstDayOfWeek="Mo" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
