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
						<li><g:link controller="app" action="trocarsenha">Mudar Senha</g:link></li>
						<li><b>Ol&aacute;, </b><g:link controller="usuario" action="perfil" id="${session.user.id}">${session.user}!</g:link></li>
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
						   <center>
						   <h1><big>EJC - Encontro de Jovens com Cristo</big></h1>
						   <br />
						   <h1>Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</h1>
						   <br />
						   <h3>Diocese de Campina Grande - PB</h3>
						   </center>
					   </div>
					</div>
					
					<div class="menu">
						<ul>
							<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
							
							<li><g:link controller="app" action="sobrenos.gsp"><g:message code="Quem Somos" args="[entityName]" /></g:link></li>
								
							<g:if test="${session.user}">
							<li><g:link controller='usuario'>Usu&aacute;rios</g:link>
								<ul>
									<g:if test="${session.user?.j5Atual}"><li><g:link controller='usuario' action='create'>Adicionar Usu&aacute;rios</g:link></li></g:if>
									<li><g:link controller='usuario' action='listJovem'>Visualizar Jovens</g:link></li>
									<li><g:link controller='usuario' action='listCasal'>Visualizar Casais</g:link></li>
									<li><g:link controller='usuario' action='listPadre'>Visualizar Padres</g:link></li>
									<g:if test="${session.user?.j5Atual}"><li><a class="list" href="${createLink(uri: '/usuario/listNotAtivado')}"><g:message code="Visualizar Usu&aacute;rios Pendentes"/></li></g:if>
								</ul>
							</li>
							</g:if>
							
							<li><g:link controller='encontro'>Encontros</g:link>
								<g:if test="${session.user?.j5Atual}">
								<ul>
									<li><g:link controller='encontro' action='create'>Adicionar Encontros</g:link></li>
									<li><g:link controller='encontro' action='list'>Visualizar Encontros</g:link></li>
								</ul>
								</g:if>
							</li>
								
							<li><g:link controller='evento'>Eventos</g:link>
								<g:if test="${session.user?.j5Atual}">
								<ul>
									<li><g:link controller='evento' action='create'>Adicionar Eventos</g:link></li>
									<li><g:link controller='evento' action='list'>Visualizar Eventos</g:link></li>
								</ul>
								</g:if>
							</li>
							
							<g:if test="${session.user?.j5Atual}">
							<li><g:link>Documentos</g:link>
								<ul>
									<li><g:link controller='ata' action='list'>Atas</g:link></li>
									<li><g:link controller='oficio' action='list'>Of&iacute;cios</g:link></li>
								</ul>
							</li>
							</g:if>
								
							<g:if test="${session.user}">
							<li><g:link>Outros</g:link>
								<ul>
									<li><g:link controller='aniversario' action='list'>Anivers&aacute;rios</g:link></li>
									<li><g:link controller='enquete' action='list'>Enquetes</g:link></li>
									<li><g:link controller='noticia' action='list'>Not&iacute;cias</g:link></li>
									<g:if test="${session.user?.j5Atual}"><li><g:link controller='reflexao' action='list'>Reflex&otilde;es</g:link></li></g:if>
								</ul>
							</li>
							</g:if>
							
							<g:if test="${!session.user}">
							<li><g:link controller='noticia' action='list'>Not&iacute;cias</g:link></li>
							</g:if>
							
						</ul>
					</div>
					
					<div class="main">
						<g:layoutBody />
					</div>
				</div>
				<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>
			</div>
			<div class="rodape">
				&copy; Site desenvolvido por Andr&eacute; Farias, Erickson Santos, Janderson Aguiar, Leandro de Assis
				<div class="contato">
					<a href="mailto:projetoles20111@googlegroups.com">Contate-nos!</a>
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
					<span class="menuButton"><g:link controller='enquete'>Enquetes</g:link></span>
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