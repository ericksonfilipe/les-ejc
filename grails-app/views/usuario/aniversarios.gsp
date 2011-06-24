<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<resource:calendarMonthView />
		<resource:tabView skin="default" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Aniversariantes</h2>
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<g:each in="${['janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro']}" status="m" var="mes">
						<richui:tabLabel title="${mes}" />
					</g:each>
				</richui:tabLabels>
				<richui:tabContents>
					<g:each in="${['janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro']}" status="m" var="mes">
						<richui:tabContent>
							<richui:calendarMonthView items="${usuarioInstanceList}" createLink="true" 
							constraintDateFields="['dataDeNascimento', 'dataDeNascimento']" displayField="subject"
							 teaser="true" teaserLength="10" weekOfYear="false" month="${new Date(month:m);}" action="show" />
						</richui:tabContent>
					</g:each>
				</richui:tabContents>
			</richui:tabView>
        </div>
    </body>
</html>
