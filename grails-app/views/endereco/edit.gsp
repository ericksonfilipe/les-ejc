

<%@ page import="les.ejc.Endereco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${enderecoInstance}">
            <div class="errors">
                <g:renderErrors bean="${enderecoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${enderecoInstance?.id}" />
                <g:hiddenField name="version" value="${enderecoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="estado"><g:message code="endereco.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'estado', 'errors')}">
                                    <g:select name="estado" from="${enderecoInstance.constraints.estado.inList}" value="${enderecoInstance?.estado}" valueMessagePrefix="endereco.estado"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="bairro"><g:message code="endereco.bairro.label" default="Bairro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'bairro', 'errors')}">
                                    <g:textField name="bairro" value="${enderecoInstance?.bairro}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cidade"><g:message code="endereco.cidade.label" default="Cidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'cidade', 'errors')}">
                                    <g:textField name="cidade" value="${enderecoInstance?.cidade}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="complemento"><g:message code="endereco.complemento.label" default="Complemento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'complemento', 'errors')}">
                                    <g:textField name="complemento" value="${enderecoInstance?.complemento}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="numero"><g:message code="endereco.numero.label" default="Numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: enderecoInstance, field: 'numero')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="rua"><g:message code="endereco.rua.label" default="Rua" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: enderecoInstance, field: 'rua', 'errors')}">
                                    <g:textField name="rua" value="${enderecoInstance?.rua}" />
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
