<%@ page import="les.ejc.Encontro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'encontro.label', default: 'Encontro')}" />
        <title>Dados do Encontro</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Dados do Encontro</h2>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
            <g:form target="_blank">
                <g:hiddenField name="id" value="${encontroInstance?.id}" />					
		<g:if test="${session?.user?.j5Atual}">
                    <td text-align="right">
                    <span class="button"><g:actionSubmit class="print" action="gerarhtml" value="Imprimir"/></span>
                    <span class="button"><g:actionSubmit class="print" action="circulos" value="Detalhes Círculos" /></span>
                    <span class="button"><g:actionSubmit class="print" action="equipes" value="Detalhes Equipes" /></span>
                    </td>
		</g:if>
	    </g:form>
            </div>
            <br>
            <div class="dialog">
            <table>
                <tbody>			
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="encontro.numero.label" default="Número" /></td>
                        <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "numero")}</td>
                    </tr>                    
                        <tr class="prop">
                        <td valign="top" class="name"><g:message code="encontro.dirigenteEspiritual.label" default="Dirigente Espiritual" /></td>
                        <td valign="top" class="value"><g:link controller="usuario" action="show" id="${encontroInstance?.dirigenteEspiritual?.id}">${encontroInstance?.dirigenteEspiritual?.encodeAsHTML()}</g:link></td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="encontro.data.label" default="Data" /></td>
                        <td valign="top" class="value"><g:formatDate date="${encontroInstance?.data}" /></td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="encontro.tema.label" default="Tema" /></td>
                        <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "tema")}</td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="encontro.local.label" default="Local" /></td>
                        <td valign="top" class="value">${fieldValue(bean: encontroInstance, field: "local")}</td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="circulos"><g:message code="encontro.circulos.label" default="Circulos" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'circulos', 'errors')}">
                            <ul>
			        <g:each in="${encontroInstance?.circulos?}" var="c">
			            <li><g:link controller="circulo" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
			        </g:each>
			    </ul>
		        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="equipesDeTrabalho"><g:message code="encontro.equipesDeTrabalho.label" default="Equipes De Trabalho" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: encontroInstance, field: 'equipesDeTrabalho', 'errors')}">
                            <ul>
			        <li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.coordenacao_geral?.id}">${encontroInstance?.coordenacao_geral?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" name="J5" action="show" id="${encontroInstance?.j5?.id}">${encontroInstance?.j5?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.coordenacao_de_circulos?.id}">${encontroInstance?.coordenacao_de_circulos?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.apresentadores?.id}">${encontroInstance?.apresentadores?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.bandinha?.id}">${encontroInstance?.bandinha?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.boa_vontade?.id}">${encontroInstance?.boa_vontade?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.cozinha?.id}">${encontroInstance?.cozinha?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.liturgia_e_vigilia?.id}">${encontroInstance?.liturgia_e_vigilia?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.correio_interno?.id}">${encontroInstance?.correio_interno?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.recepcao_aos_palestrantes?.id}">${encontroInstance?.recepcao_aos_palestrantes?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.som_e_iluminacao?.id}">${encontroInstance?.som_e_iluminacao?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.compras?.id}">${encontroInstance?.compras?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.secretaria?.id}">${encontroInstance?.secretaria?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.transito_e_sociodrama?.id}">${encontroInstance?.transito_e_sociodrama?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.ordem_e_limpeza?.id}">${encontroInstance?.ordem_e_limpeza?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.mini_box?.id}">${encontroInstance?.mini_box?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.lanchinho?.id}">${encontroInstance?.lanchinho?.encodeAsHTML()}</g:link></li>
				<li><g:link controller="equipeDeTrabalho" action="show" id="${encontroInstance?.visitacao_e_externa?.id}">${encontroInstance?.visitacao_e_externa?.encodeAsHTML()}</g:link></li>
			    </ul>
			</td>
                    </tr>                    
                </tbody>
            </table>
        </div>
        <div class="buttons">
             <g:form>
                <g:hiddenField name="id" value="${encontroInstance?.id}" />					
		<g:if test="${session?.user?.j5Atual}">
                    <td text-align="left">
		    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
		    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </td>
		</g:if>
	    </g:form>
        </div>
    </div>
    </body>
</html>
