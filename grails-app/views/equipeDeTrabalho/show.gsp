
<%@ page import="les.ejc.EquipeDeTrabalho" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipeDeTrabalho.label', default: 'Equipe de Trabalho')}" />
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
                            <td valign="top" class="name"><g:message code="equipeDeTrabalho.nomeEquipe.label" default="Nome Equipe" /></td>
                            
                            <td valign="top" class="value">${equipeDeTrabalhoInstance?.nomeEquipe?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipeDeTrabalho.jovemCoordenador1.label" default="Jovem Coordenador1" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${equipeDeTrabalhoInstance?.jovemCoordenador1?.id}">${equipeDeTrabalhoInstance?.jovemCoordenador1?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipeDeTrabalho.jovemCoordenador2.label" default="Jovem Coordenador2" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${equipeDeTrabalhoInstance?.jovemCoordenador2?.id}">${equipeDeTrabalhoInstance?.jovemCoordenador2?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipeDeTrabalho.casalCoordenador.label" default="Casal Coordenador" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${equipeDeTrabalhoInstance?.casalCoordenador?.id}">${equipeDeTrabalhoInstance?.casalCoordenador?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="equipeDeTrabalho.encontreiros.label" default="Encontreiros" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${equipeDeTrabalhoInstance.encontreiros}" var="e">
                                    <li><g:link controller="usuario" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${equipeDeTrabalhoInstance?.id}" />
                    <g:if test="${session?.user?.j5Atual}">
						<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
					</g:if>
				</g:form>
            </div>
			<div class="buttons">
				<table><td>
				<span class="button"><g:link controller="encontro" action="show" id="${equipeDeTrabalhoInstance?.encontro?.id}">Voltar para o Encontro: ${equipeDeTrabalhoInstance?.encontro?.encodeAsHTML()}</g:link></span>
				</td></table>
			</div>
        </div>
    </body>
</html>
