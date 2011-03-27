<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:20px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
		<div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
		</div>
        <div id="pageBody">
			<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            <h1>Bem-Vindo!</h1>	
            <div id="controllerList" class="dialog">
                <h2>Opcoes:</h2>
                <ul>
					<g:if test="${session.user}">
						<li class="controller"><g:link controller='encontro'>Controle de Encontros</g:link></li>
						<li class="controller"><g:link controller='usuario'>Controle de Usuarios</g:link></li>
						<li class="controller"><g:link controller='oficio'>Controle de Oficio</g:link></li>
                  <g:if test="${session?.user?.j5Atual}">
                    <li class="controller"><g:link controller='ata'>Controle de Atas</g:link></li>
						</g:if>
						<li><g:link action="trocarsenha">Mudar Senha</g:link></li>
					</g:if>
                </ul>
            </div>
       </div>
    </body>
</html>
