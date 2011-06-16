<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html" />
        <meta name="layout" content="main" />
		<resource:carousel />
		<resource:map key="ABCDE" />
		<title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
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
				<center><h3>Frase do dia</h3></center><br>
				<div id="frase">
					Esta eh a frase dod ia, sei la pq nem sei o que deve estar aqui, mas jah podeeeee ahhhhhhh, temos q terminar esse troco. Que monte de coisa aleatoria, aleatoriamente serah.
				</div>
				<center><h3>Localizacao da Paroquia e das Comunidades</h3></center><br>		
				<richui:map lat="-7.22702" lng="-35.89919" zoomLevel="15"
					markers="${[[latitude: -7.22702, longitude: -35.89919, draggable: false, description: '<b>Paróquia São Cristovão</b>
					<br>Rua Delmiro Gouveia - São José<br>Campina Grande - PB, 58107-735<br>(0xx)83 3341-5584'],
					[latitude: -7.22925, longitude: -35.90451, draggable: false, 
					description: '<b>Comunidade Nossa Senhora Aparecida</b>']]}"
				/>
				<br>
				<div id="frase">
					<h3>Noticias</h3>
					<br>
					Uma noticia do noticiario que estah noticiando oh, mamigoooo, pense num negoco. Olhai =D vamos lah.
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