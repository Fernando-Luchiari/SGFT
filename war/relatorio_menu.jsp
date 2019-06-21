<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Menu de Relatorios</title>

<script language='JavaScript'>
function SomenteNumero(e){
var tecla=(window.event)?event.keyCode:e.whi…
if((tecla > 47 && tecla < 58)) return true;
else{
if (tecla != 8) return false;
else return true;
}
}
</script>

<style type="text/css">  
  @import url("css_tabela.css");  
</style></head>

<body>

<div id="fundo">

 <%if(request.getSession().getAttribute("tipoUsuario")=="S"){ %>
  <p class="style1" align="center">Relat&oacute;rios</p>
 <div align = "center">
  <table width="200" height="100" border="1">
    <tr>
      <td width="700" height="41"><div align="center"><a href="relatorio_log.jsp" target="mainFrame">Relat&oacute;rio de Log</a> </div></td>
    </tr>
    <tr>
      <td width="700" height="41"><div align="center"><a href="relatorio_chamado.jsp" target="mainFrame">Relat&oacute;rio de Chamados</a> </div></td>
    </tr>
  </table>
  </div>
  <p class="style1" align ="center">
</p>
</div>
<%} else {%>

<div align = "center">
  <p>&nbsp;</p>
  <table width="512" height="100" border="1">
    <tr>
      <td width="700" height="41"><div align="center">Você não tem acesso ao módulo de relatórios! </div></td>
    </tr>
</table>
</div>


<% }%>
</body>
</html>


