

<%@ page import="les.ejc.Ata" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ata.label', default: 'Ata')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
		<resource:dateChooser />
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
            <g:hasErrors bean="${ataInstance}">
            <div class="errors">
                <g:renderErrors bean="${ataInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ataInstance?.id}" />
                <g:hiddenField name="version" value="${ataInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data"><g:message code="ata.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'data', 'errors')}">
                                    <richui:dateChooser name="data" format="dd.MM.yyyy" value="${new Date()}" locale="en" firstDayOfWeek="SU" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pessoasPresentes"><g:message code="ata.pessoasPresentes.label" default="Pessoas Presentes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'pessoasPresentes', 'errors')}">
                                    <g:select name="pessoasPresentes" from="${les.ejc.Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${ataInstance?.pessoasPresentes*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pessoasAusentes"><g:message code="ata.pessoasAusentes.label" default="Pessoas Ausentes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'pessoasAusentes', 'errors')}">
                                    <g:select name="pessoasAusentes" from="${les.ejc.Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${ataInstance?.pessoasAusentes*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pauta"><g:message code="ata.pauta.label" default="Pauta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'pauta', 'errors')}">
                                    <g:textArea name="pauta" cols="40" rows="5" value="${ataInstance?.pauta}" />
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
