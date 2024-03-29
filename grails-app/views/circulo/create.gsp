<%@ page import="ejc.Circulo" %>
<%@ page import="ejc.Usuario.Tipo" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'circulo.label', default: 'Circulo')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Criar Círculo</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${circuloInstance}">
            <div class="errors">
                <g:renderErrors bean="${circuloInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cor"><g:message code="circulo.cor.label" default="Cor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'cor', 'errors')}">
                                    <g:select name="cor" from="${ejc.Circulo$Cor?.values()}" keys="${ejc.Circulo$Cor?.values()*.name()}" value="${circuloInstance?.cor?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeCirculo"><g:message code="circulo.nomeCirculo.label" default="Nome Circulo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'nomeCirculo', 'errors')}">
                                    <g:textField name="nomeCirculo" value="${circuloInstance?.nomeCirculo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jovemCoordenador"><g:message code="circulo.jovemCoordenador.label" default="Jovem Coordenador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'jovemCoordenador', 'errors')}">
                                    <g:select name="jovemCoordenador.id" from="${ejc.Usuario.findAllWhere(tipo:Tipo.Jovem)}" optionKey="id" value="${circuloInstance?.jovemCoordenador?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="casalApoio"><g:message code="circulo.casalApoio.label" default="Casal Apoio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'casalApoio', 'errors')}">
                                    <g:select name="casalApoio.id" from="${ejc.Usuario.findAllWhere(tipo:Tipo.Casal)}" optionKey="id" value="${circuloInstance?.casalApoio?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="encontro"><g:message code="circulo.encontro.label" default="Encontro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'encontro', 'errors')}">
                                    <g:select name="encontro.id" from="${ejc.Encontro.findById(circuloInstance?.encontro?.id)}" optionKey="id" value="${circuloInstance?.encontro?.id}"  />
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
					<span class="button"><g:link controller="encontro" action="show" id="${circuloInstance?.encontro?.id}">Voltar para o Encontro: ${circuloInstance?.encontro?.encodeAsHTML()}</g:link></span>
					</td></table>
				</div>
            </g:form>
        </div>
    </body>
</html>
