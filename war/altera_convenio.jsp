<%@page import="modelo.ConvenioTO"%>
<%@page import="modelo.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Empresa</title>
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
	razao = document.frmcpf.txtRazaoSocial.value;
	
	if(razao==""){
			verifica = true;
		}
	if(verifica==true){
		alert('Campo(s) obrigatório(s) em branco');
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

<% if(request.getParameter("codConvenio")!=null){
	
	request.getSession().setAttribute("cod_convenio",Integer.parseInt(request.getParameter("codConvenio").toString()));
	
}

		int codigo = Integer.parseInt(request.getSession().getAttribute("cod_convenio").toString());
		ConvenioTO dadosconvenio = new ConvenioTO();
		dadosconvenio.setCodigo_convenio(codigo);
		Convenio convenio = new Convenio(dadosconvenio);
		List<ConvenioTO> listapassageiros = convenio.consultar(3);
		Iterator<ConvenioTO> iterator = listapassageiros.iterator();
		String SP = "",AC= "",AL= "",AM= "",AP= "",BA= "",CE= "",DF= "",ES= "",GO= "",MA= ""
			,MG= "",MS= "",MT= "",PA= "",PB= "",PE= "",PI= "",PR= "",RJ= "",RN= "",RO= "",RR= "",RS= "",SC= "",SE= "",TO= "";
		if (iterator.hasNext()) {
			ConvenioTO item = iterator.next();
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
			
			System.out.println();
		%>			
     
<body>

<div id="fundo">
<form name="frmcpf" method="post" action="ServletConvenio">
<input type="hidden" value= "alteracao" name="operacao" >
<input type="hidden" name="txtCodconvenio" value="<%=item.getCodigo_convenio()%>">
<input type="hidden" name="txtCnpj" value="<%=item.getCnpj()%>">  
<%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
  <p class="style1" align="center">Alterar Convênio</p>
  <p class="style1" align="center">
  <%}else{ %>
    <p class="style1" align="center">Consultar Convênio</p>
	<p class="style1" align="center">
  <%} %>
   
  <table width="815" height="204" border="0">
  	<tr>
      <td width="166" height="36"><div align="right" class="style6">Identificação </div>
      <div align="right"><span></span></div></td>
      <td width="639"><span>
        <input type="text" size="50" name="txtCodconvenio"  maxlength="100" value='<%=item.getCodigo_convenio()%>' disabled="disabled">
      </span></td>
    </tr>
        <tr>
      <td width="166" height="36"><div align="right" class="style6">Raz&atilde;o social * </div>
      <div align="right"><span class="style6"></span></div></td>
      <td width="639"><span class="style1">
        <input type="text" size="50" name="txtRazaoSocial" maxlength="100" value='<%=item.getRazao_social()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
        <tr>
      <td height="33"><div align="right"><span class="style6">Nome fantasia </span></div></td>
      <td><span class="style1">
        <input type="text" size="50" name ="txtNomeFantasia" maxlength="100" value='<%=item.getNome_fantasia()%>'<%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>   

    <tr>
      <td height="31"><div align="right"><span class="style6">CNPJ *</span></div></td>
      <td><span class="style1">
        <input type="text" name = "txtCnpj" size="25" maxlength="17" value = '<%=item.getCnpj()%>' disabled='disabled'>
      </span></td>
    </tr>
   <tr>
      <td height="27"><div align="right"><span class="style6">DDD</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtDdd" size="10" maxlength="3" value='<%=item.getDdd()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %> >
      </span></td>
     </tr>
    <tr>
      <td height="27"><div align="right"><span class="style6">Telefone</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtTelefone" size="20" maxlength="9" value='<%=item.getTelefone()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %> >
      </span></td>
     </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Logradouro*</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRua" size="50" maxlength="100" value='<%=item.getRua()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Numero*</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNumero" size="10" maxlength="100" onkeypress='return SomenteNumero(event)' value='<%=item.getNumero()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Complemento*</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtComplemento" size="50" maxlength="100" value='<%=item.getComplemento()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Bairro*</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtBairro" size="30" maxlength="100" value='<%=item.getBairro()%>'<%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %> >
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Cidade*</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCidade" size="30" maxlength="100" value='<%=item.getCidade()%>'<%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Estado*</span></div></td>
      <td><span class="style1">
         <select id="txtEstado" name="txtEstado" style="width: 50px;" <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
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
    <tr>
      <td height="28"><div align="right"><span class="style6">CEP*</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCep" size="15" maxlength="100" value='<%=item.getCep() %>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %> >
      </span></td>
    </tr>
     <tr>
      <td height="27"><div align="right"><span class="style6">Valor do Limite  *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtValorLimite" size="15" maxlength="9"  value='<%=item.getValor_limite()%>' <%if (request.getSession().getAttribute("tipoUsuario")!= "S"){%>disabled="disabled" <%} %>>
      </span></td>
    </tr>
	<tr>
      <td height="27"><div align="right"><span class="style6">Valor Gasto </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtValorGasto" size="15" maxlength="9"  value='<%=item.getValor_gasto()%>' disabled="disabled" >
        <input type="submit" name="Submit" value="Zerar valor gasto" onClick="executar(this.form,'zerarValor')">
      </span></td>
    </tr>
      	
	 	
  </table>
  
  <p class="style1" align="center">
    
   
       <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
        <% if(request.getSession().getAttribute("txtAtivo")=="false"){ %> 
              
          <%}else{%>
                 <input type="button"  value="Salvar" onClick="Validacampos();" >
           <%   } %>
         <%} %>
    &nbsp;
    <%if (request.getSession().getAttribute("tipoUsuario")== "S"){ %>
    
        	<%if (item.getAtivo()== 1) {%> 
    		<input type="button" name="Desativar" value="Desativar" onClick="confirmBox()">
    	<%}else {%><input type="button" name="Ativar" value="Ativar" onClick="confirmBox2()">
    		
    	
     <%} %>
    <%} %>
    &nbsp;
	<input type="button" name="passageiro" value="Incluir Passageiro" onClick="executar(this.form,'incluirpassageiro')">
&nbsp;
<input type="button"  value="Listar passageiros" onClick="executar(this.form,'listarpassageiro')">
<input type="button" value="Voltar" onClick="location.href='pesquisa_convenio.jsp'">
</p>

</form>
<% } 
	%>
</body>


<script language="JavaScript">

function confirmBox() {
	empresa = document.frmcpf.txtRazaoSocial.value;
if (confirm("Tem certeza que deseja desativar o convênio da empresa " + empresa + " ?")) {

	executar(frmcpf,'excluir');}

}

</script>

<script language="JavaScript">
function confirmBox2() {

	empresa = document.frmcpf.txtRazaoSocial.value;
	
if (confirm("Tem certeza que deseja ativar o convênio da empresa " + empresa + " ?")) {

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


