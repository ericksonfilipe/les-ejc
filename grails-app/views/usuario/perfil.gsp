
<%@ page import="les.ejc.Usuario" %>
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
				
				[ajeitar] Encontro: //que encontro fez!
				<br><br>		
				[ajeitar] Círculo de Origem: //que circulo foi!
				<br><br>	
				[ajeitar] Coordenador de Círculo: //q circulo coordenou? de que encontro!
				<br><br>	
				[ajeitar] Equipes Trabalhadas: ${fieldValue(bean: usuarioInstance, field: "equipesTrabalhadas")}  //mostrar nenhuma se for null (mostrar com respectivo encontro ao lado; ou "Outra paroquia")
				<br><br>	
				[ajeitar] Integrante do J5: //... se True, mostrar o tempo e a funcao
				<br><br>	

            </div>
        </div>
    </body>
</html>
