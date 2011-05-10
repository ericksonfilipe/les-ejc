
<%@ page import="les.ejc.Usuario" %>
<%@ page import="les.ejc.Circulo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="Perfil de Usuario" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="show" action="show" id="${usuarioInstance?.id}"><g:message code="Voltar para Dados Gerais do Usuário" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
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
				[ajeitar] Aniversário: ${usuarioInstance?.dataDeNascimento}
				</g:if>
				
				<g:else>
				Nome Completo: ${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}
				<br><br>
				[ajeitar] Aniversário: ${usuarioInstance?.dataDeNascimento}
				<br><br>
				Nome Completo: ${fieldValue(bean: usuarioInstance, field: "nomeCompleto2")}
				<br><br>
				[ajeitar] Aniversário: ${usuarioInstance?.dataDeNascimento2}
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
				
				Equipes Trabalhadas:
				<g:if test="${usuarioInstance.idCirculoQueCoordenou}">
				${fieldValue(bean: usuarioInstance, field: "equipesTrabalhadas")}
				</g:if>
				<g:else>
				Nenhuma.
				</g:else>
				<br><br>
				
				[ajeitar] Integrante do J5: //... se True, mostrar o tempo e a funcao
				<br><br>	

            </div>
        </div>
    </body>
</html>
