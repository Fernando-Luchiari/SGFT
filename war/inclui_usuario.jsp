<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Usu&aacute;rio</title>
<%if (request.getParameter("inicio")!=null){
	
request.getSession().setAttribute("nome","");
request.getSession().setAttribute("login_cadastro","");
request.getSession().setAttribute("cpf","");
request.getSession().setAttribute("rg","");
request.getSession().setAttribute("telefone","");
request.getSession().setAttribute("ddd","");

	
}	
%>

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
	login = document.frmcpf.txtLogin.value;
	senha = document.frmcpf.txtSenha.value;
        


	if(nome==""){
			verifica = true;
		}
	if(verifica!=true && cpf==""){
			verifica = true;
		}
	if(verifica!=true && login==""){
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
	senha1 = document.frmcpf.txtSenha.value;
	senha2 = document.frmcpf.txtSenha2.value;

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
<form name="frmcpf" method="post" action="ServletUsuario" onSubmit="VerificaCPF();">
<input type="hidden" name="operacao" value="cadastro"> 
  <p class="style1" align="center">Incluir Usuário</p>
  <p class="style1" align="center">
  <table width="864" height="209" border="0">
     <tr>
          <td height="32"><div align="right"><span class="style6">Nome *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNome" size="50" maxlength="50" value ="<%=request.getSession().getAttribute("nome")%>">
      </span></td>
    </tr>
    
    <tr>
      <td height="33"><div align="right"><span class="style6">CPF *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCpf" size="20" maxlength="11" value='<%=request.getSession().getAttribute("cpf")%>' onkeypress='return SomenteNumero(event)'>
      </span></td>
    </tr>
    <tr>
      <td height="27"><div align="right"><span class="style6">R.G.</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRg"  size="20" maxlength="15" value='<%=request.getSession().getAttribute("rg")%>'>
      </span></td>
    </tr>
    
    <tr>
      <td height="27"><div align="right"><span class="style6">DDD</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtDdd" size="10" maxlength="10" value='<%=request.getSession().getAttribute("ddd")%>'>
      </span></td>
    </tr>
    <tr>
      <td height="27"><div align="right"><span class="style6">Telefone</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtTelefone" size="20" maxlength="20" value='<%=request.getSession().getAttribute("telefone")%>'>
      </span></td>
    </tr>
    <tr>
      <td height="38"><div align="right"><span class="style6">Login *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtLogin" size="20" maxlength="15" value='<%=request.getSession().getAttribute("login_cadastro")%>'>
      </span></td>
     </tr>
     <tr> 
      <td><div align="right">Senha *</div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha" size="20" maxlength="6">
      </span></td>
     </tr>
     <tr> 
      <td><div align="right">Confirma Senha *</div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha2" size="20" maxlength="6">
      </span></td>
    </tr>
    <tr>

      <td height="32"><div align="right"><span class="style6">N&iacute;vel</span></div></td>
      <td><span class="style6">
      <input name="txtSupervisor" type="radio" value="false" checked>
Atendente
<input name="txtSupervisor" type="radio" value="true">
Supervisor

      </span></td>
    </tr>
  </table>
  
  <p class="style1" align="center">
    <label>
    <input type="button" name="Submit" value="Voltar" onClick="location.href='pesquisa_usuario.jsp'">
    </label> 
    
  <input type="button" name="Salvar" value="Salvar" onClick="Validacampos();">
</form>
</div>

</body>



</html>


