<%@ page import="ejc.Encontro" %>
<html>
	<head>
		<link rel="stylesheet" href="${resource(dir:'css',file:'imprimir.css')}" />
		<title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
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
			
			<h1>Oficio de Solicitacao</h1>
			<br /><br />
			
			<h3>${oficioInstance.pegaDestinatario()}</h3>
			<br /><br />
			
			<p>${oficioInstance.pegaCorpo()}</p>
			<br /><br /><br /><br />
			
			<p>"Limitado ao exposto, fique com meus votos de estima e consideracao."</p>
			<br /><br /><br /><br /><br /><br /><br /><br />
			
			<p>${oficioInstance.pegaLinha()}</p>
			<center>
				<p>${oficioInstance.local}, 
				<g:formatDate format="dd/MM/yyyy" date="${oficioInstance.data}" />
				</p>
			</center>
			<br /><br /><br /><br />
			
			<p>${oficioInstance.pegaLinha()}</p>
			<center>
				<p>${oficioInstance.nomeRemetente}</p>
			</center>
		</div>
	</body>
</html>
