
<%@ page import="les.ejc.Usuario" %>
<%@ page import="les.ejc.Circulo" %>
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
            <h1><g:message code="Perfil de ${usuarioInstance?.encodeAsHTML()}" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">

				<g:if test="${usuarioInstance.foto}">
					<img src="
					<g:createLink action='renderFoto' id='${usuarioInstance.id}' />
					" width="120" height="120" border="2" align="right">
				</g:if>
				<g:else>
					<img src="${resource(dir:'images/usuario',file:'imagem_padrao.png')}" width="120" height="120" border="2" align="right">
				</g:else>

				<br><br>

				<g:if test="${usuarioInstance?.tipo != Usuario.Tipo.Casal}">
				Nome Completo: ${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}
				<br><br>
				Aniversário:
					<g:if test="${usuarioInstance?.dataDeNascimento}">
					<g:formatDate format="dd/MM" date="${usuarioInstance?.dataDeNascimento}" />
					</g:if>
					<g:else>
					Não informado
					</g:else>
				</g:if>
				
				<g:else>
				Nome Completo: ${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}
				<br><br>
				Aniversário:
					<g:if test="${usuarioInstance?.dataDeNascimento}">
					<g:formatDate format="dd/MM" date="${usuarioInstance?.dataDeNascimento}" />
					</g:if>
					<g:else>
					Não informado
					</g:else>
				<br><br>
				Nome Completo: ${fieldValue(bean: usuarioInstance, field: "nomeCompleto2")}
				<br><br>
				Aniversário:
					<g:if test="${usuarioInstance?.dataDeNascimento}">
					<g:formatDate format="dd/MM" date="${usuarioInstance?.dataDeNascimento}" />
					</g:if>
					<g:else>
					Não informado
					</g:else>				
				</g:else>
				
				<br><br><br>
				
				<g:if test="${usuarioInstance.paroquia}">
				Paróquia: ${fieldValue(bean: usuarioInstance, field: "paroquia")}
				<br><br>
				</g:if>
				
				Encontro:
				<g:if test="${usuarioInstance.idCirculoQueParticipou}">
				<g:link controller="encontro" action="show" id="${Circulo.findById(usuarioInstance?.idCirculoQueParticipou)?.encontro?.id}">${Circulo.findById(usuarioInstance?.idCirculoQueParticipou)?.encontro?.encodeAsHTML()}</g:link>
				</g:if>
				<g:else>
				Usuário não cadastrado como encontrista em nenhum encontro.
				</g:else>
				<br><br>
				
				Círculo de Origem:
				<g:if test="${usuarioInstance.idCirculoQueParticipou}">
				<g:link controller="circulo" action="show" id="${usuarioInstance?.idCirculoQueParticipou}">${Circulo.findById(usuarioInstance?.idCirculoQueParticipou).encodeAsHTML()}</g:link>
				</g:if>
				<g:else>
				Usuário não cadastrado como encontrista em nenhum círculo.
				</g:else>
				<br><br>
				
				<g:if test="${usuarioInstance.idCirculoQueCoordenou}">
				Coordenador de Círculo: <g:link controller="circulo" action="show" id="${usuarioInstance?.idCirculoQueCoordenou}">${Circulo.findById(usuarioInstance?.idCirculoQueCoordenou).encodeAsHTML()}</g:link>
				<br><br>
				</g:if>
				
				Equipes Trabalhadas em São Cristóvão:
				<g:if test="${usuarioInstance.idsEquipesQueCoordenouEmSaoCristovao || usuarioInstance.idsEquipesQueParticipouEmSaoCristovao}">
					<g:each in="${usuarioInstance.idsEquipesQueCoordenouEmSaoCristovao}" var="e">
						<li><g:link controller="equipeDeTrabalho" action="show" id="${e}">${EquipeDeTrabalho.findById(e)?.encodeAsHTML()}</g:link> (coordenação)</li> 
					</g:each>
					<g:each in="${usuarioInstance.idsEquipesQueParticipouEmSaoCristovao}" var="e">
						<li><g:link controller="equipeDeTrabalho" action="show" id="${e}">${EquipeDeTrabalho.findById(e)?.encodeAsHTML()}</g:link></li> 
					</g:each>
				</g:if>
				<g:else>
				Nenhuma
				<br>
				</g:else>
				<br>
				
				
				Equipes Trabalhadas em Outras Paróquias:
				<g:if test="${usuarioInstance.equipesTrabalhadas}">
				<ul>${fieldValue(bean: usuarioInstance, field: "equipesTrabalhadas")}</ul>
				</g:if>
				<g:else>
				Nenhuma.
				</g:else>
				<br><br>
				
				<g:if test="${usuarioInstance.j5Atual}">
				Integrante atual do J5
				</g:if>
				<br>
				<g:if test="${usuarioInstance.foiJ5 && !usuarioInstance.j5Atual}">
				Foi Integrante do J5
				</g:if>
				<g:if test="${usuarioInstance.j5Atual || usuarioInstance.foiJ5}">
				<br />
				Funções:
				<g:each in="${usuarioInstance.funcoes?}" var="c">
					<li>${c} - <g:formatDate format="MM/yyyy" date="${c.dataInicio}" /> - <g:formatDate format="MM/yyyy" date="${c.dataFim}" /></li>
				</g:each>
				</g:if>
				
				
				

            </div>
        </div>
    </body>
</html>
