

<%@ page import="les.ejc.Circulo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'circulo.label', default: 'Circulo')}" />
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
                                    <g:select name="cor" from="${les.ejc.Circulo$Cor?.values()}" keys="${les.ejc.Circulo$Cor?.values()*.name()}" value="${circuloInstance?.cor?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="circulo.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${circuloInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jovemCoordenador"><g:message code="circulo.jovemCoordenador.label" default="Jovem Coordenador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'jovemCoordenador', 'errors')}">
                                    <g:select name="jovemCoordenador.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${circuloInstance?.jovemCoordenador?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="casalApoio"><g:message code="circulo.casalApoio.label" default="Casal Apoio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'casalApoio', 'errors')}">
                                    <g:select name="casalApoio.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${circuloInstance?.casalApoio?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="participantes"><g:message code="circulo.participantes.label" default="Participantes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: circuloInstance, field: 'participantes', 'errors')}">
                                    
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
