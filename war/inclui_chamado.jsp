<%@page import="modelo.PassageiroTO"%>
<%@page import="modelo.Passageiro"%>
<%@page import="modelo.ConvenioTO"%>
<%@page import="modelo.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<script>
function Validacampos(){
	
	var verifica = false;
	rua = document.frmcpf.txtRuaOrigem.value;
	numero = document.frmcpf.txtNumeroOrigem.value;
	cidade = document.frmcpf.txtCidadeOrigem.value;
    rua2 = document.frmcpf.txtRuaDestino.value;
    numero2 = document.frmcpf.txtNumeroDestino.value;
    cidade2 = document.frmcpf.txtCidadeDestino.value;    


	if(rua==""){
			verifica = true;
		}

	if(verifica!=true && numero==""){
			verifica = true;
	}
	if(verifica!=true && numero2==""){
		verifica = true;
}
	if(verifica!=true && rua2==""){
		verifica = true;
}
	if(verifica!=true && cidade2==""){
		verifica = true;
}
	if(verifica!=true && cidade==""){
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
</style></head>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletChamado_Cliente"  onSubmit="">
<input type="hidden" name="operacao" value="cadastro">
  <p class="style1" align="center">Incluir  Chamado</p>
  
  <p class="style1" align = "center">Passageiro</p>
  <p class="style1" align="center">
  <table width="706" height="183" border="0">
      <tr>
        <td width="157" height="29" class="style6"><div align="right">Nome do passageiro </div></td>
      <td width="539"><span class="style1">
      		   	<input type="hidden" name="nome_passageiro" value="<%=request.getSession().getAttribute("txtNome")%>">      
      		<input type="text" name="txtNomePassageiro" size="15" maxlength="9" value= '<%=request.getSession().getAttribute("txtNome")%>' onKeyPress='return SomenteNumero(event)' disabled="disabled">
      
      </span>
    </tr>
    <tr>
      <td width="157" height="29" class="style6"><div align="right">C&oacute;digo do passageiro </div></td>
      <td width="539"><span class="style1">
      		<input type="hidden" name="codigo_passageiro" value="<%=request.getSession().getAttribute("txtCodigoPassageiro")%>">      
      		<input type="text" name="txtCodPassageiro" size="15" maxlength="9" value='<%=request.getSession().getAttribute("txtCodigoPassageiro")%>' onKeyPress='return SomenteNumero(event)' disabled="disabled">
      
      </span>
    </tr>
 <%
 
 		PassageiroTO passageiro = new PassageiroTO();
        passageiro.setCodigo_passageiro(Integer.parseInt(request.getSession().getAttribute("txtCodigoPassageiro").toString()));
        Passageiro passageiroSel = new Passageiro(passageiro);
        List<PassageiroTO> lista = passageiroSel.consultar(3);
        Iterator<PassageiroTO> iterator = lista.iterator();
        
  if (iterator.hasNext()) {
	PassageiroTO item = iterator.next();
 
      if (item.getConveniado()==1){
         
         ConvenioTO convenio = new ConvenioTO();
         convenio.setCodigo_convenio(item.getCodigo_convenio());
         Convenio convenioSel = new Convenio(convenio);
         List<ConvenioTO> listaC = convenioSel.consultar(3);
         Iterator<ConvenioTO> iteratorC = listaC.iterator();
         
         if (iteratorC.hasNext()) {
           ConvenioTO itemC = iteratorC.next();
           float valorLimite = Float.parseFloat(itemC.getValor_limite());
           float valorGasto = Float.parseFloat(itemC.getValor_gasto());
           
           float valorRestante = valorLimite - valorGasto;
           int ativo = itemC.getAtivo();
           
          if(ativo>0){
           if (valorRestante>0){
           %> 
             <tr>
			      <td width="157" height="29" class="style6"><div align="right">
			        <input type="checkbox" name="checkConvenio" value="S" <%=request.getSession().getAttribute("checkConvenio")%>>
			      </div></td>
			      <td width="539">Conv&ecirc;nio</td>
			 </tr>
			<%} %>  
			 <tr>
                <td height="30" colspan="2"><div align="center" class="style11">
                  <p>O convênio do passageiro selecionado possui R$ <%=valorRestante%> restantes</p>
                </div></td>
             </tr>
         <%}
         }
     }   
  }%>   
   
         

    <tr>
      <td height="24" colspan="2" class="style1"><div align="center" class="style12">
        <p>Endere&ccedil;o de Origem </p>
      </div></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">CEP </span></div></td>
      <td><span class="style1">
      		<input type="text" name="txtCepOrigem" size="15" maxlength="100" value='<%=request.getSession().getAttribute("txtCep")%>'>
      		<input type="submit" name="Submit" value="Busca" onClick="executar(this.form,'consultaEnderecoOrigem')">
      	  </span>
     </td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Logradouro *</span></div></td>
      <td><span class="style1">
      		<input type="text" name="txtRuaOrigem" size="50" maxlength="100" value='<%=request.getSession().getAttribute("txtRua")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Numero *</span></div></td>
      <td><span class="style1">
          <input type="text" name="txtNumeroOrigem" size="10" maxlength="10" value='<%=request.getSession().getAttribute("txtNumero")%>'>
      </span></td>
    </tr>
    <tr>
      <td height="30"><div align="right"><span class="style6">Complemento </span></div></td>
      <td><span class="style1">
      		<input type="text" name="txtComplementoOrigem" size="50" maxlength="50" value='<%=request.getSession().getAttribute("txtComplementoOrigem")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Bairro </span></div></td>
      <td><span class="style1">
      		<input type="text" name="txtBairroOrigem" size="30" maxlength="20" value='<%=request.getSession().getAttribute("txtBairro")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Cidade *</span></div></td>
      <td><span class="style1"> 
      		<input type="text" name="txtCidadeOrigem" size="30" maxlength="30" value='<%=request.getSession().getAttribute("txtCidade")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Estado *</span></div></td>
      <td><span class="style1">
	         <select id="txtEstado" name="txtEstadoOrigem" style="width: 50px;">
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
    <tr>
      <td height="24" colspan="2" class="style1"><div align="center" class="style12">
        <p>Endere&ccedil;o de Destino </p>
      </div></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Cep </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCepDestino" size="15" maxlength="15" value='<%=request.getSession().getAttribute("cep_destino")%>'>
        <input type="submit" name="Submit2" value="Busca" onClick="executar(this.form,'consultaEnderecoDestino')">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Logradouro *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRuaDestino" size="50" maxlength="100" value='<%=request.getSession().getAttribute("rua_destino")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Numero *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNumeroDestino" size="10" maxlength="10]" value='<%=request.getSession().getAttribute("numero_destino")%>'>
      </span></td>
    </tr>
    <tr>
      <td height="30"><div align="right"><span class="style6">Complemento </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtComplementoDestino" size="50" maxlength="50" value='<%=request.getSession().getAttribute("complemento_destino")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Bairro </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtBairroDestino" size="30" maxlength="20" value='<%=request.getSession().getAttribute("bairro_destino")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Cidade *</span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCidadeDestino" size="30" maxlength="30" value='<%=request.getSession().getAttribute("cidade_destino")%>'>
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Estado *</span></div></td>
      <td><span class="style1">
         <select id="txtEstado" name="txtEstadoDestino" style="width: 50px;">
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
    <input type="button" value="Salvar" name="Salvar" onClick="Validacampos();">
    <input type="button" name="Submit" value="Voltar" onClick="location.href='<%=request.getSession().getAttribute("pagina_passageiro")%>'">
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


