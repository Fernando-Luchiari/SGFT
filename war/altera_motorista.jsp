<%@page import="modelo.FuncionarioTO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="modelo.MotoristaTO"%>
<%@page import="modelo.Motorista"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Motorista</title>
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
	senha1 = document.frmcpf.txtSenha.value
	senha2 = document.frmcpf.txtSenha2.value

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
<%if(request.getParameter("cod_funcionario")!=null){
	
	request.getSession().setAttribute("cod_motorista",Integer.parseInt(request.getParameter("cod_funcionario").toString()));
}

		int codigo = Integer.parseInt(request.getSession().getAttribute("cod_motorista").toString());
		FuncionarioTO dadosfuncionario = new FuncionarioTO();
		dadosfuncionario.setCodfuncionario(codigo);
		Funcionario funcionario = new Funcionario(dadosfuncionario);
		List<FuncionarioTO> listafuncionario = funcionario.consultar(2);
		Iterator<FuncionarioTO> iteratorF = listafuncionario.iterator();
		if (iteratorF.hasNext()) {
			FuncionarioTO itemF = iteratorF.next();
			MotoristaTO dadosmotorista = new MotoristaTO();
			dadosmotorista.setCodfuncionario(codigo);
			Motorista motorista = new Motorista(dadosmotorista,null);
			List<MotoristaTO> listamotorista = motorista.consultar(1);
			Iterator<MotoristaTO> iteratorM = listamotorista.iterator();
			if (iteratorM.hasNext()){
				MotoristaTO itemM = iteratorM.next();	
			
		%>	
<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletMotorista">
<input type="hidden" value= "alteracao" name="operacao" >
<input type="hidden" name="txtCodfuncionario" value="<%=itemF.getCodfuncionario()%>">
<input type="hidden" name="txtDispositivo" value="<%=itemM.getId_dispositivo()%>">

<input type="hidden" name="txtCpf" value="<%=itemF.getCpf()%>">
  
  <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
  <p class="style1" align="center">Alterar Motorista</p>
  <%} else { %>
  <p class="style1" align="center">Consultar Motorista</p>
  <%} %>
  <table>
    <tr>
      <td><div align="right"><span class="style6">ID Motorista *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtDispositivo" size="10" maxlength="20" value='<%=itemM.getId_dispositivo()%>' disabled="disabled">
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Nome *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNome" size="50" maxlength="50" value='<%=itemF.getNome()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">CPF *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCpf" size="20" maxlength="10" value='<%=itemF.getCpf()%>' disabled="disabled">
      </span></td>      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">RG</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRg" size="20" maxlength="10" value='<%=itemF.getRg()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">DDD</span></div></td>
      <td><span class="style1">
      	<%if (itemF.getDdd()!= null){%>
        	<input type="text" name="txtDdd" size="10" maxlength="3" value='<%=itemF.getDdd()%>' onkeypress='return SomenteNumero(event)' >
      	<%}else{ %>
      		<input type="text" name="txtDdd" size="10" maxlength="3" value='' onkeypress='return SomenteNumero(event)' >
      	<%} %>
      </span></td>
      
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Telefone</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtTelefone" size="20" maxlength="9" value='<%=itemF.getTelefone()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Modelo do Ve&iacute;culo</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtModelo" size="20" maxlength="30" value='<%=itemM.getModelo_veiculo()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
     </tr>
     <tr> 
      <td><div align="right">Ano</div></td>
      <td><span class="style1">
        <input type="text" name="txtAno" size="8" maxlength="4" value='<%=itemM.getAno_veiculo()%>' onkeypress='return SomenteNumero(event)' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
     </tr>
     <tr> 
      <td><div align="right">Placa</div></td>
      <td><span class="style1">
        <input type="text" name="txtPlaca" size="10" maxlength="10" value='<%=itemM.getPlaca()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
    <tr>
      <td><div align="right"><span class="style6">Propriet&aacute;rio do Ve&iacute;culo</span></div></td>
      <td><span>
        <%if(itemM.getProprietario()==1) {%>
	        <input name="txtProprietario" type="radio" value="true"checked>
			<span >Sim</span>
			<input name="txtProprietario" type="radio" value="false" >
		    <span class="style5">Não</span>
	    <%}else{ %>
		    <input name="txtProprietario" type="radio" value="true">
			<span >Sim</span>
			<input name="txtProprietario" type="radio" value="false" checked>
		    <span class="style5">Não</span>
		   <%} %> 
      </span></td>
    </tr>
    <%} else{ %>
    <tr>
     <td><div align="right"><span class="style6">Propriet&aacute;rio do Ve&iacute;culo</span></div></td>
     <%if(itemM.getProprietario()==1) {%>
	        <td>
			<span class="style5">Sim</span>
	        </td>
	    <%} else { %> 
		<td>
		<span class="style5">Não</span>
	    </td>		 
    <%} %>
	<%}%>
    </tr>
    
    <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
    <tr>
      <td><div align="right"><span class="style6">Senha pessoal *</span></div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha" size="20" maxlength="6" value='<%=itemM.getSenha()%>' >
      </span></td>
    </tr>
        <tr>
      <td><div align="right"><span class="style6">Confirma senha *</span></div></td>
      <td><span class="style1">
        <input type="password" name="txtSenha2" size="20" maxlength="6" value='<%=itemM.getSenha()%>'>
      </span></td>
    </tr>
    <%} %>
 
  </table>
  
  <p class="style1" align="center">      
     <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
   		<input type="button" name="Salvar" value="Salvar" onClick="Validacampos();">
     <%} %>
     
      <%if(request.getSession().getAttribute("tipoUsuario")=="S"){ %> 
     	<%if (itemM.getAtivo()== 1) {%> 
    		<input type="button" name="Desativar" value="Desativar" onClick="confirmBox()">
    	<%}else {%>
    		<input type="button" name="Ativar" value="Ativar" onClick="confirmBox2()">    		
    	  <%} %>
     <%} %>
     <input type="button" value="Voltar" onClick="location.href='pesquisa_motorista.jsp'">
 
  </p>

</form>
<%}
		
			}
		
	
%>
</div>
</body>
<script language="javascript" type="text/javascript">
function executar(frmcpf,operacao)
{
	frmcpf.operacao.value = operacao;
    
	frmcpf.submit();
}


</script>
<script language="JavaScript">

function confirmBox() {

	motorista = document.frmcpf.txtNome.value;
	
if (confirm("Tem certeza que deseja desativar o motorista " + motorista + " ?")) {

	executar(frmcpf,'excluir');}

}



</script>

<script language="JavaScript">
function confirmBox2() {

	motorista = document.frmcpf.txtNome.value;
	
if (confirm("Tem certeza que deseja ativar o motorista " + motorista + " ?")) {

	executar(frmcpf,'ativar');}

} 	
</script>



</html>


