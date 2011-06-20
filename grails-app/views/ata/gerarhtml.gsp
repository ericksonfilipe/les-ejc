<%@ page import="les.ejc.Ata" %>
<html>
  <head>
	  <title>Impressão de Atas</title>
  </head>

  <body>
    <h1><p align="center">Ata de Reunião Paróquia São Cristóvão</p></h1>
    <h2>Data: <g:formatDate date="${ataInstance?.data} format="dd/MM/yyyy" /></h2>
    <h3>Pessoas Presentes:</h3>
    <g:each in="${ataInstance.pessoasPresentes}" status="i" var="ataInstance">
        <li>${ataInstance}</li>
    </g:each>
    
    <g:if test="${ataInstance.pessoasAusentes.size() != 0}">            
    <h3>Pessoas Ausentes:</h3>
    <g:each in="${ataInstance.pessoasAusentes}" status="i" var="ataInstance">
        <li>${ataInstance}</li>
    </g:each>
</g:if>

    <h3>Pauta:</h3>

<p align="Justify">${ataInstance?.pauta}</p>
    
  
  </body>
</html>
