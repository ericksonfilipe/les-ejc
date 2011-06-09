
<%@ page import="les.ejc.Evento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
		<resource:accordion skin="default" />
		<resource:calendarMonthView />
		<resource:tabView skin="default" />
        <g:set var="entityName" value="${message(code: 'evento.label', default: 'Evento')}" />
        <title>Eventos</title>
    </head>
    <body>
        <div id="pageBody">
            <h2>Eventos</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
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
        </div>
    </body>
</html>
