
<%@ page import="les.ejc.Circulo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'circulo.label', default: 'Circulo')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                            <td valign="top" class="name"><g:message code="circulo.cor.label" default="Cor" /></td>
                            
                            <td valign="top" class="value">${circuloInstance?.cor?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="circulo.nomeCirculo.label" default="Nome Circulo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: circuloInstance, field: "nomeCirculo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="circulo.jovemCoordenador.label" default="Jovem Coordenador" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${circuloInstance?.jovemCoordenador?.id}">${circuloInstance?.jovemCoordenador?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="circulo.casalApoio.label" default="Casal Apoio" /></td>
                            
                            <td valign="top" class="value"><g:link controller="usuario" action="show" id="${circuloInstance?.casalApoio?.id}">${circuloInstance?.casalApoio?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                                      
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="circulo.participantes.label" default="Participantes" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${circuloInstance.participantes}" var="p">
                                    <li><g:link controller="usuario" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${circuloInstance?.id}" />
                    <g:if test="${session?.user?.j5Atual}">
						<span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</g:if>
				</g:form>
            </div>
			<div class="buttons">
				<table><td>
				<span class="button"><g:link controller="encontro" action="show" id="${circuloInstance?.encontro?.id}">Voltar para o Encontro: ${circuloInstance?.encontro?.encodeAsHTML()}</g:link></span>
				</td></table>
			</div>
        </div>
    </body>
</html>
