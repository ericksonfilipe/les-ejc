<%@ page import="ejc.Usuario" %>
<%@ page import="ejc.Usuario.Tipo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		
		<g:javascript library="prototype" />
		<g:javascript>
			function escondeTudo() {
				if ('${usuarioInstance.tipo}' != '${Tipo.Casal}' || document.getElementById('tipo-usuario').value != '${Tipo.Casal}') {
					document.getElementById('coisa').hide();
					
					document.getElementById('coisa1').hide();
					
					document.getElementById('coisa2').hide();
					
				}
			}
			
			Event.observe(window, 'load', escondeTudo, false);
			
			function plecas() {
				if (document.getElementById('tipo-usuario').value == 'Casal') {
					document.getElementById('coisa').show();
					document.getElementById('coisa1').show();
					document.getElementById('coisa2').show();
				} else {
					document.getElementById('nomeCompleto2').value = "";
					document.getElementById('dataDeNascimento2_day').value = "selected";
					document.getElementById('dataDeNascimento2_month').value = "selected";
					document.getElementById('dataDeNascimento2_year').value = "selected";
					document.getElementById('email2').value = "";
					escondeTudo();
				}
			
			//window.onload = escondeTudo();
			}
		</g:javascript>
    </head>
    <body onload="escondeTudo()">
        <div id="pageBody">
            <h2>Editar Usuário</h2>
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
							
							<g:if test="${session?.user?.j5Atual}">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="usuario.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'tipo', 'errors')}">
                                    <g:select id="tipo-usuario" name="tipo" from="${ejc.Usuario$Tipo?.values()}" keys="${ejc.Usuario$Tipo?.values()*.name()}" value="${usuarioInstance?.tipo?.name()}" onChange="plecas()" />
                                </td>
                            </tr>
							</g:if>							
						
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeCompleto"><g:message code="usuario.nomeCompleto.label" default="Nome Completo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nomeCompleto', 'errors')}">
                                    <g:textField name="nomeCompleto" maxlength="100" value="${usuarioInstance?.nomeCompleto}" />
                                </td>
                            </tr>
							
							
							<tr id="coisa" class="prop">
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
                                    <label for="dataDeNascimento"><g:message code="usuario.dataDeNascimento.label" default="Data de Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataDeNascimento', 'errors')}">
                                    <g:datePicker name="dataDeNascimento" precision="day" value="${usuarioInstance?.dataDeNascimento}" default="none" noSelection="['': '']" />
									
                                </td>
                            </tr>
							
							<tr id="coisa1" class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDeNascimento2"><g:message code="usuario.dataDeNascimento2.label" default="Data de Nascimento (Marido/Mulher)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataDeNascimento2', 'errors')}">
                                    <g:datePicker name="dataDeNascimento2" precision="day" value="${usuarioInstance?.dataDeNascimento2}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="rua"><g:message code="usuario.rua.label" default="Rua/Avenida" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'rua', 'errors')}">
                                    <g:textField name="rua" maxlength="100" value="${usuarioInstance?.rua}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="usuario.numero.label" default="Número" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: usuarioInstance, field: 'numero')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="complemento"><g:message code="usuario.complemento.label" default="Complemento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'complemento', 'errors')}">
                                    <g:textField name="complemento" value="${usuarioInstance?.complemento}" />
                                </td>
                            </tr>							
							
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bairro"><g:message code="usuario.bairro.label" default="Bairro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'bairro', 'errors')}">
                                    <g:textField name="bairro" maxlength="100" value="${usuarioInstance?.bairro}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cidade"><g:message code="usuario.cidade.label" default="Cidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'cidade', 'errors')}">
                                    <g:textField name="cidade" maxlength="100" value="${usuarioInstance?.cidade}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="usuario.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${usuarioInstance.constraints.estado.inList}" value="${usuarioInstance?.estado}" valueMessagePrefix="usuario.estado" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone1"><g:message code="usuario.telefone1.label" default="Telefones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone1', 'errors')}">
                                    <g:textField name="telefone1" maxlength="13" value="${usuarioInstance?.telefone1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name"></td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone2', 'errors')}">
                                    <g:textField name="telefone2" maxlength="13" value="${usuarioInstance?.telefone2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name"></td>
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
							
							
							<tr id="coisa2" class="prop">
                                <td valign="top" class="name">
                                    <label for="email2"><g:message code="usuario.email2.label" default="Email (Marido/Mulher)" /></label>
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
									<g:else>
										[Ficha de Inscrição ainda não cadastrada]
									</g:else>
									<br/>
									<g:if test="${session?.user?.j5Atual}">
										<input type="file" id="ficha" name="ficha" />
									</g:if>	
								</td>
							</tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="paroquia"><g:message code="usuario.paroquia.label" default="Paróquia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'paroquia', 'errors')}">
                                    <g:textField name="paroquia" value="${usuarioInstance?.paroquia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="equipesTrabalhadas"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas em São Cristóvão" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'equipesTrabalhadas', 'errors')}">
                                  [Informação preenchida pelo sistema; visualizada em Perfil]
                                </td>
                            </tr>						
						
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="equipesTrabalhadas"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas em Outras Paróquias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'equipesTrabalhadas', 'errors')}">
                                    Informe a Equipe e a Paróquia (também informe caso tenha coordenado)<br />
									<g:textArea name="equipesTrabalhadas" value="${usuarioInstance?.equipesTrabalhadas}" />
									<br/>[ex.: Lanchinho (3º EJC Catedral) - coordenador]
                                </td>
                            </tr>

							<g:if test="${session?.user?.j5Atual}">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="j5Atual"><g:message code="usuario.j5Atual.label" default="É membro atual do J5?" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'j5Atual', 'errors')}">
                                    <g:checkBox name="j5Atual" value="${usuarioInstance?.j5Atual}" /> (marque caso positivo)
                                </td>
                            </tr>
							</g:if>
							
							
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="foiJ5"><g:message code="usuario.foiJ5.label" default="Foi membro do J5?" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'foiJ5', 'errors')}">
                                    <g:checkBox name="foiJ5" value="${usuarioInstance?.foiJ5}" /> (marque caso positivo)
                                </td>
                            </tr>
							
							<g:if test="${usuarioInstance?.foiJ5 || usuarioInstance?.j5Atual}">
							<tr class="prop">
								<td valign="top" class="name">
									<label for="funcoes"><g:message code="usuario.funcoes.label" default="Funções assumidas como J5" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'funcoes', 'errors')}">
									<ul>
										<g:each in="${usuarioInstance?.funcoes?}" var="c">
											<li><g:link controller="funcaoJCinco" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
										</g:each>
									</ul>
									<g:if test="${session.user?.j5Atual || (usuarioInstance?.foiJ5 && (usuarioInstance?.id == session.user?.id))}">
									<g:link controller="funcaoJCinco" action="create" params="['usuario.id': usuarioInstance?.id]">${"Adicionar Função J5"}</g:link>
									</g:if>										
								</td>
							</tr>
							</g:if>							
							
							<g:if test="${session?.user?.j5Atual}">
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="usuario.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${ejc.Usuario$Status?.values()}" keys="${ejc.Usuario$Status?.values()*.name()}" value="${usuarioInstance?.status?.name()}"  />
                                </td>
                            </tr>
							
							<tr class="prop">
									<td valign="top" class="name">
									  <label for="observacoes"><g:message code="usuario.observacoes.label" default="Observações" /></label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'observacoes', 'errors')}">
										<g:textArea name="observacoes" value="${usuarioInstance?.observacoes}" />
									</td>
							</tr>
							</g:if>	
						
							
                       
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <g:if test="${session?.user?.j5Atual}">
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</g:if>
                </div>
            </g:form>
        </div>
    </body>
</html>