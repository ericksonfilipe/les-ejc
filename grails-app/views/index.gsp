<html>
    <head>
        
		<meta http-equiv="Content-Type" content="text/html" />
        <meta name="layout" content="main" />
		<resource:carousel />
		<title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		
        <style type="text/css" media="screen">
			.links {
				text-align: center;
			}
			
			.imagem {
				padding: 50px;
			}
        </style>
    </head>
    <body>
		<g:if test="${!session.user}">
        <div id="pageBody">
			<div class="links">
				<span class="imagem">
					<g:link controller="app" action="sobrenos.gsp"><img src="${resource(dir:'images',file:'quemsomos.png')}" /></g:link>
				</span>
				<span class="imagem">
					<g:link controller='evento' action='list'><img src="${resource(dir:'images',file:'eventos.png')}" /></g:link>
				</span>
			</div>
			<div><br /><br /></div>
			<div class="links">
				<span class="imagem">
					<g:link controller="app" action="login"><img src="${resource(dir:'images',file:'login.jpg')}" /></g:link>
				</span>
			</div>
			<center><br />Site da Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o: <a href="http://www.paroquiadesaocristovaocg.com" target="_blank">www.paroquiadesaocristovaocg.com</a><br /><br /></center>
       </div>
	   </g:if >
	   <g:else>
			<div id="pageBody">

				<richui:carousel direction="horizontal" >
				<richui:carouselItem> <g:link controller="app" action="sobrenos.gsp"><img src="${resource(dir:'images',file:'quemsomos.png')}" /></g:link> </richui:carouselItem>
				<richui:carouselItem> <g:link controller="encontro" action="list"><img src="${resource(dir:'images',file:'encontros.png')}" /></g:link> <br/></richui:carouselItem>
				<richui:carouselItem> <g:link controller="usuario" action="list"><img src="${resource(dir:'images',file:'usuarios.png')}" /></g:link> </richui:carouselItem>
				<richui:carouselItem> <g:link controller="evento" action="list"><img src="${resource(dir:'images',file:'eventos.png')}" /></g:link> </richui:carouselItem>
				<richui:carouselItem> <g:link controller="ata" action="list"><img src="${resource(dir:'images',file:'atas.png')}" /></g:link> </richui:carouselItem>
				<richui:carouselItem> <g:link controller="oficio" action="list"><img src="${resource(dir:'images',file:'oficios.png')}" /></g:link> </richui:carouselItem>
				</richui:carousel>

			</div>
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	   </g:else>
    </body>
</html>