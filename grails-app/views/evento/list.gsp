
<%@ page import="ejc.Evento" %>
<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<resource:autoComplete skin="default" />
		<resource:accordion skin="default" />
		<resource:calendarMonthView />
		<resource:tabView />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Eventos</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			
			<h3>Procurar Evento</h3>
			<richui:autoComplete name="pegarEvento" action="${createLinkTo('dir': 'evento/pegarEventos')}" onItemSelect="document.location.href = \'${createLinkTo(dir: 'evento/show')}/\' + id;" />
			<br />
			
			<g:form target="_blank">
                <span><g:actionSubmit class="print" action="gerarhtml" value="Imprimir"/></span>
            </g:form>
			<richui:accordion style="width:100%">
				<g:each in="${(Set)eventoInstanceList.collect{it.data.getYear()} }" status="i" var="data">
					<richui:accordionItem id="${i}" caption="${data + 1900}">
						<richui:tabView id="tabView">
							<richui:tabLabels>
								<g:each in="${['janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro']}" status="m" var="mes">
									<richui:tabLabel title="${mes}" />
								</g:each>
							</richui:tabLabels>
							<richui:tabContents>
								<g:each in="${['janeiro', 'fevereiro', 'marco', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro']}" status="m" var="mes">
									<richui:tabContent>
										<richui:calendarMonthView items="${(List)eventoInstanceList}" createLink="true" 
										constraintDateFields="['data', 'data']" displayField="subject"
										teaser="true" teaserLength="10" weekOfYear="false" month="${new Date(month:m);}" action="show" />
									</richui:tabContent>
								</g:each>
							</richui:tabContents>
						</richui:tabView>
					</richui:accordionItem>
				</g:each>
			</richui:accordion>
        </div>
    </body>
</html>
