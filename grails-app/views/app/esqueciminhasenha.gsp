
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Recuperação de Senha</title>         
  </head>
  <body>
	<div id="pageBody">
      <h1>Esqueceu Sua Senha?</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="enviarSenhaPorEmail" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="email">E-Mail:</label>
                </td>
                <td>
                  <input type="email" id="email" name="email"/>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
          <g:submitButton name="search" value="Enviar Senha por email"/>
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
