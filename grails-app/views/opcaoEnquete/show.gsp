
<%@ page import="les.ejc.OpcaoEnquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opcaoEnquete.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opcaoEnqueteInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opcaoEnquete.opcao.label" default="Opcao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opcaoEnqueteInstance, field: "opcao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="opcaoEnquete.votos.label" default="Votos" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: opcaoEnqueteInstance, field: "votos")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${opcaoEnqueteInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
			<div class="buttons">
					<table><td>
					<span class="button"><g:link controller="enquete" action="show" id="${opcaoEnqueteInstance?.enquete?.id}">Voltar para a Enquete: ${opcaoEnqueteInstance?.enquete?.encodeAsHTML()}</g:link></span>
					</td></table>
			</div>
        </div>
    </body>
</html>
