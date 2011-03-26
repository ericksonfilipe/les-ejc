

<%@ page import="les.ejc.EquipeDeTrabalho" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipeDeTrabalhoInstance}">
            <div class="errors">
                <g:renderErrors bean="${equipeDeTrabalhoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${equipeDeTrabalhoInstance?.id}" />
                <g:hiddenField name="version" value="${equipeDeTrabalhoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeEquipe"><g:message code="equipeDeTrabalho.nomeEquipe.label" default="Nome Equipe" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'nomeEquipe', 'errors')}">
                                    <g:select name="nomeEquipe" from="${les.ejc.EquipeDeTrabalho$NomeEquipe?.values()}" keys="${les.ejc.EquipeDeTrabalho$NomeEquipe?.values()*.name()}" value="${equipeDeTrabalhoInstance?.nomeEquipe?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jovemCoordenador1"><g:message code="equipeDeTrabalho.jovemCoordenador1.label" default="Jovem Coordenador1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'jovemCoordenador1', 'errors')}">
                                    <g:select name="jovemCoordenador1.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.jovemCoordenador1?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="jovemCoordenador2"><g:message code="equipeDeTrabalho.jovemCoordenador2.label" default="Jovem Coordenador2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'jovemCoordenador2', 'errors')}">
                                    <g:select name="jovemCoordenador2.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.jovemCoordenador2?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="casalCoordenador"><g:message code="equipeDeTrabalho.casalCoordenador.label" default="Casal Coordenador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'casalCoordenador', 'errors')}">
                                    <g:select name="casalCoordenador.id" from="${les.ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.casalCoordenador?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="encontreiros"><g:message code="equipeDeTrabalho.encontreiros.label" default="Encontreiros" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'encontreiros', 'errors')}">
                                    <g:select name="encontreiros" from="${les.ejc.Usuario.list()}" multiple="yes" optionKey="id" size="5" value="${equipeDeTrabalhoInstance?.encontreiros*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="encontro"><g:message code="equipeDeTrabalho.encontro.label" default="Encontro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'encontro', 'errors')}">
                                    <g:select name="encontro.id" from="${les.ejc.Encontro.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.encontro?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
