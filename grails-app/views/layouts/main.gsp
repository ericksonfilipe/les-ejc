<html>
    <head>
        <title><g:layoutTitle default="Esta pagina deveria estar com um titulo diferente!" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <!--<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" /> -->
        <g:layoutHead />
        <g:javascript library="application" />
		<!-- Nao faco a minima ideia da utilidade de um <div> dentro de um <head> =S,
			 maaaaas como tah funfando entao deixa assim. -->
		<div id="header">
		  <div id="loginHeader">
			<g:loginControl />
		  </div>
		</div>
    </head>
    <body>
		<div id="corpo">
			<div id="spinner" class="spinner" style="display:none;">
				<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
			</div>
			<div id="topo">
				<div id="imagem">
					<img src="${resource(dir:'images',file:'logo.png')}" />
				</div>
				<div id="logo">
					<h1>Encontro de Jovens com Cristo - EJC</h1><h2>Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</h2>Campina Grande - PB
				</div>
			</div>
			<div class="nav">
				<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
				<span class="menuButton"><g:link class="menu" action="sobrenos.gsp"><g:message code="Sobre N&oacute;s" args="[entityName]" /></g:link></span>
				<span class="menuButton"><g:link controller='usuario'>Usu&aacute;rios</g:link></span>
				<span class="menuButton"><g:link controller='encontro'>Encontros</g:link></span>
				<span class="menuButton"><g:link controller='ata'>Atas</g:link></span>
				<span class="menuButton"><g:link controller='oficio'>Of&iacute;cios</g:link></span>
				<span class="menuButton"><g:link action="trocarsenha">Mudar Senha</g:link></span>
			</div>
			<!--<div id="logo">Sistema de Gerenciamento do EJC da Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</div>-->
			<div id="main">
				<g:layoutBody />
			</div>
			
			<div id="rodape">
				<hr />
				Site desenvolvido por n&oacute;s mesmos
			</div>
		</div>
    </body>
</html>