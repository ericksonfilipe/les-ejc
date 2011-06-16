

<%@ page import="les.ejc.Enquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enquete.label', default: 'Enquete')}" />
        <title>Votar</title>
    </head>
    <body>
        <div id="pageBody">
            <h1>Votar em enquete: ${enqueteInstance?.titulo}</h1>
            <g:hasErrors bean="${enqueteInstance}">
            <div class="errors">
                <g:renderErrors bean="${enqueteInstance}" as="list" />
            </div>
            </g:hasErrors>
                <div class="dialog">
					<g:each in="${enqueteInstance?.opcoes?}" var="c">
						<g:if test="${c.enquete.fechada}">
							<li>${c} - Votos: ${c.votos}</li>
						</g:if>
						<g:if test="${!c.enquete.fechada}">
							<li><g:link controller="opcaoEnquete" action="votar" id="${c.id}">${c}</g:link> - Votos: ${c.votos}</li>
						</g:if>
					</g:each>
                </div>
        </div>
    </body>
</html>
