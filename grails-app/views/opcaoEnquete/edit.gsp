

<%@ page import="les.ejc.OpcaoEnquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${opcaoEnqueteInstance}">
            <div class="errors">
                <g:renderErrors bean="${opcaoEnqueteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${opcaoEnqueteInstance?.id}" />
                <g:hiddenField name="version" value="${opcaoEnqueteInstance?.version}" />
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
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
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
