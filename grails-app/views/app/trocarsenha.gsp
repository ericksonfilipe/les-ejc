
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Login</title>         
  </head>
  <body>
	<div class="nav">
        <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    </div>
    <div class="body">
      <h1>Login</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="trocarminhasenha" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="login">Login:</label>
                </td>
                <td>
                  <input type="text" id="login" name="login"/>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="senha">Senha Antiga:</label>
                </td>
                <td>
                  <input type="password" id="senha" name="senha"/>
                </td>
              </tr> 
            
               <tr class="prop">
                <td class="name">
                  <label for="senha">Senha Nova:</label>
                </td>
                <td>
                  <input type="password" id="senhanova1" name="senhanova1"/>
                </td>
              </tr> 
            
              <tr class="prop">
                <td class="name">
                  <label for="senha">Repita Senha Nova:</label>
                </td>
                <td>
                  <input type="password" id="senhanova2" name="senhanova2"/>
                </td>
              </tr> 
 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Mudar Senha" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
