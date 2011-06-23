

<%@ page import="les.ejc.FuncaoJCinco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Editar Função J5</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${funcaoJCincoInstance}">
            <div class="errors">
                <g:renderErrors bean="${funcaoJCincoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${funcaoJCincoInstance?.id}" />
                <g:hiddenField name="version" value="${funcaoJCincoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataInicio"><g:message code="funcaoJCinco.dataInicio.label" default="Data de Início" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'dataInicio', 'errors')}">
                                    <g:datePicker name="dataInicio" precision="month" value="${funcaoJCincoInstance?.dataInicio}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="funcao"><g:message code="funcaoJCinco.funcao.label" default="Função" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'funcao', 'errors')}">
                                    <g:select name="funcao" from="${les.ejc.FuncaoJCinco$EnumFuncao?.values()}" keys="${les.ejc.FuncaoJCinco$EnumFuncao?.values()*.name()}" value="${funcaoJCincoInstance?.funcao?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataFim"><g:message code="funcaoJCinco.dataFim.label" default="Data de Término" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'dataFim', 'errors')}">
                                    <g:datePicker name="dataFim" precision="month" value="${funcaoJCincoInstance?.dataFim}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
				<div class="buttons">
					<table><td>
						<span class="button"><g:link controller="usuario" action="show" id="${funcaoJCincoInstance?.usuario?.id}">Voltar para o Usuario: ${funcaoJCincoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					</td></table>
				</div>
            </g:form>
        </div>
    </body>
</html>
