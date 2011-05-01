
<%@ page import="les.ejc.Encontro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'encontro.label', default: 'Encontro')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="encontro.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "id")}</td>
                            
                        </tr>
						
						<tr class="prop">
                            <td valign="top" class="name"><g:message code="encontro.codigo.label" default="Código" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "codigo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="encontro.dirigenteEspiritual.label" default="Dirigente Espiritual" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${encontroInstance?.dirigenteEspiritual?.id}">${encontroInstance?.dirigenteEspiritual?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="encontro.data.label" default="Data" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${encontroInstance?.data}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="encontro.tema.label" default="Tema" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "tema")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="encontro.local.label" default="Local" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "local")}</td>
                            
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="equipesDeTrabalho"><g:message code="encontro.equipesDeTrabalho.label" default="Equipes De Trabalho" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'equipesDeTrabalho', 'errors')}">
                                    
								<ul>
								
								<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.j5?.id}">${encontroInstance?.j5?.encodeAsHTML()}</g:link></li>
								
								</ul>
								
								<g:link controller="equipeDeTrabalho" action="create" params="['encontro.id': encontroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho')])}</g:link>

                                </td>
                            </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${encontroInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
