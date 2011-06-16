
<%@ page import="les.ejc.FuncaoJCinco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco')}" />
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
                            <td valign="top" class="name"><g:message code="funcaoJCinco.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: funcaoJCincoInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcaoJCinco.dataInicio.label" default="Data Inicio" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${funcaoJCincoInstance?.dataInicio}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcaoJCinco.funcao.label" default="Funcao" /></td>
                            
                            <td valign="top" class="value">${funcaoJCincoInstance?.funcao?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcaoJCinco.dataFim.label" default="Data Fim" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${funcaoJCincoInstance?.dataFim}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${funcaoJCincoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
			<div class="buttons">
					<table><td>
					<span class="button"><g:link controller="usuario" action="show" id="${funcaoJCincoInstance?.usuario?.id}">Voltar para o Usuario: ${funcaoJCincoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					</td></table>
			</div>
        </div>
    </body>
</html>
