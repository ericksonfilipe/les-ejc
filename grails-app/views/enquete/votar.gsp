

<%@ page import="les.ejc.Enquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enquete.label', default: 'Enquete')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="body">
            <h2>Votar em enquete: ${enqueteInstance?.titulo}</h2>
			<span class="menuButton"><g:link class="list" action="list"><g:message code="Ver as enquetes cadastradas" args="[entityName]" /></g:link></span>
			<br/><br/>
			
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
			
            <g:hasErrors bean="${enqueteInstance}">
            <div class="errors">
                <g:renderErrors bean="${enqueteInstance}" as="list" />
            </div>
            </g:hasErrors>
			
				<div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="opcao" title="${message(code: 'opcaoEnquete.opcao.label', default: 'Opcao')}" />                        
                            <g:sortableColumn property="votos" title="${message(code: 'opcaoEnquete.votos.label', default: 'Votos')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${enqueteInstance?.opcoes?}" status="i" var="opcaoEnqueteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: opcaoEnqueteInstance, field: "opcao")}</td>
                            <td>${fieldValue(bean: opcaoEnqueteInstance, field: "votos")}</td>
							<g:if test="${!opcaoEnqueteInstance.enquete.fechada}">
								<g:if test="${!enqueteInstance.usuarioJaVotou(session.user.id)}">
									<td>
										<li><g:link controller="opcaoEnquete" action="votar" id="${opcaoEnqueteInstance.id}">Votar</g:link></li>
									</td>
								</g:if>
							</g:if>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
