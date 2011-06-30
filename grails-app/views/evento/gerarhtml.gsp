<%@ page import="ejc.Evento" %>
<html>
  <head>
	  <title>Impressão de Eventos</title>
  </head>

  <body>
    <h1><p align="center">Eventos</p></h1>
    <g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
        <li>${"Nome: " + eventoInstance.nome + " Data: "}
		<g:formatDate format="dd/MM/yyyy" date="${eventoInstance?.data}" />
		</li>
    </g:each>
      
  </body>
</html>
