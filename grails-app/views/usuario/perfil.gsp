
<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title><g:message code="Perfil de Usuario" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
			<span class="menuButton"><g:link class="show" action="show" id="${usuarioInstance?.id}"><g:message code="Voltar para Dados Gerais do Usuário" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Perfil de ${usuarioInstance?.encodeAsHTML()}" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
						
						<tr class="prop">
						Manter aqui os dados:
						<br>Nome,
						<br>Apelido,
						<br>Aniversario (sem ano), Idade
						<br>Paróquia
						<br>Foto
						<br>Que Encontro fez,
						<br>De qual circulo fez parte,
						<br>Se ja coordenou circulo (qual encontro?)
						<br>Se eh/ja foi do J5 (tempo, funcao)
						<br>Equipes que trabalhou (com respectivo encontro ao lado)
						</tr>
						
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.nomeCompleto.label" default="Nome Completo" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeCompleto")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.nomeUsual.label" default="Nome Usual" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "nomeUsual")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.dataDeNascimento.label" default="Data De Nascimento" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${usuarioInstance?.dataDeNascimento}" /></td>
                            
                        </tr>
                                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.foto.label" default="Foto" /></td>
                            
							<td valign="top" class="value">
								<g:if test="${usuarioInstance.foto}">
									<img src="
										<g:createLink action='renderFoto' id='${usuarioInstance.id}' />
									"/>
								</g:if>
							</td>
                        </tr>
                    

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.paroquia.label" default="Paroquia" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "paroquia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.equipesTrabalhadas.label" default="Equipes Trabalhadas" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: usuarioInstance, field: "equipesTrabalhadas")}</td>
                            
                        </tr>
                    

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="usuario.j5Atual.label" default="J5 Atual" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${usuarioInstance?.j5Atual}" /></td>
                            
                        </tr>
                    

                    
					
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
