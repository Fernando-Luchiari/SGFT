<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pesquisa de chamados</title>

<script language='JavaScript'>
function Validacampos(){
	
	campo = document.frmcpf.parametroChamadoC.value;
	
	if(document.frmcpf.tipoPesquisa.value=="0"){
		alert('Selecione um parâmetro');
		return false;
	}
	else{
		if(campo=="" && document.frmcpf.tipoPesquisa.value=="2")
		{
			alert('Preencha o parâmetro de pesquisa');
			return false;
		}
		
	}
	frmcpf.submit();
}

</script>

<script language='JavaScript'>


function SomenteNumero(e){
	var tecla=(window.event)?event.keyCode:e.whi
	if((tecla == 13)){
		if(document.frmcpf.tipoPesquisa.value=="1"){
			return true;
		}else{
			return false;
		}	
	}else{
		return true;
	}	
}

</script>

<style type="text/css">  
  @import url("css_tabela.css");  
</style>
</head>

<body>
<div id = "fundo">
<form name="frmcpf" method="post" action="ServletChamado_Cliente" target="src" onSubmit="">
<input type="hidden" name="operacao" value="consulta">
  <p class="style1">&nbsp;</p>
  <p align="center" class="style1">Pesquisa de chamados</p>
  <p align="center" class="style1">
    <select size="1" name="tipoPesquisa">
      <option value="0">Selecione</option>
      <option value="1">Todos</option>
      <option value="2">C&oacute;digo</option>
    </select>
    <input type="text" name="parametroChamadoC" size="25" maxlength="100" value='' onkeypress='return SomenteNumero(event)'>
    <input type="button" name="Pesquisar" value="Pesquisar" onClick="Validacampos();">
  </p>
  <p class="style1" align="center">
    <label>
    </label>
 </p>
</form>
<iframe name='src' width='700' height='800' frameborder='0' src='HomePesquisa.jsp'>
</iframe>
</div>
</body>
</html>


