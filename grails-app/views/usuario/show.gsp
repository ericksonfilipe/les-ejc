<%@ page import="les.ejc.Usuario" %>
<%@ page import="les.ejc.Usuario.Status" %>
<%@ page import="les.ejc.Usuario.Tipo" %>
<%@ page import="les.ejc.EquipeDeTrabalho" %>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
	
    <body>
	<div id="pageBody">
	    <h2>Dados do Usu&aacute;rio</h2>
	    <g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
	    </g:if>
	    <div class="dialog">
			<table>
				<tbody>
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.tipo.label" default="Tipo" /></td>
						<td valign="top" class="value">${usuarioInstance?.tipo?.encodeAsHTML()}</td>
					</tr>				
				
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.nomeCompleto.label" default="Nome Completo" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</td>
						
					</tr>
								
					<g:if test="${usuarioInstance?.tipo == Tipo.Casal}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.nomeCompleto2.label" default="Nome Completo (Marido/Mulher)" /></td>
							<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeCompleto2")}</td>
						</tr>
					</g:if>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.nomeUsual.label" default="Nome Usual" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeUsual")}</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.dataDeNascimento.label" default="Data de Nascimento" /></td>
						<td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${usuarioInstance?.dataDeNascimento}" /></td>
					</tr>

					<g:if test="${usuarioInstance?.tipo == Tipo.Casal}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.dataDeNascimento2.label" default="Data de Nascimento (Marido/Mulher)" /></td>
							<td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataDeNascimento2}" /></td>
						</tr>
					</g:if>
                   
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.rua.label" default="Rua" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "rua")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.bairro.label" default="Bairro" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "bairro")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.cidade.label" default="Cidade" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "cidade")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.estado.label" default="Estado" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "estado")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.complemento.label" default="Complemento" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "complemento")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.numero.label" default="Numero" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "numero")}</td>
                            
                        </tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.telefone1.label" default="Telefones" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone1")}</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.telefone2.label" default="" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone2")}</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.telefone3.label" default="" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone3")}</td>
					</tr>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.email.label" default="Email" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "email")}</td>
					</tr>
								
					<g:if test="${usuarioInstance?.tipo == Tipo.Casal}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.email2.label" default="Email (Marido/Mulher)" /></td>
							<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "email2")}</td>
						</tr>
					</g:if>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.foto.label" default="Foto" /></td>
							<td valign="top" class="value">
								<g:if test="${usuarioInstance.foto}">
									<img src="
										<g:createLink action='renderFoto' id='${usuarioInstance.id}' />
									"/>
								</g:if>
							</td>
					</tr>
					
					<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.ficha.label" default="Ficha" /></td>
							<td valign="top" class="value">
								<g:if test="${usuarioInstance.ficha}">
									<g:link controller='pdf' action='renderPDF' id='${usuarioInstance.id}'> download </g:link>
								</g:if>
							</td>
						</tr>
					</g:if>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.paroquia.label" default="Paróquia" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "paroquia")}</td>
					</tr>
								
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas em São Cristóvão" /></td>
						<td valign="top" class="value">
						<g:each in="${usuarioInstance.idsEquipesQueCoordenouEmSaoCristovao}" var="e">
							<li><g:link controller="equipeDeTrabalho" action="show" id="${e}">${EquipeDeTrabalho.findById(e)?.encodeAsHTML()}</g:link> (coordenação)</li> 
						</g:each>
						<g:each in="${usuarioInstance.idsEquipesQueParticipouEmSaoCristovao}" var="e">
							<li><g:link controller="equipeDeTrabalho" action="show" id="${e}">${EquipeDeTrabalho.findById(e)?.encodeAsHTML()}</g:link></li> 
						</g:each>
						</td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas em Outras Paróquias" /></td>
						<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "equipesTrabalhadas")}</td>
					</tr>
								
					<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.login.label" default="Login" /></td>
							<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "login")}</td>
						</tr>
					</g:if>
					
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.foiJ5.label" default="Foi membro do J5?" /></td>
						<td><g:if test="${usuarioInstance?.foiJ5}">Sim</g:if><g:else>Não</g:else></td>
					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.j5Atual.label" default="É membro atual do J5?" /></td>
						<td><g:if test="${usuarioInstance?.j5Atual}">Sim</g:if><g:else>Não</g:else></td>
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
					
					<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.status.label" default="Status" /></td>
							<td valign="top" class="value">${usuarioInstance?.status?.encodeAsHTML()}</td>
						</tr>
					</g:if>
										
					<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
						<tr class="prop">
							<td valign="top" class="name"><g:message code="usuario.observacoes.label" default="Observações" /></td>
							<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "observacoes")}</td>
						</tr>
					</g:if>
								
					<tr class="prop">
						<td valign="top" class="name"><g:message code="usuario.tipo.label" default="Email Enviado" /></td>
						<td><g:if test="${usuarioInstance?.emailEnviado}">Sim</g:if><g:else>Não</g:else></td>
					</tr>

				</tbody>
			</table>
	    </div>
		
		<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
			<div class="buttons">
				<g:form>
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
					<g:if test="${session?.user?.j5Atual}">
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
						<g:if test="${usuarioInstance?.status == Status.Ativo && usuarioInstance?.email != null}">
						<span class="button"><g:actionSubmit class="edit" action="enviarLoginESenha" value="Enviar Login/Senha por E-mail" /></span>
						</g:if>
					</g:if>
				</g:form>
			</div>

			<div class="buttons">
				<table><td>
					<span class="button"><g:link action="perfil" id="${usuarioInstance?.id}">Visualizar Perfil de ${usuarioInstance?.encodeAsHTML()}</g:link></span>
				</td></table>
			</div>
		</g:if>
	</div>
    </body>
</html>
