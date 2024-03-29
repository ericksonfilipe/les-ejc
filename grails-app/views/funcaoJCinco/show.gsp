
<%@ page import="ejc.FuncaoJCinco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Mostrar Função J5</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcaoJCinco.dataInicio.label" default="Data de Início" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MMMM 'de' yyyy" date="${funcaoJCincoInstance?.dataInicio}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcaoJCinco.funcao.label" default="Função" /></td>
                            
                            <td valign="top" class="value">${funcaoJCincoInstance?.funcao?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="funcaoJCinco.dataFim.label" default="Data de Término" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MMMM 'de' yyyy" date="${funcaoJCincoInstance?.dataFim}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

			<g:if test="${session.user?.j5Atual || (session.user?.foiJ5 && (funcaoJCincoInstance?.usuario?.id == session.user?.id))}">
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${funcaoJCincoInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
			</g:if>
			
			<div class="buttons">
					<table><td>
					<span class="button"><g:link controller="usuario" action="show" id="${funcaoJCincoInstance?.usuario?.id}">Voltar para o Usuario: ${funcaoJCincoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					</td></table>
			</div>
        </div>
    </body>
</html>
