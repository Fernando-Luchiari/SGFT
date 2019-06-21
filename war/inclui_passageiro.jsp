<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Passageiro</title>
<%if (request.getParameter("inicio")!=null) {

request.getSession().setAttribute("nome_passageiro", "");
request.getSession().setAttribute("cpf_passageiro", "");
request.getSession().setAttribute("rua_passageiro", "");
request.getSession().setAttribute("numero_passageiro", "");
request.getSession().setAttribute("bairro_passageiro", "");
request.getSession().setAttribute("cidade_passageiro", "");
request.getSession().setAttribute("estado_passageiro", "");
request.getSession().setAttribute("cep_passageiro", "");
request.getSession().setAttribute("telefone_passageiro", "");
request.getSession().setAttribute("ddd_passageiro", "");
request.getSession().setAttribute("complemento_passageiro", "");
request.getSession().setAttribute("codconvenio","");

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

function Validacampos(frmcpf,operacao){
	
	var verifica = false;
	nome = document.frmcpf.txtNome.value;
	cpf = document.frmcpf.txtCpf.value;
	ddd = document.frmcpf.txtDdd.value;
	telefone = document.frmcpf.txtTelefone.value;
	rua = document.frmcpf.txtRua.value;
	numero = document.frmcpf.txtNumero.value;
	cidade = document.frmcpf.txtCidade.value;
        


	if(nome==""){
			verifica = true;
		}
	if(verifica!=true && cpf==""){
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
	if(verifica!=true && cidade==""){
		verifica = true;
}

	if(verifica==true){
		alert('Campo(s) obrigatório(s) em branco');
		}
	else{
		Valida(frmcpf,operacao);
		}
				
}
function Valida(frmcpf,operacao){

		if (Validacpf()){
			frmcpf.operacao.value = operacao;
			frmcpf.submit();
		}
	
}

function Validacpf(){
	
	if(document.frmcpf.txtCpf.value!=""){

		if (vercpf(document.frmcpf.txtCpf.value)) 
		{
			return true
		}else{
			errors="1";
			if (errors) 
				alert('CPF Inválido');
			return false;
		}
	}
}
function vercpf (txtCpf) 
{
		if (txtCpf.length != 11 || txtCpf == "00000000000" || txtCpf == "11111111111" || txtCpf == "22222222222" || txtCpf == "33333333333" || txtCpf == "44444444444" || txtCpf == "55555555555" || txtCpf == "66666666666" || txtCpf == "77777777777" || txtCpf == "88888888888" || txtCpf == "99999999999")
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

			
</script>

<style type="text/css">  
  @import url("css_tabela.css");  
</style>
</head>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletPassageiro" >
<input type="hidden" name="operacao" value="cadastro"> 

  <p class="style1" align="center">Incluir Passageiro </p>
  <p class="style1" align="center">
  <table width="328" height="281" border="0">
       <tr>
      <td><div align="right"><span >Nome *</span></div></td>
      <td><span >
        <input type="text" name="txtNome" size="50" maxlength="50" value='<%=request.getSession().getAttribute("nome_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >CPF *</span></div></td>
      <td><span >
        <input type="text" name="txtCpf" size="20" maxlength="11" value='<%=request.getSession().getAttribute("cpf_passageiro")%>' onkeypress='return SomenteNumero(event)'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >DDD *</span></div></td>
      <td><span >
        <input type="text" name="txtDdd"  size="10" maxlength="3" value='<%=request.getSession().getAttribute("ddd_passageiro")%>'>
      </span></td>
    </tr>
	<tr>
      <td><div align="right"><span >Telefone *</span></div></td>
      <td><span >
        <input type="text" name="txtTelefone"  size="20" maxlength="9" value='<%=request.getSession().getAttribute("telefone_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
    	<td><div align="right"><span>Código do Convênio</span></div></td>
    	<td><span>
    	<input type="hidden" name="codigo_convenio" value="<%=request.getSession().getAttribute("codconvenio")%>">  
    	<input type="text" name="txtCodConvenio" size="10" maxlength="100" value= '<%=request.getSession().getAttribute("codconvenio")%>' >
    	</span></td>
    </tr>
    <tr>
      <td><div align="right"><span >CEP </span></div></td>
      <td><span >
        <input type="text" name="txtCep" size="20" maxlength="10" onkeypress='return SomenteNumero(event)' value='<%=request.getSession().getAttribute("cep_passageiro")%>'>
        <input type="button" name="Buscar" value="Buscar" onClick="executar(this.form,'consultaEndereco')">
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >Logradouro *</span></div></td>
      <td><span >
        <input type="text" name="txtRua" size="50" maxlength="100" value='<%=request.getSession().getAttribute("rua_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >N&ordm; *</span></div></td>
      <td><span >
        <input type="text" name="txtNumero" size="10" maxlength="5" onkeypress='' value='<%=request.getSession().getAttribute("numero_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
	<td><div align="right"><span >Complemento </span></div></td>
      <td><span >
        <input type="text" name="txtComplemento" size="50" maxlength="100" onkeypress='' value ='<%=request.getSession().getAttribute("complemento_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >Bairro</span></div></td>
      <td><span >
        <input type="text" name="txtBairro" size="30" maxlength="40" value='<%=request.getSession().getAttribute("bairro_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >Cidade *</span></div></td>
      <td><span >
        <input type="text" name="txtCidade" size="30" maxlength="30" value ='<%=request.getSession().getAttribute("cidade_passageiro")%>'>
      </span></td>
    </tr>
    <tr>
      <td><div align="right"><span >Estado *</span></div></td>
      <td><span >
        <select id="txtEstado" name="txtEstado" style="width: 50px;" >
        	<option value="SP">SP</option> 
	        <option value="AC">AC</option>  
			<option value="AL">AL</option>  
			<option value="AM">AM</option>  
			<option value="AP">AP</option>  
			<option value="BA">BA</option>  
			<option value="CE">CE</option>  
			<option value="DF">DF</option>  
			<option value="ES">ES</option>  
			<option value="GO">GO</option>  
			<option value="MA">MA</option>  
			<option value="MG">MG</option>  
			<option value="MS">MS</option>  
			<option value="MT">MT</option>  
			<option value="PA">PA</option>  
			<option value="PB">PB</option>  
			<option value="PE">PE</option>  
			<option value="PI">PI</option>  
			<option value="PR">PR</option>  
			<option value="RJ">RJ</option>  
			<option value="RN">RN</option>  
			<option value="RO">RO</option>  
			<option value="RR">RR</option>  
			<option value="RS">RS</option>  
			<option value="SC">SC</option>  
			<option value="SE">SE</option>  			 
			<option value="TO">TO</option>  
        </select>
      </span></td>
    </tr>
  </table>
  
  <p class="style1" align="center">    
    <input type="button" name="Salvar" value="Salvar" onClick="Validacampos(this.form,'cadastro');">
  	<input type="button" name="incluir_end_padrao" value="Incluir com end. padrão" onClick="Validacampos(this.form,'chamadoEndPadraoIncluir');">
   	<input type="button" name="incluir_end_alternativo" value="Incluir com end. alternativo" onClick="Validacampos(this.form,'chamadoEndAlternativoIncluir');">
  	<input type="button" name="Submit" value="Voltar" onClick="location.href='pesquisa_passageiro.jsp'">
  </p>
</form>

</div>
</body>

<script language="javascript" type="text/javascript">
function executar(frmcpf,operacao)
{
	frmcpf.operacao.value = operacao;
    
	frmcpf.submit();
}

</script>



</html>


