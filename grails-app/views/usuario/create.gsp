

<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
            <g:hasErrors bean="${usuarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${usuarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="usuario.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="40" value="${usuarioInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sobrenome"><g:message code="usuario.sobrenome.label" default="Sobrenome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'sobrenome', 'errors')}">
                                    <g:textField name="sobrenome" value="${usuarioInstance?.sobrenome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDeNascimento"><g:message code="usuario.dataDeNascimento.label" default="Data De Nascimento" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'dataDeNascimento', 'errors')}">
                                    <g:datePicker name="dataDeNascimento" precision="day" value="${usuarioInstance?.dataDeNascimento}"  />
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
                                    <label for="apelido"><g:message code="usuario.apelido.label" default="Apelido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'apelido', 'errors')}">
                                    <g:textField name="apelido" value="${usuarioInstance?.apelido}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endereco"><g:message code="usuario.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'endereco', 'errors')}">
                                    <g:textField name="endereco" value="${usuarioInstance?.endereco}" />
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
                                    <label for="foto"><g:message code="usuario.foto.label" default="Foto" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'foto', 'errors')}">
                                    <input type="file" id="foto" name="foto" />
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
                                    <label for="paroquia"><g:message code="usuario.paroquia.label" default="Paroquia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'paroquia', 'errors')}">
                                    <g:textField name="paroquia" value="${usuarioInstance?.paroquia}" />
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
                                    <label for="telefone"><g:message code="usuario.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: usuarioInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" value="${usuarioInstance?.telefone}" />
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
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
