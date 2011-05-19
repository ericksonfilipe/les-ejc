
<%@ page import="les.ejc.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        
        <title>Senhas Criptografadas</title>
    </head>
    <body>
        <div id="pageBody">
            <h1>Senhas Criptografadas (para teste)</h1>

            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="login" title="${message(code: 'usuario.login.label', default: 'Login')}" />
                        
                            <g:sortableColumn property="senha" title="${message(code: 'usuario.senha.label', default: 'Senha')}" />
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "login")}</td>
                        
                            <td>${fieldValue(bean: usuarioInstance, field: "senha")}</td>
                        
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

        </div>
    </body>
</html>
