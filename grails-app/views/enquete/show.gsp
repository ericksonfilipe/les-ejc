
<%@ page import="les.ejc.Enquete" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'enquete.label', default: 'Enquete')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Dados da Enquete</h2>
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
			<div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${enqueteInstance?.id}" />	
					<td text-align="right">
					<span class="button"><g:actionSubmit class="print" action="votar" value="Votar"/></span>
					</td>
			</g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="enquete.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enqueteInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="enquete.titulo.label" default="Titulo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: enqueteInstance, field: "titulo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="enquete.fechada.label" default="Fechada" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${enqueteInstance?.fechada}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="enquete.opcoes.label" default="Opcoes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${enqueteInstance.opcoes}" var="o">
                                    <li><g:link controller="opcaoEnquete" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${enqueteInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
