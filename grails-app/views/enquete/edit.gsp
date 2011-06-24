

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
            <h2>Editar Enquete</h2>
			
			<span class="menuButton"><g:link class="list" action="list"><g:message code="Ver as enquetes cadastradas" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Criar Enquete" args="[entityName]" /></g:link></span>
			<br/><br/>
			
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enqueteInstance}">
            <div class="errors">
                <g:renderErrors bean="${enqueteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${enqueteInstance?.id}" />
                <g:hiddenField name="version" value="${enqueteInstance?.version}" />
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
                                  <label for="fechada"><g:message code="enquete.fechada.label" default="Fechada" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enqueteInstance, field: 'fechada', 'errors')}">
                                    <g:checkBox name="fechada" value="${enqueteInstance?.fechada}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="opcoes"><g:message code="enquete.opcoes.label" default="Opcoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enqueteInstance, field: 'opcoes', 'errors')}">
                                    
<ul>
<g:each in="${enqueteInstance?.opcoes?}" var="o">
    <li><g:link controller="opcaoEnquete" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="opcaoEnquete" action="create" params="['enquete.id': enqueteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'opcaoEnquete.label', default: 'OpcaoEnquete')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
