<%@ page import="les.ejc.Reflexao" %>
<%@ page import="les.ejc.Noticia" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html"; charset=UTF-8" />
        <meta name="layout" content="main" />
		<resource:carousel />
		<resource:map key="ABCDE" />
		
		<title>EJC - Paróquia São Cristóvão</title>
    </head>
    <body>
		<div id="carrossel">
			<richui:carousel direction="vertical" itemsStyle="height: 450px;">
				<richui:carouselItem> <g:link controller="app" action="sobrenos.gsp"><img src="${resource(dir:'images',file:'quemsomos.png')}" /></g:link> </richui:carouselItem>
					
					<g:if test="${session.user}">
						<richui:carouselItem> <g:link controller="encontro" action="list"><img src="${resource(dir:'images',file:'encontros.png')}" /></g:link> <br/></richui:carouselItem>
						<richui:carouselItem> <g:link controller="usuario" action="list"><img src="${resource(dir:'images',file:'usuarios.png')}" /></g:link> </richui:carouselItem>
					</g:if>
					
						<richui:carouselItem> <g:link controller="evento" action="list"><img src="${resource(dir:'images',file:'eventos.png')}" /></g:link> </richui:carouselItem>
					
					<g:if test="${session.user?.j5Atual}">
						<richui:carouselItem> <g:link controller="ata" action="list"><img src="${resource(dir:'images',file:'atas.png')}" /></g:link> </richui:carouselItem>
						<richui:carouselItem> <g:link controller="oficio" action="list"><img src="${resource(dir:'images',file:'oficios.png')}" /></g:link> </richui:carouselItem>
					</g:if>
					
						<richui:carouselItem> <g:link controller="noticia" action="list"><img src="${resource(dir:'images',file:'noticias.png')}" /></g:link> </richui:carouselItem>
					
					<g:if test="${session.user?.j5Atual}">
						<richui:carouselItem> <g:link controller="reflexao" action="list"><img src="${resource(dir:'images',file:'reflexoes.png')}" /></g:link> </richui:carouselItem>
					</g:if>
					
			</richui:carousel>
			<div id="mapa">
				
				<div id="frase">
					<g:if test="${Reflexao.list()}">
						<hr size="2" color="#0079B2">
						<center><big><i>
							${Reflexao.list()[new Random().nextInt(Reflexao.list().size())]}
						</i></big></center>
						<hr size="2" color="#0079B2">
					</g:if>	
				</div>


				
				<center><h3>Localização da Paróquia e das Comunidades</h3></center><br>		
				<richui:map lat="-7.22702" lng="-35.89919" zoomLevel="15"
					markers="${[[latitude: -7.22702, longitude: -35.89919, draggable: false, description: '<b>Paróquia São Cristovão</b>
					<br>Rua Delmiro Gouveia - São José<br>Campina Grande - PB, 58107-735<br>(0xx)83 3341-5584'],
					[latitude: -7.22925, longitude: -35.90451, draggable: false, 
					description: '<b>Comunidade Nossa Senhora Aparecida</b>']]}"
				/>
				<br/><br/>

				<div id="frase">
					<hr size="2" color="#0079B2">
					<br/>
					<g:each in="${Noticia.list()}" status="i" var="noticiaInstance">
						<g:if test="${noticiaInstance.noticiaPrincipal}">
							<p align="justify"><i>${fieldValue(bean: noticiaInstance, field: "descricao")}</i></p>
						</g:if>	
					</g:each>
					<br/>
					<p align="right"><g:link controller="noticia" action="list">Clique aqui</g:link> para ver todas as notícias cadastradas</p>
				</div>				
				
			</div>
		</div>
		<div id="resto">
			<g:if test="${session?.user == null}">
				<g:link controller="app" action="login"><img src="${resource(dir:'images',file:'acessorestrito.png')}" /></g:link>
			</g:if>
		</div>		
    </body>
</html>