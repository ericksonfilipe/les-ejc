
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
	<resource:tabView />
    <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>         
  </head>
  <body>
	<div id="pageBody">
      <h2>Contato</h2>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="contatenos" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="email">Email:</label>
                </td>
                <td>
                  <input type="text" id="email" name="email"/>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="mensagem">Mensagem:</label>
                </td>
                <td>
                  <g:textArea name="mensagem" cols="40" rows="5" value="${params.mensagem}" />
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Enviar" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>