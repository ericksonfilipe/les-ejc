
<%@ page import="les.ejc.Ata" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ata.label', default: 'Ata')}" />
        <title>Dados da Ata</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Dados da Ata</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
            <g:form target="_blank">
                <g:hiddenField name="id" value="${ataInstance?.id}" />
                <span><g:actionSubmit class="print" action="gerarhtml" value="Imprimir"/></span>
            </g:form>							
            </div>
            <br>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ata.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ataInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ata.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ataInstance?.data}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ata.pessoasPresentes.label" default="Pessoas Presentes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${ataInstance.pessoasPresentes}" var="p">
                                    <li><g:link controller="usuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ata.pessoasAusentes.label" default="Pessoas Ausentes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${ataInstance.pessoasAusentes}" var="p">
                                    <li><g:link controller="usuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ata.pauta.label" default="Pauta" /></td>
                            <td>
						</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ataInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>

            </div>
        </div>
    </body>
</html>
