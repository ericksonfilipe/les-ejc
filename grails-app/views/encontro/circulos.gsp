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
			<h1>Círculos do Encontro ${encontroInstance.tema}</h1>
			<h2>Data: <g:formatDate date=${encontroInstance?.data} format="dd/MM/yyyy" /></h2>
			<h2>Dirigente Espiritual: ${encontroInstance.dirigenteEspiritual.nomeCompleto}</h2>
			<h2>Local: ${encontroInstance.local}</h3>
			<br><br>
			<g:each in="${encontroInstance.circulos}" status="i" var="circuloInstance">
				<h2>${circuloInstance.nomeCirculo}</h2>
				<li>Cor: ${circuloInstance.cor}</li>
				<li>Jovem Coordenador: ${circuloInstance.jovemCoordenador.nomeCompleto} </li>
				<li>Casal Apoio: ${circuloInstance.casalApoio.nomeCompleto}</li>
				<li>Participantes: ${circuloInstance.toStringEncontreiros()}</li>
				<br>
			</g:each>
		</div>
	</body>
</html>
