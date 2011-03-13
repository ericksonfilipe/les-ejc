

<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post"  enctype="multipart/form-data">
                <g:hiddenField name="id" value="${usuarioInstance?.id}" />
                <g:hiddenField name="version" value="${usuarioInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeCompleto"><g:message code="usuario.nomeCompleto.label" default="Nome Completo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nomeCompleto', 'errors')}">
                                    <g:textField name="nomeCompleto" maxlength="100" value="${usuarioInstance?.nomeCompleto}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nomeUsual"><g:message code="usuario.nomeUsual.label" default="Nome Usual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nomeUsual', 'errors')}">
                                    <g:textField name="nomeUsual" maxlength="40" value="${usuarioInstance?.nomeUsual}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataDeNascimento"><g:message code="usuario.dataDeNascimento.label" default="Data De Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataDeNascimento', 'errors')}">
                                    <g:datePicker name="dataDeNascimento" precision="day" value="${usuarioInstance?.dataDeNascimento}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="endereco"><g:message code="usuario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'endereco', 'errors')}">
                                    <g:select name="endereco.id" from="${les.ejc.Endereco.list()}" optionKey="id" value="${usuarioInstance?.endereco?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telefone"><g:message code="usuario.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" maxlength="10" value="${usuarioInstance?.telefone}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="usuario.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${usuarioInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="foto"><g:message code="usuario.foto.label" default="Foto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'foto', 'errors')}">
                                    <input type="file" id="foto" name="foto" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="paroquia"><g:message code="usuario.paroquia.label" default="Paroquia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'paroquia', 'errors')}">
                                    <g:textField name="paroquia" value="${usuarioInstance?.paroquia}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="equipesTrabalhadas"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'equipesTrabalhadas', 'errors')}">
                                    <g:textField name="equipesTrabalhadas" value="${usuarioInstance?.equipesTrabalhadas}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="observacoes"><g:message code="usuario.observacoes.label" default="Observacoes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'observacoes', 'errors')}">
                                    <g:textField name="observacoes" value="${usuarioInstance?.observacoes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="j5Atual"><g:message code="usuario.j5Atual.label" default="J5 Atual" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'j5Atual', 'errors')}">
                                    <g:checkBox name="j5Atual" value="${usuarioInstance?.j5Atual}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="usuario.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${les.ejc.Usuario$Status?.values()}" keys="${les.ejc.Usuario$Status?.values()*.name()}" value="${usuarioInstance?.status?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipo"><g:message code="usuario.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'tipo', 'errors')}">
                                    <g:select name="tipo" from="${les.ejc.Usuario$Tipo?.values()}" keys="${les.ejc.Usuario$Tipo?.values()*.name()}" value="${usuarioInstance?.tipo?.name()}"  />
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
