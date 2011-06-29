

<%@ page import="ejc.EquipeDeTrabalho" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'equipeDeTrabalho.label', default: 'EquipeDeTrabalho')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Criar Equipe De Trabalho</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${equipeDeTrabalhoInstance}">
            <div class="errors">
                <g:renderErrors bean="${equipeDeTrabalhoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nomeEquipe"><g:message code="equipeDeTrabalho.nomeEquipe.label" default="Nome Equipe" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'nomeEquipe', 'errors')}">
                                    <g:select name="nomeEquipe" from="${ejc.EquipeDeTrabalho$NomeEquipe?.values()}" keys="${ejc.EquipeDeTrabalho$NomeEquipe?.values()*.name()}" value="${equipeDeTrabalhoInstance?.nomeEquipe?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jovemCoordenador1"><g:message code="equipeDeTrabalho.jovemCoordenador1.label" default="Jovem Coordenador1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'jovemCoordenador1', 'errors')}">
                                    <g:select name="jovemCoordenador1.id" from="${ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.jovemCoordenador1?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="jovemCoordenador2"><g:message code="equipeDeTrabalho.jovemCoordenador2.label" default="Jovem Coordenador2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'jovemCoordenador2', 'errors')}">
                                    <g:select name="jovemCoordenador2.id" from="${ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.jovemCoordenador2?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="casalCoordenador"><g:message code="equipeDeTrabalho.casalCoordenador.label" default="Casal Coordenador" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: equipeDeTrabalhoInstance, field: 'casalCoordenador', 'errors')}">
                                    <g:select name="casalCoordenador.id" from="${ejc.Usuario.list()}" optionKey="id" value="${equipeDeTrabalhoInstance?.casalCoordenador?.id}" noSelection="['null': '']" />
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
