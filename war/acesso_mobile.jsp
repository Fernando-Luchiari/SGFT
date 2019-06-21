<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Usu&aacute;rio Móvel</title>
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

</script>
<style type="text/css"> 
 @import url("css_mobile.css"); 
</style></head>

<body>
<form name="frmcpf" method="post" action="ServletMovelWeb" >
<input type="hidden" name="operacao" value="AcessoUsuarioMovel">
 <p class="style1" align="center">Acesso SGCT Mobile</p>
  <table align="center">
   <tr>
	   <td><label>id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	   		<input name="txtID" type="text" onkeypress='return SomenteNumero(event)'></input>
	   </td>
   </tr>
   <tr>
	   <td><label>senha</label>
	   		<input type="password" name="txtSenha" type="text"></input>
	        <input type="submit" name="Submit" value="Ok"></td>	  
   </tr>
  </table>
<%if(request.getSession().getAttribute("mensagemAcesso")!=null){ %>
	
 	<table width="200" border="1">
    <tr>
      <th scope="col"><div align="center">Mensagem!</div></th>
    </tr>
    <tr>
      <td><%=request.getSession().getAttribute("mensagemAcesso") %></td>
    </tr>
  </table>
   <%request.getSession().removeAttribute("mensagemAcesso");    
    }%>
   

</form>


</body>
</html>


