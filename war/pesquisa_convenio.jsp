<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pesquisa de empresa conveniada</title>
<script language='JavaScript'>
function Validacampos(){
	campo = document.frmcpf.parametroConvenio.value;
	if(document.frmcpf.tipoPesquisa.value=="0"){
		alert('Selecione um parâmetro');
		}
	else{
		if(document.frmcpf.tipoPesquisa.value!="5")	{
			if(campo==""){
				alert('Preencha o parâmetro de pesquisa');
		
				}
			else{
				frmcpf.submit();
				}
		}else{
			frmcpf.submit();
	         }
    }
}

</script>

<style type="text/css">  
  @import url("css_tabela.css");  
</style></head>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletConvenio" target="src" >
<input type="hidden" name="operacao" value="consulta">
  <p class="style1">&nbsp;</p>
  <p class="style1" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pesquisa de empresa conveniada </p>
  <p class="style1" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select size="1" name="tipoPesquisa">
      <option value="0">Selecione</option>
      <option value="1">Raz&atilde;o Social</option>
      <option value="2">CNPJ</option>
      <option value="5">Todos</option>
    </select>
    <input type="text" name="parametroConvenio" size="25" maxlength="100" value=''>
    <input type="button" name="Pesquisar" value="Pesquisar" onClick="Validacampos();">
  </p>
   <%if(request.getSession().getAttribute("tipoUsuario")=="S"){ %>  
  <p class="style1" align="center">
 <input onClick="location.href='inclui_convenio.jsp?inicio=S'" type="button" name="Incluir" value="Incluir nova empresa">
 

 </p>
 <%} %>
</form>


<iframe name='src' width='700' height='800' frameborder='0' src='HomePesquisa.jsp'>
</iframe>
</div>
</body>
</html>


