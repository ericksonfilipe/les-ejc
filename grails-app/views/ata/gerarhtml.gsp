<%@ page import="ejc.Ata" %>
<html>
	<head>
		<link rel="stylesheet" href="${resource(dir:'css',file:'imprimir.css')}" />
		<title>Impressão de Atas</title>
	</head>

	<body>
		<div class="pagina">
			<div class="topo">
				<div class="esq">
					<img src="${resource(dir:'images',file:'logo.png')}" height="100%" width="100%"/>
				</div>
				<div class="dir">
				   <center>
				   <h1><big>EJC - Encontro de Jovens com Cristo</big></h1>
				   <br />
				   <h1>Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</h1>
				   <br />
				   <h3>Diocese de Campina Grande - PB</h3>
				   </center>
			   </div>
			</div>
			<br /><br /><br />
			
			<h1>Ata de Reunião Paróquia São Cristóvão</h1>
			<br />
			<h2>Data: <g:formatDate date="${ataInstance?.data} format="dd/MM/yyyy" /></h2>
			<br /><br /><br />
			<h3>Pessoas Presentes:</h3>
			<% String pessoas = ""%>
			<g:each in="${ataInstance.pessoasPresentes}" status="i" var="ataInstance">
				<% pessoas += "${ataInstance}, " %>
			</g:each>
			<% pessoas = pessoas.substring(0, pessoas.length() - 2) %>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${pessoas}</p>
			<br /><br />
			<g:if test="${ataInstance.pessoasAusentes.size() != 0}">            
				<h3>Pessoas Ausentes:</h3>
				<% pessoas = ""%>
				<g:each in="${ataInstance.pessoasAusentes}" status="i" var="ataInstance">
					<% pessoas += "${ataInstance}, " %>
				</g:each>
				<% pessoas = pessoas.substring(0, pessoas.length() - 2) %>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${pessoas}</p>
				<br /><br />
			</g:if>
			
			<h3>Pauta:</h3>
			<p align="Justify">${ataInstance?.pauta}</p>
    
		</div>
	</body>
</html>
