

<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
		<resource:dateChooser />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                <g:hiddenField name="version" value="${usuarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeCompleto"><g:message code="usuario.nomeCompleto.label" default="Nome Completo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nomeCompleto', 'errors')}">
                                    <g:textField name="nomeCompleto" maxlength="100" value="${usuarioInstance?.nomeCompleto}" />
                                </td>
                            </tr>
							
							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeCompleto2"><g:message code="usuario.nomeCompleto2.label" default="Nome Completo (Marido/Mulher)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nomeCompleto2', 'errors')}">
                                    <g:textField name="nomeCompleto2" maxlength="100" value="${usuarioInstance?.nomeCompleto2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeUsual"><g:message code="usuario.nomeUsual.label" default="Nome Usual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nomeUsual', 'errors')}">
                                    <g:textField name="nomeUsual" maxlength="40" value="${usuarioInstance?.nomeUsual}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeNascimento"><g:message code="usuario.dataDeNascimento.label" default="Data De Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataDeNascimento', 'errors')}">
                                    <richui:dateChooser name="dataDeNascimento" format="dd.MM.yyyy" value="${usuarioInstance?.dataDeNascimento?.getTime()}" locale="en" firstDayOfWeek="Mo" />
                                </td>
                            </tr>
							
							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeNascimento2"><g:message code="usuario.dataDeNascimento2.label" default="Data De Nascimento(Marido/Mulher)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataDeNascimento2', 'errors')}">
                                    <richui:dateChooser name="dataDeNascimento2" format="dd.MM.yyyy" value="${usuarioInstance?.dataDeNascimento2?.getTime()}" locale="en" firstDayOfWeek="Mo" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="usuario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${les.ejc.Endereco.list()}" optionKey="id" value="${usuarioInstance?.endereco?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone1"><g:message code="usuario.telefone1.label" default="Telefone1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone1', 'errors')}">
                                    <g:textField name="telefone1" maxlength="13" value="${usuarioInstance?.telefone1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone2"><g:message code="usuario.telefone2.label" default="Telefone2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone2', 'errors')}">
                                    <g:textField name="telefone2" maxlength="13" value="${usuarioInstance?.telefone2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone3"><g:message code="usuario.telefone3.label" default="Telefone3" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone3', 'errors')}">
                                    <g:textField name="telefone3" maxlength="13" value="${usuarioInstance?.telefone3}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="usuario.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr>
							
							<tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email2"><g:message code="usuario.email2.label" default="Email(Marido/Mulher)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email2', 'errors')}">
                                    <g:textField name="email2" value="${usuarioInstance?.email2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="foto"><g:message code="usuario.foto.label" default="Foto" /></label>
                                </td>
								
								<td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'foto', 'errors')}">
                                    <input type="file" id="foto" name="foto" />
                                </td>
                            </tr>
							
							<tr class="prop">
								<td valign="top" class="name">
									<g:if test="${usuarioInstance.foto}">
										<img src="
											<g:createLink action='renderFoto' id='${usuarioInstance.id}' />
										"/>
									</g:if>
								</td>
							</tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ficha"><g:message code="usuario.ficha.label" default="Ficha" /></label>
                                </td>
								
								<td valign="top" class="value">
									<g:if test="${usuarioInstance.ficha}">
										<g:link controller='pdf' action='renderPDF' id='${usuarioInstance.id}'> download </g:link>
									</g:if>
								</td>
                            </tr>
							
							<tr class="prop">
								<td valign="top" class="name">
                                    <input type="file" id="ficha" name="ficha" />
                                </td>
							</tr>
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paroquia"><g:message code="usuario.paroquia.label" default="Paroquia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'paroquia', 'errors')}">
                                    <g:textField name="paroquia" value="${usuarioInstance?.paroquia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="equipesTrabalhadas"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'equipesTrabalhadas', 'errors')}">
                                    <g:textField name="equipesTrabalhadas" value="${usuarioInstance?.equipesTrabalhadas}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="observacoes"><g:message code="usuario.observacoes.label" default="Observacoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'observacoes', 'errors')}">
                                    <g:textField name="observacoes" value="${usuarioInstance?.observacoes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="j5Atual"><g:message code="usuario.j5Atual.label" default="J5 Atual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'j5Atual', 'errors')}">
                                    <g:checkBox name="j5Atual" value="${usuarioInstance?.j5Atual}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="atas"><g:message code="usuario.atas.label" default="Atas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'atas', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="usuario.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${les.ejc.Usuario$Status?.values()}" keys="${les.ejc.Usuario$Status?.values()*.name()}" value="${usuarioInstance?.status?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipo"><g:message code="usuario.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'tipo', 'errors')}">
                                    <g:select name="tipo" from="${les.ejc.Usuario$Tipo?.values()}" keys="${les.ejc.Usuario$Tipo?.values()*.name()}" value="${usuarioInstance?.tipo?.name()}"  />
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
