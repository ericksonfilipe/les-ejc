
<%@ page import="les.ejc.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
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
                            <td valign="top" class="name"><g:message code="evento.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eventoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="evento.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${eventoInstance?.data}" /></td>
                            
                        </tr>
						
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="evento.nome.label" default="Nome" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eventoInstance, field: "nome")}</td>
                            
                        </tr>						
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="evento.descricao.label" default="Descricao" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eventoInstance, field: "descricao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="evento.horario.label" default="Horario" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eventoInstance, field: "horario")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="evento.local.label" default="Local" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: eventoInstance, field: "local")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${eventoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
