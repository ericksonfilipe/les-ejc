

<%@ page import="les.ejc.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
		<resource:dateChooser />
    </head>
    <body>
        <div id="pageBody">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${eventoInstance}">
            <div class="errors">
                <g:renderErrors bean="${eventoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${eventoInstance?.id}" />
                <g:hiddenField name="version" value="${eventoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="evento.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'data', 'errors')}">
                                    <richui:dateChooser name="data" format="dd.MM.yyyy" value="${new Date()}" locale="en" firstDayOfWeek="SU" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="evento.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'descricao', 'errors')}">
                                    <g:textArea name="descricao" cols="40" rows="5" value="${eventoInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="horario"><g:message code="evento.horario.label" default="Horario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'horario', 'errors')}">
                                    <g:textField name="horario" value="${eventoInstance?.horario}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="local"><g:message code="evento.local.label" default="Local" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: eventoInstance, field: 'local', 'errors')}">
                                    <g:textField name="local" value="${eventoInstance?.local}" />
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
