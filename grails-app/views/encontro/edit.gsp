

<%@ page import="les.ejc.Encontro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'encontro.label', default: 'Encontro')}" />
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
            <g:hasErrors bean="${encontroInstance}">
            <div class="errors">
                <g:renderErrors bean="${encontroInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${encontroInstance?.id}" />
                <g:hiddenField name="version" value="${encontroInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dirigenteEspiritual"><g:message code="encontro.dirigenteEspiritual.label" default="Dirigente Espiritual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'dirigenteEspiritual', 'errors')}">
                                    <g:select name="dirigenteEspiritual.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${encontroInstance?.dirigenteEspiritual?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="encontro.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'data', 'errors')}">
                                    <g:datePicker name="data" precision="day" value="${encontroInstance?.data}"  />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="circulos"><g:message code="encontro.circulos.label" default="Circulos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'circulos', 'errors')}">
                                    
<ul>
<g:each in="${encontroInstance?.circulos?}" var="c">
    <li><g:link controller="circulo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="circulo" action="create" params="['encontro.id': encontroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'circulo.label', default: 'Circulo')])}</g:link>

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