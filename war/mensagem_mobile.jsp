<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Mensagem</title>

<style type="text/css">  
  @import url("css_tabela.css");  
</style>
</head>

<body>
<form name="frmcpf" method="post" action="" target="src" onsubmit="">
  
    <p>
      <%if(request.getSession().getAttribute("mensagem")!=null){ %>
    </p>
    <p>&nbsp;</p>
    <div align="center">
 	<table width="200" border="1">
    <tr>
      <th scope="col"><div align="center">Mensagem!</div></th>
    </tr>
    <tr>
      <td><div align="center"><%=request.getSession().getAttribute("mensagem") %></div></td>
    </tr>
  </table>
    <p>
      <label>
      <input type="button" name="Button" value="Voltar" onclick="location.href='<%=request.getSession().getAttribute("pagina")%>'"/>
      </label>
    </p>
	</div>
   <%request.getSession().removeAttribute("mensagem");
     request.getSession().removeAttribute("pagina");
    
    }%>
</form>
</body>
</html>



