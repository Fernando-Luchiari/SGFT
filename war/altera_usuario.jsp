<%@page import="modelo.FuncionarioTO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.UsuarioTO"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Usu&aacute;rio</title>
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
	senha = document.frmcpf.txtSenha.value;
        


	if(nome==""){
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
		frmcpf.submit();
	}
}



</script>
<style type="text/css">  
  @import url("css_tabela.css");  
</style>
</head>
<%

if(request.getParameter("cod_funcionario")!=null){
	
		 request.getSession().setAttribute("cod_usuario",Integer.parseInt(request.getParameter("cod_funcionario").toString()));
}	
       
		int codigo = Integer.parseInt(request.getSession().getAttribute("cod_usuario").toString());
		FuncionarioTO dadosfuncionario = new FuncionarioTO();
		dadosfuncionario.setCodfuncionario(codigo);
		Funcionario funcionario = new Funcionario(dadosfuncionario);
		List<FuncionarioTO> listafuncionario = funcionario.consultar(2);
		Iterator<FuncionarioTO> iteratorF = listafuncionario.iterator();
		if (iteratorF.hasNext()) {
			FuncionarioTO itemF = iteratorF.next();
			UsuarioTO dadosusuario = new UsuarioTO();
			dadosusuario.setCodfuncionario(codigo);
			Usuario usuario = new Usuario(dadosusuario,null);
			List<UsuarioTO> listausuario = usuario.consultar(1);
			Iterator<UsuarioTO> iteratorU = listausuario.iterator();
			if (iteratorU.hasNext()){
				UsuarioTO itemU = iteratorU.next();	
				
	
			
		%>
<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletUsuario" >
<input type="hidden" value= "alteracao" name="operacao" >
<input type="hidden" name = "txtLogin" value="<%=itemU.getLogin()%>">
<input type="hidden" name="txtCodfuncionario" value="<%=itemF.getCodfuncionario()%>">
<input type="hidden" name="txtCpf" value="<%=itemF.getCpf()%>">
  <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
  <p class="style1" align="center">Alterar</p>
  <%} else { %>
  <p class="style1" align="center">Consultar</p>
  <%} %>
  <p class="style1" align="center">
  <table width="864" height="209" border="0">
        <tr>
      <td height="32"><div align="right"><span class="style6">Nome *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNome" size="50" maxlength="50" value='<%=itemF.getNome()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td height="33"><div align="right"><span class="style6">CPF *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCpf" size="20" maxlength="11" value='<%=itemF.getCpf()%>' disabled="disabled">
      </span></td>
    </tr>
    <tr>
      <td height="27"><div align="right"><span class="style6">RG</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRg"  size="20" maxlength="15" value='<%=itemF.getRg()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>  >
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style6">DDD</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtDdd" size="10" maxlength="10" value='<%=itemF.getDdd()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>

    <tr>
      <td><div align="right"><span class="style6">Telefone</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtTelefone" size="20" maxlength="100" value='<%=itemF.getTelefone()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td height="38"><div align="right"><span class="style6">Login *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtLogin" size="20" maxlength="15" value='<%=itemU.getLogin()%>' disabled="disabled">
      </span></td>
    </tr>
    <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
    <tr>  
      <td><div align="right">Senha *</div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha" size="20" maxlength="6" value='<%=itemU.getSenha()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td><div align="right">Confirma Senha *</div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha2" size="20" maxlength="6"  value='<%=itemU.getSenha()%>'>
      </span></td>
    </tr>
    <%} %>
    <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
    <tr>
      <td height="32"><div align="right"><span class="style6">N&iacute;vel</span></div></td>
      <%if (itemU.getSupervisor() == 1) {%>
	        <td><span>
			<input name="txtSupervisor" type="radio" value="true" checked>
			<span class="style5">Supervisor</span>
			<input name="txtSupervisor" type="radio" value="false" >
			<span class="style5">Atendente</span>
	      </span></td>
	     <%}else{ %> 
	     	<td><span>
			<input name="txtSupervisor" type="radio" value="true">
			<span class="style5">Supervisor</span>
			<input name="txtSupervisor" type="radio" value="false" checked>
			<span class="style5">Atendente</span>
	        </span></td>
	    <%} %>
    </tr>
    <%} else {%>
    <tr>
    <td height="32"><div align="right"><span class="style6">N&iacute;vel</span></div></td>
     <%if (itemU.getSupervisor() == 1) {%>
	        <td>
			<span class="style5">Supervisor</span>
	        </td>
	    <%} else { %> 
		<td>
		<span class="style5">Atendente</span>
	    </td>
		 
    <%} %>
	<%}%>
    </tr>
  </table>
  
  <p class="style1" align="left">  
     
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
    	<input type="button" name="Salvar" value="Salvar" onClick="Validacampos();">
    	 	<%if (itemU.getAtivo()== 1) {%> 
	 			<input type="button" name="Desativar" value="Desativar" onClick="confirmBox();">
	 		<%}else {%>
	 			<input type="button" name="Ativar" value="Ativar" onClick="confirmBox2()">
    	    <%} %>
    <%} %>
    <input type="button" value="Voltar" onClick="location.href='pesquisa_usuario.jsp'">
     </p>
  <%if(request.getSession().getAttribute("mensagemAlterar")==null){
	  }
	  else{ %>
	
	<div align="center">
 	<table width="200" border="1">
    <tr>
      <th scope="col"><div align="center">Mensagem!</div></th>
    </tr>
    <tr>
      <td><div align="center"><%=request.getSession().getAttribute("mensagemAlterar") %></div></td>
    </tr>
  </table>
  </div>
   <%request.getSession().removeAttribute("mensagemAlterar");
    
    }%>
  
</form>
<%	 }
	}
		
%>
</div>
</body>
<script language="JavaScript">

function confirmBox() {

	user = document.frmcpf.txtNome.value;
	
if (confirm("Tem certeza que deseja desativar o usuário " + user + " ?")) {

	executar(frmcpf,'excluir');}

}

</script>
<script language="JavaScript">
function confirmBox2() {

	user = document.frmcpf.txtNome.value;
	
if (confirm("Tem certeza que deseja ativar o usuário " + user + " ?")) {

	executar(frmcpf,'ativar');}

} 	
</script>
<script language="javascript" type="text/javascript">
function executar(frmcpf,operacao)
{
	frmcpf.operacao.value = operacao;
    
	frmcpf.submit();
}


</script>

</html>


