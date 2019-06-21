<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Empresa</title>
<% if (request.getParameter("inicio")!=null){
	
	request.getSession().setAttribute("razaoSocial", "");
	request.getSession().setAttribute("nomeFantasia", "");
	request.getSession().setAttribute("cnpj_convenio", "");
	request.getSession().setAttribute("cidade_convenio", "");
	request.getSession().setAttribute("estado_convenio", "");
	request.getSession().setAttribute("numero_convenio", "");
	request.getSession().setAttribute("rua_convenio", "");
	request.getSession().setAttribute("bairro_convenio", "");
	request.getSession().setAttribute("cep_convenio", "");
	request.getSession().setAttribute("ddd_convenio", "");
	request.getSession().setAttribute("telefone_convenio", "");
	request.getSession().setAttribute("complemento_convenio", "");
	request.getSession().setAttribute("valor_limite", "");
		
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
	razao = document.frmcpf.txtRazaoSocial.value;
	cnpj = document.frmcpf.txtCnpj.value;
	
        
	if(razao==""){
			verifica = true;
		}
	if(verifica!=true && cnpj==""){
			verifica = true;
		}
	
	if(verifica==true){
		alert('Campo(s) obrigatório(s) em branco');
		}
	else{
		ValidaCNPJ();
		
		}
				
}

function ValidaCNPJ() {
	cnpj = document.frmcpf.txtCnpj.value;
	  var i = 0;
	  var l = 0;
	  var strNum = "";
	  var strMul = "6543298765432"; 
	 var character = "";  
	var iValido = 1;  
	var iSoma = 0; 
	 var strNum_base = "";
	  var iLenNum_base = 0;
	  var iLenMul = 0; 
	 var iSoma = 0; 
	 var strNum_base = 0;
	  var iLenNum_base = 0;

	  l = cnpj.length;  
	for (i = 0; i < l; i++) { 
	       caracter = cnpj.substring(i,i+1)  
	      if ((caracter >= '0') && (caracter <= '9'))   
	        strNum = strNum + caracter;  };


	 strNum_base = strNum.substring(0,12); 
	 iLenNum_base = strNum_base.length - 1; 
	 iLenMul = strMul.length - 1;  
	for(i = 0;i < 12; i++)
	        iSoma = iSoma +  parseInt(strNum_base.substring((iLenNum_base-i),(iLenNum_base-i)+1),10) *  parseInt(strMul.substring((iLenMul-i),(iLenMul-i)+1),10);

	  iSoma = 11 - (iSoma - Math.floor(iSoma/11) * 11);

	  if(iSoma == 11 || iSoma == 10)   
	     iSoma = 0; 
	 strNum_base = strNum_base + iSoma; 
	 iSoma = 0;  iLenNum_base = strNum_base.length - 1;
	 for(i = 0; i < 13; i++)     
	   iSoma = iSoma +  parseInt(strNum_base.substring((iLenNum_base-i),(iLenNum_base-i)+1),10) *  parseInt(strMul.substring((iLenMul-i),(iLenMul-i)+1),10);

	 iSoma = 11 - (iSoma - Math.floor(iSoma/11) * 11); 
	 if(iSoma == 11 || iSoma == 10)       
	 iSoma = 0;
	  strNum_base = strNum_base + iSoma;  
	if(strNum != strNum_base)    {
	    return alert("CNPJ inválido."); 
		 return (true);
	}
	 
	 else {

		  frmcpf.submit();
	 }
}

</script>

<style type="text/css">  
  @import url("css_tabela.css");  
</style></head>
 <%
 String SP = "",AC= "",AL= "",AM= "",AP= "",BA= "",CE= "",DF= "",ES= "",GO= "",MA= ""
		,MG= "",MS= "",MT= "",PA= "",PB= "",PE= "",PI= "",PR= "",RJ= "",RN= "",RO= "",RR= "",RS= "",SC= "",SE= "",TO= "";
 	if(request.getSession().getAttribute("estado")!= null){
		 	if(request.getSession().getAttribute("estado_convenio").toString().equals("SP")) SP="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("AC")) AC="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("AL")) AL="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("AM")) AM="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("AP")) AP="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("BA")) BA="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("CE")) CE="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("DF")) DF="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("ES")) ES="selected=selected";
			if(request.getSession().getAttribute("estado_convenio").toString().equals("GO")) GO="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("MA")) MA="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("MG")) MG="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("MS")) MS="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("MT")) MT="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("PA")) PA="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("PB")) PB="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("PE")) PE="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("PI")) PI="selected=selected";
			if(request.getSession().getAttribute("estado_convenio").toString().equals("PR")) PR="selected=selected";
			if(request.getSession().getAttribute("estado_convenio").toString().equals("RJ")) RJ="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("RN")) RN="selected=selected";
			if(request.getSession().getAttribute("estado_convenio").toString().equals("RO")) RO="selected=selected";
			if(request.getSession().getAttribute("estado_convenio").toString().equals("RR")) RR="selected=selected";
			if(request.getSession().getAttribute("estado_convenio").toString().equals("RS")) RS="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("SC")) SC="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("SE")) SE="selected=selected"; 
			if(request.getSession().getAttribute("estado_convenio").toString().equals("TO")) TO="selected=selected";
 	}
 %>
<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletConvenio" >
<input type="hidden" name="operacao" value="cadastro">
  <p class="style1" align="center">Incluir Convênio</p>
  <p class="style1" align="center">
  <table width="815" height="204" border="0">

    <tr>
      <td width="166" height="36"><div align="right" class="style6">Raz&atilde;o social *</div>
      <div align="right"><span class="style6"></span></div></td>
      <td width="639"><span class="style1">
        	<input type="text" name="txtRazaoSocial" size="50" maxlength="100" value='<%=request.getSession().getAttribute("razaoSocial") %>'>
      </span></td>
    </tr>
  	<tr>
      <td height="33"><div align="right"><span class="style6">Nome fantasia</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtNomeFantasia" size="50" maxlength="100" value='<%=request.getSession().getAttribute("nomeFantasia") %>'>
      </span></td>
    </tr>
    <tr>
      <td height="31"><div align="right"><span class="style6">CNPJ *</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtCnpj" size="25" maxlength="14"  onkeypress='return SomenteNumero(event)' value='<%=request.getSession().getAttribute("cnpj_convenio")%>'>
      </span></td>
    </tr> 
	<tr>
      <td height="27"><div align="right"><span class="style6">DDD</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtDdd" size="10" maxlength="3" value='<%=request.getSession().getAttribute("ddd_convenio")%>'>
      </span></td>
    </tr>   
    <tr>
      <td height="27"><div align="right"><span class="style6">Telefone</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtTelefone" size="20" maxlength="9" value='<%=request.getSession().getAttribute("telefone_convenio")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="28"><div align="right"><span class="style6">CEP</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtCep" size="15" maxlength="100" value='<%=request.getSession().getAttribute("cep_convenio") %>'>
            <input type="submit" name="Submit" value="Busca" onClick="executar(this.form,'consultaEndereco')">
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Logradouro</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtRua" size="50" maxlength="100" value='<%=request.getSession().getAttribute("rua_convenio")%>'>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Numero</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtNumero" size="10" maxlength="100"   value='<%=request.getSession().getAttribute("numero_convenio")%>' >
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Complemento</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtComplemento" size="50" maxlength="100" value='<%=request.getSession().getAttribute("complemento_convenio") %>'>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Bairro</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtBairro" size="30" maxlength="100" value='<%=request.getSession().getAttribute("bairro_convenio") %>'>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Cidade</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtCidade" size="30" maxlength="100" value='<%=request.getSession().getAttribute("cidade_convenio")%>'>
      </span></td>
    </tr>
    <tr>
      <td height="28"><div align="right"><span class="style6">Estado</span></div></td>
      <td><span class="style1">
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
    <tr>
      <td height="27"><div align="right"><span class="style6">Valor de Limite  *</span></div></td>
      <td><span class="style1">
        	<input type="text" name="txtValorLimite" size="15" maxlength="9"  value='<%=request.getSession().getAttribute("valor_limite")%>' >
      </span></td>
    </tr>
  </table>
 
  	<p class="style1" align="center">
       	<input type="button" name="Salvar" value="Salvar" onClick="Validacampos();" >
       	<input type="button" name="Submit2" value="Voltar" onClick="location.href='pesquisa_convenio.jsp'">
	</p>
</form>

</div>
</body>
<script language="javascript" type="text/javascript">
function executar(form,operacao)
{
	form.operacao.value = operacao;
    
	form.submit();
}


</script>
</html>


