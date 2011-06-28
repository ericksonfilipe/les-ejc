

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
            <h2>Criar Enquete</h2>
			
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
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="titulo"><g:message code="enquete.titulo.label" default="Titulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enqueteInstance, field: 'titulo', 'errors')}">
                                    <g:textField name="titulo" value="${enqueteInstance?.titulo}" />
                                </td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
                                    <label for="descricao"><g:message code="enquete.descricao.label" default="Descrição" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enqueteInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${enqueteInstance?.descricao}" />
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
