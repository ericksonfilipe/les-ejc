

<%@ page import="les.ejc.EquipeDeTrabalho" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipeDeTrabalho.label', default: 'Equipe de Trabalho')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipeDeTrabalhoInstance}">
            <div class="errors">
                <g:renderErrors bean="${equipeDeTrabalhoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${equipeDeTrabalhoInstance?.id}" />
                <g:hiddenField name="version" value="${equipeDeTrabalhoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeEquipe"><g:message code="equipeDeTrabalho.nomeEquipe.label" default="Equipe: ${equipeDeTrabalhoInstance?.nomeEquipe?.name()}" /></label>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jovemCoordenador1"><g:message code="equipeDeTrabalho.jovemCoordenador1.label" default="Jovem Coordenador1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'jovemCoordenador1', 'errors')}">
                                    <g:select name="jovemCoordenador1.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.jovemCoordenador1?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jovemCoordenador2"><g:message code="equipeDeTrabalho.jovemCoordenador2.label" default="Jovem Coordenador2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'jovemCoordenador2', 'errors')}">
                                    <g:select name="jovemCoordenador2.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.jovemCoordenador2?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="casalCoordenador"><g:message code="equipeDeTrabalho.casalCoordenador.label" default="Casal Coordenador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'casalCoordenador', 'errors')}">
                                    <g:select name="casalCoordenador.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.casalCoordenador?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="encontreiros"><g:message code="equipeDeTrabalho.encontreiros.label" default="Encontreiros" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'encontreiros', 'errors')}">
                                    <g:select name="encontreiros" from="${les.ejc.Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${equipeDeTrabalhoInstance?.encontreiros*.id}" />
                                </td>
                            </tr>
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                </div>
				<div class="buttons">
					<table><td>
					<span class="button"><g:link controller="encontro" action="show" id="${equipeDeTrabalhoInstance?.encontro?.id}">Voltar para o Encontro: ${equipeDeTrabalhoInstance?.encontro?.encodeAsHTML()}</g:link></span>
					</td></table>
				</div>				
            </g:form>
        </div>
    </body>
</html>
