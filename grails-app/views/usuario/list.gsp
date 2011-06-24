
<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
		<resource:autoComplete skin="default" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
        <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>
		<style type="text/css" media="screen">
			.links {
				text-align: center;
				margin-top: 40px;
			}
			
			.imagem {
				padding: 40px;
			}
        </style>
    </head>
    <body>
		
		<h3>Procurar Usuario</h3>
			<richui:autoComplete name="pegarUsuario" action="${createLinkTo('dir': 'usuario/pegarUsuarios')}" onItemSelect="document.location.href = \'${createLinkTo(dir: 'usuario/show')}/\' + id;" />
		<br />
		
        <div id="pageBody">
            <h2>Usu&aacute;rios</h2>
			<div class="links">
				<span class="imagem">
					<g:link action="listJovem"><img src="${resource(dir:'images',file:'jovens.png')}" /></g:link>
				</span>
				<span class="imagem">
					<g:link action="listCasal"><img src="${resource(dir:'images',file:'casais.png')}" /></g:link>
				</span>
				<span class="imagem">
					<g:link action="listPadre"><img src="${resource(dir:'images',file:'padres.png')}" /></g:link>
				</span>
			</div>
        </div>
    </body>
</html>