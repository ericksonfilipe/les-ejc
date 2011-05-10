<%@ page import="les.ejc.Usuario" %>
<%@ page import="les.ejc.Usuario.Status" %>
<%@ page import="les.ejc.Usuario.Tipo" %>

<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
	<div class="nav">
	    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>

	    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
	    <span class="menuButton"><a class="list" href="${createLink(uri: '/usuario/listNotAtivado')}"><g:message code="Lista de Não-ativos"/></a></span>

	    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
			
	</div>
	<div class="body">
	    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
	    <g:if test="${flash.message}">
	    <div class="message">${flash.message}</div>
	    </g:if>
	    <div class="dialog">
		<table>
		    <tbody>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.nomeCompleto.label" default="Nome Completo" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</td>
			    
			</tr>
						
						<g:if test="${usuarioInstance?.tipo == Tipo.Casal}">
							<tr class="prop">
								<td valign="top" class="name"><g:message code="usuario.nomeCompleto2.label" default="Nome Completo(Marido/Mulher)" /></td>
								
								<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeCompleto2")}</td>
								
							</tr>
						</g:if>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.nomeUsual.label" default="Nome Usual" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeUsual")}</td>
			    
			</tr>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.dataDeNascimento.label" default="Data De Nascimento" /></td>
			    
			    <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataDeNascimento}" /></td>
			    
			</tr>
			
						<g:if test="${usuarioInstance?.tipo == Tipo.Casal}">
							<tr class="prop">
								<td valign="top" class="name"><g:message code="usuario.dataDeNascimento2.label" default="Data De Nascimento(Marido/Mulher)" /></td>
								
								<td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataDeNascimento2}" /></td>
								
							</tr>
						</g:if>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.telefone1.label" default="Telefone1" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone1")}</td>
			    
			</tr>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.telefone2.label" default="Telefone2" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone2")}</td>
			    
			</tr>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.telefone3.label" default="Telefone3" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "telefone3")}</td>
			    
			</tr>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.email.label" default="Email" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "email")}</td>
			    
			</tr>
						
						<g:if test="${usuarioInstance?.tipo == Tipo.Casal}">
							<tr class="prop">
								<td valign="top" class="name"><g:message code="usuario.email2.label" default="Email(Marido/Casal)" /></td>
								
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
			    <td valign="top" class="name"><g:message code="usuario.paroquia.label" default="Paroquia" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "paroquia")}</td>
			    
			</tr>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas" /></td>
			    
			    <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "equipesTrabalhadas")}</td>
			    
			</tr>
		    
						<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
							<tr class="prop">
								<td valign="top" class="name"><g:message code="usuario.observacoes.label" default="Observacoes" /></td>
								
								<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "observacoes")}</td>
								
							</tr>
						</g:if>
						
						<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
							<tr class="prop">
								<td valign="top" class="name"><g:message code="usuario.login.label" default="Login" /></td>
								
								<td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "login")}</td>
								
							</tr>
						</g:if>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.j5Atual.label" default="J5 Atual" /></td>
			    
			    <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.j5Atual}" /></td>
			    
			</tr>
		    
			  <tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.atas.label" default="Atas" /></td>
			    
			    <td valign="top" style="text-align: left;" class="value">
				<ul>
				<g:each in="${usuarioInstance.atas}" var="a">
				    <li><g:link controller="ata" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
				</g:each>
				</ul>
			    </td>
			    
			</tr>
		    
						<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
							<tr class="prop">
								<td valign="top" class="name"><g:message code="usuario.status.label" default="Status" /></td>
								
								<td valign="top" class="value">${usuarioInstance?.status?.encodeAsHTML()}</td>
			</g:if>
						
			</tr>
		    
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.tipo.label" default="Tipo" /></td>
			    
			    <td valign="top" class="value">${usuarioInstance?.tipo?.encodeAsHTML()}</td>
			    
			</tr>
						
			<tr class="prop">
			    <td valign="top" class="name"><g:message code="usuario.endereco.label" default="Endereco" /></td>

			    <td>
								<g:if test="${usuarioInstance?.endereco != null}">
									<g:link controller="endereco" action="show" id="${usuarioInstance?.endereco?.id}">${usuarioInstance?.endereco?.encodeAsHTML()}</g:link>
								</g:if>
								<g:else>
									<g:link controller="endereco" action="create" params="['usuario.id': usuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'endereco.label', default: 'Endereco')])}</g:link>
									

								</g:else>
							</td>
						</tr>						
		    
		    </tbody>
		</table>
	    </div>
			<g:if test="${usuarioInstance.id == session.user.id || session?.user?.j5Atual}">
				<div class="buttons">
					<g:form>
						<g:hiddenField name="id" value="${usuarioInstance?.id}" />
						<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
		  
		    <g:if test="${usuarioInstance?.status == Status.Ativo && usuarioInstance?.email != null}">
			<span class="button"><g:actionSubmit class="edit" action="enviarLoginESenha" value="Enviar Login e Senha por E-mail" /></span>
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
