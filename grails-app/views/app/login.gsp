﻿
<%@ page import="ejc.Reflexao" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>EJC - Par&oacute;quia S&atilde;o Crist&oacute;v&atilde;o</title>         
  </head>
  <body>
	<div id="pageBody">
      <h2>Login</h2>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="authenticate" method="post" >
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
                  <label for="senha">Senha:</label>
                </td>
                <td>
                  <input type="password" id="senha" name="senha"/>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Login" />
          </span>
        </div>
      </g:form>
          <br>
          <g:link action="esqueciminhasenha">Esqueci Minha Senha!</g:link>
		  <br/><br/><br/>
		  

		  
    </div>
  </body>
</html>