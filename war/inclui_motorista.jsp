<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Motorista</title>
<% if (request.getParameter("inicio")!=null){
	
	request.getSession().setAttribute("cpf_motorista", "");
	request.getSession().setAttribute("rg_motorista", "");
	request.getSession().setAttribute("telefone_motorista", "");
	request.getSession().setAttribute("nome_motorista", "");
	request.getSession().setAttribute("ddd_motorista", "");
	request.getSession().setAttribute("id_dispositivo_motorista","");
	request.getSession().setAttribute("modelo_motorista", "");
	request.getSession().setAttribute("placa_motorista", "");
	request.getSession().setAttribute("ano_motorista", "");
	
}%>
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
<script language="javascript">

function Validacampos(){
	
	var verifica = false;
	nome = document.frmcpf.txtNome.value;
	cpf = document.frmcpf.txtCpf.value;
	dispositivo = document.frmcpf.txtDispositivo.value;
	senha = document.frmcpf.txtSenha.value;
        


	if(nome==""){
			verifica = true;
		}
	if(verifica!=true && cpf==""){
			verifica = true;
		}
	if(verifica!=true && dispositivo==""){
			verifica = true;
		}
	if(verifica!=true && senha==""){
			verifica = true;
	}

	if(verifica==true){
		alert('Campo(s) obrigatório(s) em branco');
		}
	else{
		Validasenha();
		}
				
}

function Validasenha(){
	senha1 = document.frmcpf.txtSenha.value
	senha2 = document.frmcpf.txtSenha2.value

	if(senha1 != senha2){
			alert('Senhas não conferem');
		}
	else{
		Validacpf();
		form.submit();
	}
}
function Validacpf(){
	
	if(document.frmcpf.txtCpf.value!=""){

		if (vercpf(document.frmcpf.txtCpf.value)) 
		{document.frmcpf.submit();}else 
		{errors="1";if (errors) alert('CPF Inválido');
		document.retorno = (errors == '');}}
		function vercpf (txtCpf) 
		{if (txtCpf.length != 11 || txtCpf == "00000000000" || txtCpf == "11111111111" || txtCpf == "22222222222" || txtCpf == "33333333333" || txtCpf == "44444444444" || txtCpf == "55555555555" || txtCpf == "66666666666" || txtCpf == "77777777777" || txtCpf == "88888888888" || txtCpf == "99999999999")
		return false;
		add = 0;
		for (i=0; i < 9; i ++)
		add += parseInt(txtCpf.charAt(i)) * (10 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
		rev = 0;
		if (rev != parseInt(txtCpf.charAt(9)))
		return false;
		add = 0;
		for (i = 0; i < 10; i ++)
		add += parseInt(txtCpf.charAt(i)) * (11 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
		rev = 0;
		if (rev != parseInt(txtCpf.charAt(10)))
		return false;
		return true;
	}
}





</script>


<style type="text/css">  
  @import url("css_tabela.css");  
</style></head>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletMotorista"> 
 <input type="hidden" name="operacao" value="cadastro">
  <p class="style1" align="center">Incluir  Motorista</p>
  <p class="style1" align="center">
  <table width="939" height="281" border="0">
    <tr>
      <td><div align="right"><span class="style6">ID Dispositivo m&oacute;vel * </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtDispositivo" size="10" maxlength="20" value='<%=request.getSession().getAttribute("id_dispositivo_motorista")%>' onkeypress='return SomenteNumero(event)'>
      </span></td>
     
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Nome *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNome" size="50" maxlength="50" value='<%=request.getSession().getAttribute("nome_motorista")%>'>
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">CPF *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCpf" size="20" maxlength="11" value='<%=request.getSession().getAttribute("cpf_motorista")%>' onkeypress='return SomenteNumero(event)'>
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">R.G.</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRg" size="20" maxlength="100" value='<%=request.getSession().getAttribute("rg_motorista")%>'>
      </span></td>
      
    </tr>
        <tr>
      <td><div align="right"><span class="style6">DDD</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtDdd" size="10" maxlength="3" value='<%=request.getSession().getAttribute("ddd_motorista")%>' onkeypress='return SomenteNumero(event)' >
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Telefone</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtTelefone" size="20" maxlength="9" value='<%=request.getSession().getAttribute("telefone_motorista")%>' >
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Modelo do Ve&iacute;culo</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtModelo" size="25" maxlength="30" value='<%=request.getSession().getAttribute("modelo_motorista")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right">Ano do Veículo</div></td>
      <td><span class="style1">
        <input type="text" name="txtAno" size="8" maxlength="4" value='<%=request.getSession().getAttribute("ano_motorista")%>' onkeypress='return SomenteNumero(event)'>
      </span></td>
    </tr>
    <tr>  
      <td><div align="right">Placa</div></td>
      <td><span class="style1">
        <input type="text" name="txtPlaca" size="10" maxlength="8" value='<%=request.getSession().getAttribute("placa_motorista")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Propriet&aacute;rio do Ve&iacute;culo</span></div></td>
      <td><span>
        <input name="txtProprietario" type="radio" value="true">
		<span >Sim</span>
		<input name="txtProprietario" type="radio" value="false" checked>
		<span >Não</span>   
      </span></td>
     
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Senha pessoal *</span></div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha" size="20" maxlength="6">
      </span></td>
      
    </tr>
        <tr>
      <td><div align="right"><span class="style6">Confirma senha *</span></div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha2" size="20" maxlength="6">
      </span></td>

    </tr>


  </table>

  	<p class="style1" align="center">
    	<input type="button" name="Salvar" value="Salvar" onClick="Validacampos();">
    	<input type="button" name="Submit" value="Voltar" onClick="location.href='pesquisa_motorista.jsp'">
	</p>

</form>
</div>

</body>
</html>


