<%@ page import="les.ejc.Encontro" %>
<html>
  <head>
	  <title>Impressão de Círculos</title>
  </head>
  <body>
    <h1><p align="center">Círculos do Encontro ${encontroInstance.tema}</p></h1>
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
  </body>
</html>
