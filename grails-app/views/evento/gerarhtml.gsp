<%@ page import="ejc.Evento" %>
<html>
	<head>
		<link rel="stylesheet" href="${resource(dir:'css',file:'imprimir.css')}" />
		<title>Impressão de Eventos</title>
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
			
			<h1>Eventos</h1>
			<br /><br />
			
			<g:each in="${eventoInstanceList}" status="i" var="eventoInstance">
				<h3>${eventoInstance.nome}</h3>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${eventoInstance.descricao}
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:formatDate format="dd/MM/yyyy" date="${eventoInstance?.data}" />, ${eventoInstance.local}
				<br /><br />
			</g:each>
		</div>
	</body>
</html>
