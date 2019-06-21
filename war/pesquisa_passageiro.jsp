<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pesquisa de passageiro</title>
<script language='JavaScript'>


function SomenteNumero(e){
	i = document.frmcpf.tipoPesquisa.value;
	if(i==2){
	
	}
	else{
		var tecla=(window.event)?event.keyCode:e.whi…
		if((tecla > 47 && tecla < 58)) 
			return true;
		else{
		if (tecla != 8) 
			return false;
		else 
			return true;
		}
	}
}

</script>

<script language='JavaScript'>
function Validacampos(){
	campo = document.frmcpf.parametroPassageiro.value;
	if(document.frmcpf.tipoPesquisa.value=="0"){
		alert('Selecione um parâmetro');
		}
	else{
	if(campo==""){
		alert('Preencha o parâmetro de pesquisa');

		}
	else{
		frmcpf.submit();
		}
	}
}

</script>
<style type="text/css">  
  @import url("css_tabela.css");  
</style>
</head>

<body>
	<div id="fundo">
	<form name="frmcpf" method="post" action="ServletPassageiro" target="src" >
	<input type="hidden" name="operacao" value="consulta">
		  <p class="style1">&nbsp;</p>
		  <p class="style1" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pesquisa de passageiros </p>
		  <p class="style1" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		    <select size="1" name="tipoPesquisa">
		      <option value="0">Selecione</option>
		      <option value="1">CPF</option>
		      <option value="2">Nome</option>
		      <option value="5">Telefone</option>
		    </select>
		    <input type="text" name="parametroPassageiro" size="50" maxlength="100" value='' onkeypress='return SomenteNumero(event)'>
		    <input type="button" name="Pesquisar" value="Pesquisar" onClick="Validacampos();">
		      <p class="style1" align="center">
 <input onClick="location.href='inclui_passageiro.jsp?inicio=S'" type="button" name="Incluir" value="Incluir novo passageiro">
 </p>
		  
		
</form>


<iframe name='src' width='700' height='800' frameborder='0' src='HomePesquisa.jsp'>
</iframe>
</div>
</body>
</html>


