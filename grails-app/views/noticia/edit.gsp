

<%@ page import="ejc.Noticia" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'noticia.label', default: 'Noticia')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>

        <div class="body">
            <h2>Editar Notícia</h2>
			<span class="menuButton"><g:link class="list" action="list"><g:message code="Ver as notícias cadastradas" args="[entityName]" /></g:link></span>
			<span class="menuButton"><g:link class="create" action="create"><g:message code="Inserir Notícia" args="[entityName]" /></g:link></span>
			<br/><br/>
			
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${noticiaInstance}">
            <div class="errors">
                <g:renderErrors bean="${noticiaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${noticiaInstance?.id}" />
                <g:hiddenField name="version" value="${noticiaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="noticia.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: noticiaInstance, field: 'descricao', 'errors')}">
                                    <g:textArea name="descricao" cols="40" rows="5" value="${noticiaInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="noticiaPrincipal"><g:message code="noticia.noticiaPrincipal.label" default="Noticia Principal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: noticiaInstance, field: 'noticiaPrincipal', 'errors')}">
                                    <g:checkBox name="noticiaPrincipal" value="${noticiaInstance?.noticiaPrincipal}" />
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
