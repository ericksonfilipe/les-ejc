

<%@ page import="les.ejc.OpcaoEnquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${opcaoEnqueteInstance}">
            <div class="errors">
                <g:renderErrors bean="${opcaoEnqueteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="opcao"><g:message code="opcaoEnquete.opcao.label" default="Opcao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opcaoEnqueteInstance, field: 'opcao', 'errors')}">
                                    <g:textField name="opcao" value="${opcaoEnqueteInstance?.opcao}" />
                                </td>
                            </tr>
							
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enquete"><g:message code="opcaoEnquete.enquete.label" default="Enquete" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: opcaoEnqueteInstance, field: 'enquete', 'errors')}">
                                    <g:select name="enquete.id" from="${les.ejc.Enquete.findById(opcaoEnqueteInstance?.enquete?.id)}" optionKey="id" value="${opcaoEnqueteInstance?.enquete?.id}"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
				<div class="buttons">
					<table><td>
					<span class="button"><g:link controller="enquete" action="show" id="${opcaoEnqueteInstance?.enquete?.id}">Voltar para a Enquete: ${opcaoEnqueteInstance?.enquete?.encodeAsHTML()}</g:link></span>
					</td></table>
				</div>
            </g:form>
        </div>
    </body>
</html>
