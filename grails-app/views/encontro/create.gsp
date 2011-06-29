

<%@ page import="ejc.Encontro" %>
<html>
    <head>
		<resource:autoComplete skin="default" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'encontro.label', default: 'Encontro')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<resource:dateChooser />
    </head>
    <body>
		<div id="pageBody">
            <h2>Criar Encontro</h2>
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${encontroInstance}">
            <div class="errors">
                <g:renderErrors bean="${encontroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="encontro.numero.label" default="Número" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${encontroInstance?.numero}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dirigenteEspiritual"><g:message code="encontro.dirigenteEspiritual.label" default="Dirigente Espiritual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'dirigenteEspiritual', 'errors')}">
									<g:select name="dirigenteEspiritual.id" from="${ejc.Usuario.findByTipo(ejc.Usuario.Tipo.Padre)}" optionKey="id" value="${encontroInstance?.dirigenteEspiritual?.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data"><g:message code="encontro.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'data', 'errors')}">
									<richui:dateChooser name="data" format="dd.MM.yyyy" value="${new Date()}" locale="en" firstDayOfWeek="Mo" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tema"><g:message code="encontro.tema.label" default="Tema" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'tema', 'errors')}">
                                    <g:textField name="tema" value="${encontroInstance?.tema}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="local"><g:message code="encontro.local.label" default="Local" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'local', 'errors')}">
                                    <g:textField name="local" value="${encontroInstance?.local}" />
                                </td>
                            </tr>
							
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
