<%@page import="modelo.PassageiroTO"%>
<%@page import="modelo.Passageiro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<style type="text/css">  
  @import url("css_tabela.css");  
</style>
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

function Validacampos(frmcpf,operacao){
	
	var verifica = false;
	nome = document.frmcpf.txtNome.value;
	telefone = document.frmcpf.txtTelefone.value;
	ddd = document.frmcpf.txtDdd.value;
	rua = document.frmcpf.txtRua.value;
	numero = document.frmcpf.txtNumero.value;
	cidade = document.frmcpf.txtCidade.value;
	cpf = document.frmcpf.txtCpf.value;
        


	if(nome==""){
			verifica = true;
		}
	if(verifica!=true && ddd==""){
		verifica = true;
	}
	if(verifica!=true && telefone==""){
			verifica = true;
		}
	if(verifica!=true && rua==""){
			verifica = true;
		}
	if(verifica!=true && numero==""){
			verifica = true;
	}
	if(verifica!=true && cpf==""){
		verifica = true;
}
	if(verifica!=true && cidade==""){
		verifica = true;
	}

	if(verifica==true){
		alert('Campo(s) obrigatório(s) em branco');
		}
	else{
		executar(frmcpf,operacao);
		}
				
}

</script>
</head>

<%
	
	if(request.getParameter("cod_passageiro")==null){
	}else{
		int codigo = Integer.parseInt(request.getParameter("cod_passageiro").toString());
		PassageiroTO dadospassageiro = new PassageiroTO();
		dadospassageiro.setCodigo_passageiro(codigo);
		Passageiro passageiro = new Passageiro(dadospassageiro);
		List<PassageiroTO> listapassageiros = passageiro.consultar(3);
		Iterator<PassageiroTO> iterator = listapassageiros.iterator();
		String SP = "",AC= "",AL= "",AM= "",AP= "",BA= "",CE= "",DF= "",ES= "",GO= "",MA= ""
		,MG= "",MS= "",MT= "",PA= "",PB= "",PE= "",PI= "",PR= "",RJ= "",RN= "",RO= "",RR= "",RS= "",SC= "",SE= "",TO= "";  
		if (iterator.hasNext()) {
			PassageiroTO item = iterator.next(); 
			if(item.getEstado().equals("SP")) SP="selected=selected"; 
			if(item.getEstado().equals("AC")) AC="selected=selected"; 
			if(item.getEstado().equals("AL")) AL="selected=selected"; 
			if(item.getEstado().equals("AM")) AM="selected=selected"; 
			if(item.getEstado().equals("AP")) AP="selected=selected"; 
			if(item.getEstado().equals("BA")) BA="selected=selected"; 
			if(item.getEstado().equals("CE")) CE="selected=selected"; 
			if(item.getEstado().equals("DF")) DF="selected=selected"; 
			if(item.getEstado().equals("ES")) ES="selected=selected";
			if(item.getEstado().equals("GO")) GO="selected=selected"; 
			if(item.getEstado().equals("MA")) MA="selected=selected"; 
			if(item.getEstado().equals("MG")) MG="selected=selected"; 
			if(item.getEstado().equals("MS")) MS="selected=selected"; 
			if(item.getEstado().equals("MT")) MT="selected=selected"; 
			if(item.getEstado().equals("PA")) PA="selected=selected"; 
			if(item.getEstado().equals("PB")) PB="selected=selected"; 
			if(item.getEstado().equals("PE")) PE="selected=selected"; 
			if(item.getEstado().equals("PI")) PI="selected=selected";
			if(item.getEstado().equals("PR")) PR="selected=selected";
			if(item.getEstado().equals("RJ")) RJ="selected=selected"; 
			if(item.getEstado().equals("RN")) RN="selected=selected";
			if(item.getEstado().equals("RO")) RO="selected=selected";
			if(item.getEstado().equals("RR")) RR="selected=selected";
			if(item.getEstado().equals("RS")) RS="selected=selected"; 
			if(item.getEstado().equals("SC")) SC="selected=selected"; 
			if(item.getEstado().equals("SE")) SE="selected=selected"; 
			if(item.getEstado().equals("TO")) TO="selected=selected";		
			%>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletPassageiro" > 
  <p class="style1" align="center">Alterar Passageiro</p>
  <p class="style1" align="center">
  <input type="hidden" name="operacao" value="alteracao">
  <input type="hidden" name="txtCodpassageiro" value="<%=item.getCodigo_passageiro()%>">  
  <table width="328" height="281" border="0">
  <tr>
      <td><div align="right"><span>Identificação</span></div></td>
      <td><span>
        <input type="text"  size="10" maxlength="11" value='<%=item.getCodigo_passageiro()%>' disabled="disabled" >
      </span></td>
    </tr>
        <tr>
      <td><div align="right"><span>Nome *</span></div></td>
      <td><span>
        <input type="text" name="txtNome" size="50" value='<%=item.getNome()%>' maxlength="50">
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>CPF *</span></div></td>
      <td><span>
        <input type="text" name="txtCpf" size="20" maxlength="11" value='<%=item.getCpf()%>'  disabled="disabled" >
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>DDD *</span></div></td>
      <td><span>
        <input type="text" name="txtDdd"  size="10" maxlength="3" value='<%=item.getDdd() %>' >
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>Telefone *</span></div></td>
      <td><span>
        <input type="text" name="txtTelefone"  size="20" maxlength="9" value='<%=item.getTelefone() %>' >
      </span></td>
    </tr>

    <tr>
      <td ><div align="right"><span>Código do Convênio</span></div></td>
      <td><span>
        <input type="text" name="txtCodConvenio" size="10" maxlength="100" value='<%=item.getCodigo_convenio()%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style6">Conveniado</span></div></td>
      <td><span>
            <%if (item.getConveniado()== 1) {%>
	          	<input name="txtConveniado" type="radio" value="true"checked>
				<span>Sim</span>
				<input name="txtConveniado" type="radio" value="false" >
			    <span>Não</span>
          	<%}else{ %>
          		<input name="txtConveniado" type="radio" value="true">
				<span>Sim</span>
          		<input name="txtConveniado" type="radio" value="false" checked>
				<span>Não</span>
          	<%}%>	
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>Logradouro *</span></div></td>
      <td><span>
        <input type="text" name="txtRua" size="50" value = '<%=item.getRua() %>'maxlength="100">
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>N&ordm; *</span></div></td>
      <td><span>
        <input type="text" name="txtNumero" size="10" maxlength="5" value='<%=item.getNumero()%>' >
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>Complemento </span></div></td>
      <td><span>
        <input type="text" name="txtComplemento" value='<%=item.getComplemento()%>' size="50" maxlength="100">
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style6">CEP</span></div></td>
      <td><span>
        <input type="text" name="txtCep" size="15" maxlength="9" value ='<%=item.getCep()%>' >
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>Bairro</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtBairro" size="30" value="<%=item.getBairro()%>" maxlength="40">
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span>Cidade *</span></div></td>
      <td><span>
        <input type="text" name="txtCidade" size="30" maxlength="30" value ='<%=item.getCidade()%>'>
      </span></td>
    </tr>
     <tr>
      <td><div align="right"><span>Estado *</span></div></td>
      <td><span>
        <select id="txtEstado" name="txtEstado" style="width: 50px;">
        	<option value="SP" <%=SP%>>SP</option> 
	        <option value="AC" <%=AC%>>AC</option>  
			<option value="AL" <%=AL%>>AL</option>  
			<option value="AM" <%=AM%>>AM</option>  
			<option value="AP" <%=AP%>>AP</option>  
			<option value="BA" <%=BA%>>BA</option>  
			<option value="CE" <%=CE%>>CE</option>  
			<option value="DF" <%=DF%>>DF</option>  
			<option value="ES" <%=ES%>>ES</option>  
			<option value="GO" <%=GO%>>GO</option>  
			<option value="MA" <%=MA%>>MA</option>  
			<option value="MG" <%=MG%>>MG</option>  
			<option value="MS" <%=MS%>>MS</option>  
			<option value="MT" <%=MT%>>MT</option>  
			<option value="PA" <%=PA%>>PA</option>  
			<option value="PB" <%=PB%>>PB</option>  
			<option value="PE" <%=PE%>>PE</option>  
			<option value="PI" <%=PI%>>PI</option>  
			<option value="PR" <%=PR%>>PR</option>  
			<option value="RJ" <%=RJ%>>RJ</option>  
			<option value="RN" <%=RN%>>RN</option>  
			<option value="RO" <%=RO%>>RO</option>  
			<option value="RR" <%=RR%>>RR</option>  
			<option value="RS" <%=RS%>>RS</option>  
			<option value="SC" <%=SC%>>SC</option>  
			<option value="SE" <%=SE%>>SE</option>  			 
			<option value="TO" <%=TO%>>TO</option>  
        </select>
      </span></td>
    </tr>

  </table>
   
  <p class="style1" align="center">
     
	
	<input type="button" name="Salvar" value="Salvar" onClick="Validacampos(this.form,'alteracao');" >
	 	<%if (item.getAtivo()== 1) {%> 
		 	<input type="button" name="Desativar" value="Desativar" onClick="confirmBox();">
	  		</p>
	  		<p class="style1" align="center">
		 		  <input type="button" name="incluir_end_padrao" value="Incluir com end. padrão" onClick="Validacampos(this.form,'chamadoEndPadraoAlterar')">
		  &nbsp;
		  <input type="button" name="incluir_end_alternativo" value="Incluir end. alternativo" onClick="Validacampos(this.form,'chamadoEndAlternativoAlterar')">
		 	
		    	<%}else {%>
		    	<input type="button" name="Ativar" value="Ativar" onClick="confirmBox2()">
	    		
	   		 	<%} %>
	   		 	<input type="button" name="Submit" value="Voltar" onClick="location.href='pesquisa_passageiro.jsp'">
	     <%} %>
      <%} %>
&nbsp;
	
&nbsp;  </p>
</form>


</div>
</body>
<script language="JavaScript">

function confirmBox() {

	passageiro = document.frmcpf.txtNome.value;
	
if (confirm("Tem certeza que deseja desativar o passageiro " + passageiro + " ?")) {

	executar(frmcpf,'excluir');}

}

</script>

<script language="JavaScript">
function confirmBox2() {

	passageiro = document.frmcpf.txtNome.value;
	
if (confirm("Tem certeza que deseja ativar o passageiro " + passageiro + " ?")) {

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


