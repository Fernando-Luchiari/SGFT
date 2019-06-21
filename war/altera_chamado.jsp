<%@page import="modelo.Chamado_ClienteTO"%>
<%@page import="modelo.Chamado_Envio"%>
<%@page import="modelo.Chamado_EnvioTO"%>
<%@page import="modelo.Chamado_Cliente"%>
<%@page import="modelo.Chamado_FinalTO"%>
<%@page import="modelo.Chamado_Final"%>
<%@page import="modelo.MotoristaTO"%>
<%@page import="modelo.Motorista"%>
<%@page import="modelo.FuncionarioTO"%>
<%@page import="modelo.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Chamado</title>
<%
	
	if(request.getParameter("cod_chamado")==null){
	}else{
		int codigo = Integer.parseInt(request.getParameter("cod_chamado").toString());
		Chamado_ClienteTO dadoschamado = new Chamado_ClienteTO();
		dadoschamado.setCodigo_chamado(codigo);
		Chamado_Cliente chamado_cliente = new Chamado_Cliente(dadoschamado);
		List<Chamado_ClienteTO> listachamado = chamado_cliente.consultar(2);
		Iterator<Chamado_ClienteTO> iterator = listachamado.iterator();
		
	    Chamado_EnvioTO dadosEnvio = new Chamado_EnvioTO();
	    dadosEnvio.setCodigo_chamado(codigo);
	    Chamado_Envio chamadoEnvio = new Chamado_Envio(dadosEnvio);
	    List<Chamado_EnvioTO> listaEnvio = chamadoEnvio.consultarUtimoEnvio(2);
	    Iterator<Chamado_EnvioTO> iteratorEnvio = listaEnvio.iterator();
	    
	    Chamado_FinalTO dadosFinal = new Chamado_FinalTO();
	    dadosFinal.setCodigo_chamado(codigo);
	    Chamado_Final chamadoFinal = new Chamado_Final(dadosFinal);
	    List<Chamado_FinalTO> listaFinal = chamadoFinal.consultar(1);
	    Iterator<Chamado_FinalTO> iteratorFinal = listaFinal.iterator();

	    
		
		if (iterator.hasNext()) {
			Chamado_ClienteTO item = iterator.next(); 
			
			System.out.println(item.getConvenio());
			
			%>


<style type="text/css">  
  @import url("css_tabela.css");  
.style2 {font-size: 24}
</style></head>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletChamado_Cliente" > 
  <p class="style1" align="center">
  <input type="hidden" name="operacao" value="excluir">
  <input type="hidden" name="txtCodChamado" value="<%=item.getCodigo_chamado()%>">  
   <table width="706" height="183" border="0">
   <tr>
      <td width="157" height="29" class="style6"><div align="right">Código do Chamado </div></td>
      <td width="539"><span class="style1">
        <input type="text" name="txtCodChamado" size="15" maxlength="9" value='<%=item.getCodigo_chamado()%>' disabled="disabled">
      </span></td>
    </tr>

    <tr>
      <td width="157" height="29" class="style6"><div align="right">C&oacute;digo do passageiro </div></td>
      <td width="539"><span class="style1">
        <input type="text" name="txtCodPassageiro" size="15" maxlength="9" value='<%=item.getCodigo_passageiro()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td width="157" height="29" class="style6"><div align="right">Convenio</div></td>
      <td width="539"><span class="style1">
        <input type="text" name="txtConvenio" size="15" maxlength="9" value='<%=item.getConvenio()%>' disabled="disabled">
      </span></td>
    </tr>

    <tr>
      <td height="24" colspan="2" class="style1"><div align="center" class="style12">
        <p>Endere&ccedil;o de Origem </p>
        </div></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Logradouro </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRuaOrigem" size="50" maxlength="100" value='<%=item.getRua_origem()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Numero </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNumeroOrigem" size="10" maxlength="10" value='<%=item.getNumero_origem()%>' disabled="disabled">
      </span></td>
    </tr>
    <tr>
      <td height="30"><div align="right"><span class="style6">Complemento </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtComplementoOrigem" size="50" maxlength="50" value='<%=item.getComplementoOrigem()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Bairro </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtBairroOrigem" size="30" maxlength="20" value='<%=item.getBairro_origem()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Cidade </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCidadeOrigem" size="30" maxlength="30" value='<%=item.getCidade_origem()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Estado </span></div></td>
      <td><span class="style1">
         <input type="text" name="txtestadoOrigem" size="2" maxlength="2" value='<%=item.getEstado_origem()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right">CEP</div></td>
      <td><span class="style1">
        <input type="text" name="txtCepOrigem" size="15" maxlength="100" value='<%=item.getCep_origem()%>' disabled="disabled">
      </span></td>
    </tr>
    <tr>
      <td height="24" colspan="2" class="style1"><div align="center" class="style12">
        <p>Endere&ccedil;o de Destino </p>
        </div></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Rua </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtRuaDestino" size="50" maxlength="100" value='<%=item.getRua_destino()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Numero </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtNumeroDestino" size="10" maxlength="10" value='<%=item.getNumero_destino()%>' disabled="disabled">
      </span></td>
    </tr>
    <tr>
      <td height="30"><div align="right"><span class="style6">Complemento </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtComplementoDestino" size="50" maxlength="50" value='<%=item.getComplementoDestino()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Bairro </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtBairroDestino" size="30" maxlength="30" value='<%=item.getBairro_destino()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Cidade </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCidadeDestino" size="30" maxlength="30" value='<%=item.getCidade_destino()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">Estado </span></div></td>
      <td><span class="style1">
         <input type="text" name="txtEstadoDestino" size="2" maxlength="2" value='<%=item.getEstado_destino()%>' disabled="disabled">
      </span></td>
    </tr>
	<tr>
      <td height="30"><div align="right"><span class="style6">CEP </span></div></td>
      <td><span class="style1">
        <input type="text" name="txtCepDestino" size="15" maxlength="15" value='<%=item.getCep_destino()%>' disabled="disabled">
      </span></td>
    </tr>
    <% if ((item.getCodigo_status()==3)||(item.getCodigo_status()==2)){%>
	    <%if (iteratorEnvio.hasNext()) {
		    	Chamado_EnvioTO itemEnvio = iteratorEnvio.next();%>
			<tr>
		      <td height="30"><div align="right"><span class="style6">Id do Motorista </span></div></td>
		      <td><span class="style1">
		        <input type="text" name="txtIdMotorista" size="15" maxlength="15" value='<%=itemEnvio.getId_dispositivo()%>' disabled="disabled">
		      </span></td> 
		    </tr>
			<tr>
		      <td height="30"><div align="right"><span class="style6">Data de Envio </span></div></td>
		      <td><span class="style1">
		        <input type="text" name="txtDataEnvio" size="20" maxlength="20" value='<%=itemEnvio.getData()%>' disabled="disabled">
		      </span></td>
		    </tr>
		<%} 
    } %>
    <% if (item.getCodigo_status()==5){%>
	    <%if (iteratorFinal.hasNext()) {
		    	Chamado_FinalTO itemFinal = iteratorFinal.next();%>
			<tr>
		      <td height="30"><div align="right"><span class="style6">Id do Motorista </span></div></td>
		      <td><span class="style1">
		        <input type="text" name="txtIdMotorista" size="15" maxlength="15" value='<%=itemFinal.getId_dispositivo()%>' disabled="disabled">
		      </span></td> 
		    </tr>
			<tr>
		      <td height="30"><div align="right"><span class="style6">Data de Fechamento </span></div></td>
		      <td><span class="style1">
		        <input type="text" name="txtDataEnvio" size="20" maxlength="20" value='<%=itemFinal.getData_fechamento()%>' disabled="disabled">
		      </span></td>
		    </tr>
		    <tr>
		      <td height="30"><div align="right"><span class="style6">Valor da corrida </span></div></td>
		      <td><span class="style1">
		        <input type="text" name="txtDataEnvio" size="20" maxlength="20" value='<%=itemFinal.getValor()%>' disabled="disabled">
		      </span></td>
		    </tr>
		    <%} 
    } %>
   <%if (item.getCodigo_status()==4){%>
		<tr>
	      <td height="30"><div align="right"><span class="style6">Justificativa </span></div></td>
	      <td><span class="style1">
	        <textarea name="textarea" cols="55" rows="5" disabled="disabled"><%=item.getJustificativa()%></textarea>
	      </span></td>
	    </tr>
	<%}%>
  </table>
  
  <p class="style1" align="center">
    &nbsp;&nbsp;
    <%if ((item.getCodigo_status()!=4)&&(item.getCodigo_status()!=5)) {%>
    <input name="Cancelar" type="button" id="Cancelar" value="Cancelar" onClick="location.href='justificativa_cancelamento.jsp?cod_chamado=<%=item.getCodigo_chamado()%>'">
    <%} %>
    <input name="Voltar" type="button" id="Voltar" value="Voltar" onClick="location.href='pesquisa_chamado.jsp'">
  </p>
  <p class="style1">&nbsp;</p>
</form>
<% }

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

</html>


