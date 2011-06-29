

<%@ page import="ejc.Ata" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ata.label', default: 'Ata')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<resource:dateChooser />
		<resource:richTextEditor />

    </head>
    <body>
        <div id="pageBody">
            <h2>Adicionar Ata</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ataInstance}">
            <div class="errors">
                <g:renderErrors bean="${ataInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data"><g:message code="ata.data.label" default="Data" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'data', 'errors')}">
                                    <richui:dateChooser name="data" format="dd.MM.yyyy" value="${new Date()}" locale="en" firstDayOfWeek="SU" />
                                </td>
                            </tr>
						
							<tr class="prop">
                                <td valign="top" class="name">
									<label for="pessoasPresentes"><g:message code="ata.pessoasPresentes.label" default="Pessoas Presentes" /></label>
								</td>
							    <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'pessoasPresentes', 'errors')}">
									<g:select name="pessoasPresentes" from="${ejc.Usuario.list()}" value="ataInstance.pessoasPresentes.id" optionKey="id" multiple="yes" />
								</td>
							</tr>
							
							<tr class="prop">
                                <td valign="top" class="name">
									<label for="pessoasAusentes"><g:message code="ata.pessoasAusentes.label" default="Pessoas Ausentes" /></label>
								</td>
							    <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'pessoasAusentes', 'errors')}">
									<g:select name="pessoasAusentes" from="${ejc.Usuario.list()}" value="ataInstance.pessoasAusentes.id" optionKey="id" multiple="yes" />
								</td>
							</tr>
							
							<tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pauta"><g:message code="ata.pauta.label" default="Pauta" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ataInstance, field: 'pauta', 'errors')}">
                                   <richui:richTextEditor name="pauta" value="${ataInstance?.pauta}" width="525" />
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
