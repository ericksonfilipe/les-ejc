

<%@ page import="ejc.Reflexao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'reflexao.label', default: 'Reflexao')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>

        <div class="body">
            <h2>Editar Reflex&atilde;o</h2>
			<span class="menuButton"><g:link class="list" action="list"><g:message code="Ver as reflex&otilde;es cadastradas" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Inserir Reflex&atilde;o" args="[entityName]" /></g:link></span>
			<br/><br/>
			
			<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reflexaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${reflexaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${reflexaoInstance?.id}" />
                <g:hiddenField name="version" value="${reflexaoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="texto"><g:message code="reflexao.texto.label" default="Texto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reflexaoInstance, field: 'texto', 'errors')}">
                                    <g:textArea name="texto" cols="40" rows="5" value="${reflexaoInstance?.texto}" />
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
		<br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/>
    </body>
</html>
