

<%@ page import="les.ejc.FuncaoJCinco" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcaoJCinco.label', default: 'FuncaoJCinco')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${funcaoJCincoInstance}">
            <div class="errors">
                <g:renderErrors bean="${funcaoJCincoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataInicio"><g:message code="funcaoJCinco.dataInicio.label" default="Data Inicio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'dataInicio', 'errors')}">
                                    <g:datePicker name="dataInicio" precision="day" value="${funcaoJCincoInstance?.dataInicio}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="funcao"><g:message code="funcaoJCinco.funcao.label" default="Funcao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'funcao', 'errors')}">
                                    <g:select name="funcao" from="${les.ejc.FuncaoJCinco$EnumFuncao?.values()}" keys="${les.ejc.FuncaoJCinco$EnumFuncao?.values()*.name()}" value="${funcaoJCincoInstance?.funcao?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataFim"><g:message code="funcaoJCinco.dataFim.label" default="Data Fim" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'dataFim', 'errors')}">
                                    <g:datePicker name="dataFim" precision="day" value="${funcaoJCincoInstance?.dataFim}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="usuario"><g:message code="funcaoJCinco.usuario.label" default="Usuario" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcaoJCincoInstance, field: 'usuario', 'errors')}">
                                    <g:select name="usuario.id" from="${les.ejc.Usuario.findById(funcaoJCincoInstance?.usuario.id)}" optionKey="id" value="${funcaoJCincoInstance?.usuario?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
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