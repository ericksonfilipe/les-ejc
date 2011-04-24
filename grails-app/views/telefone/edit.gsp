

<%@ page import="les.ejc.Telefone" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'telefone.label', default: 'Telefone')}" />
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
            <g:hasErrors bean="${telefoneInstance}">
            <div class="errors">
                <g:renderErrors bean="${telefoneInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${telefoneInstance?.id}" />
                <g:hiddenField name="version" value="${telefoneInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ddd"><g:message code="telefone.ddd.label" default="Ddd" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: telefoneInstance, field: 'ddd', 'errors')}">
                                    <g:textField name="ddd" maxlength="2" value="${telefoneInstance?.ddd}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="prefixo"><g:message code="telefone.prefixo.label" default="Prefixo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: telefoneInstance, field: 'prefixo', 'errors')}">
                                    <g:textField name="prefixo" maxlength="4" value="${telefoneInstance?.prefixo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sufixo"><g:message code="telefone.sufixo.label" default="Sufixo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: telefoneInstance, field: 'sufixo', 'errors')}">
                                    <g:textField name="sufixo" maxlength="4" value="${telefoneInstance?.sufixo}" />
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
