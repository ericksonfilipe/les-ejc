<html>
    <head>
        <title><g:layoutTitle default="Esta pagina deveria estar com um titulo diferente!" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <!--<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" /> -->
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
		<div class="pagina">
			<div class="loginHeader">
				<ul>
					<li><g:loginControl /></li>
					<g:if test="${session.user}">
						<li><g:link action="trocarsenha">Mudar Senha</g:link></li>
						<li>Ol&aacute;, ${session.user}!</li>
					</g:if>
				</ul>
			</div>
			<div class="bordaBox">
				<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
				<div class="conteudo">
					<!-- Esse spinner eu nao sei pra que serve -->
					<div id="spinner" class="spinner" style="display:none;">
						<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
					</div>
					
					<div class="topo">
						<div class="esq">
							<img src="${resource(dir:'images',file:'logo.png')}" height="100%" width="100%"/>
						</div>
						<div class="dir">
							EJC - Encontro de Jovens com Cristo<br />Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o<br />Diocese de Campina Grande - PB
						</div>
					</div>
					
					<div class="menu">
						<ul>
							<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
<!--							
					
					
					
					
					 -->
							<li><g:link class="menu" action="sobrenos.gsp"><g:message code="Sobre N&oacute;s" args="[entityName]" /></g:link></li>
							<li><g:link controller='usuario'>Usu&aacute;rios</g:link>
								<ul>
									<li><g:link controller='usuario' action='create'>Adicionar Usu&aacute;rios</g:link></li>
									<li><a href="#">Visualizar Usu&aacute;rios</a></li>
								</ul>
						  </li>
							<li><g:link controller='encontro'>Encontros</g:link></li>
							<li><g:link controller='ata'>Atas</g:link></li>
							<li><g:link controller='oficio'>Of&iacute;cios</g:link></li>
							<li></li>
						</ul>
					</div>
					
					<div class="main">
						<g:layoutBody />
					</div>
				</div>
				<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
			</div>
			<div class="rodape">
				&copy; Site desenvolvido por Andr&eacute; farias, Erickson Santos, Janderson Aguiar, Leandro de Assis
				<div class="contato">
					[email de contato]
				</div>
			</div>
		</div>
				<!--
				<div class="nav">
					<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
					<span class="menuButton"><g:link class="menu" action="sobrenos.gsp"><g:message code="Sobre N&oacute;s" args="[entityName]" /></g:link></span>
					<span class="menuButton"><g:link controller='usuario'>Usu&aacute;rios</g:link></span>
					<span class="menuButton"><g:link controller='encontro'>Encontros</g:link></span>
					<span class="menuButton"><g:link controller='ata'>Atas</g:link></span>
					<span class="menuButton"><g:link controller='oficio'>Of&iacute;cios</g:link></span>
					<span class="menuButton"><g:link action="trocarsenha">Mudar Senha</g:link></span>
					<g:loginControl />
				</div>
				<!--<div id="logo">Sistema de Gerenciamento do EJC da Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</div>-->
				<!--
				<div id="main">
					<g:layoutBody />
				</div>
				
				
				-->
    </body>
</html>