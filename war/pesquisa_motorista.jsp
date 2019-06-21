<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pesquisa de motorista</title>
<script language='JavaScript'>
function SomenteNumero(e){
	if (document.frmcpf.tipoPesquisa.value!="6"){ 
		var tecla=(window.event)?event.keyCode:e.whi…
		if((tecla > 47 && tecla < 58)) return true;
		else{
		if (tecla != 8) return false;
		else return true;
		}
	}
}

function Validacampos(){
	campo = document.frmcpf.txtParametroMotorista.value;
	if(document.frmcpf.tipoPesquisa.value=="0"){
		alert('Selecione um parâmetro');
	}else{ 
		if (campo=="" && document.frmcpf.tipoPesquisa.value!="7"){	
			alert('Preencha o parâmetro de pesquisa');			
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
<table align="center">
<div id="fundo">
<form name="frmcpf" method="post" action="ServletMotorista" target="src" >
<input type="hidden" name="operacao" value="consulta">
  <p class="style1">&nbsp;</p>
  <p class="style1" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pesquisa de motorista </p>
  <p class="style1" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <select size="1" name="tipoPesquisa" >
      <option value="0">Selecione</option>
      <option value="6">Nome</option>
      <option value="1">CPF</option>
      <option value="2">C&oacute;digo Funcional</option>
      <option value="7">Todos</option>
    </select>
    <input type="text" name="txtParametroMotorista" size="20" maxlength="16" value='' onkeypress='return SomenteNumero(event)'>
    <input type="button" name="Pesquisar" value="Pesquisar" onClick="Validacampos();" >
  </p>
  <%if(request.getSession().getAttribute("tipoUsuario")=="S"){ %>  
  <p class="style1" align="center">
 <input onClick="location.href='inclui_motorista.jsp?inicio=S'" type="button" name="Incluir" value="Incluir novo motorista">
 </p>
 <% }%>
</form>


<iframe name='src' width='700' height='800' frameborder='0' src='HomePesquisa.jsp'>
</iframe>
</div>
</table>
</body>
</html>

