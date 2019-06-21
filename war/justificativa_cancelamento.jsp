<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Justificativa</title>

<style type="text/css">  
  @import url("css_tabela.css");  
</style></head>

<body>
<div id="fundo">
<form id="form" name="form" method="post" action="ServletChamado_Cliente">
<input type="hidden" name="operacao" value="">
<input type="hidden" name="cod_chamado" value="">
  <div align="center">
    <p>&nbsp;</p>
    <table width="200" border="1">
      <tr>
        <td><div align="center">Digite uma justificativa para cancelamento do chamado. </div></td>
      </tr>
      <tr>
        <td>
			 <p align="center">
			  <textarea name="txtJustificativa" cols="55" rows="5"></textarea>
			 </p>
			 <p align="center">
			  <input type="button" name="Confirmar" value="Confirmar" onClick="executar(this.form,'cancelar',<%=Integer.parseInt(request.getParameter("cod_chamado").toString())%>)" />
			  <input type="button" name="Voltar" value="Voltar" onClick="location.href='altera_chamado.jsp?cod_chamado=<%=Integer.parseInt(request.getParameter("cod_chamado").toString())%>'" />
			 </p>
		</td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>
      <label></label>
      <label></label>
    </p>
  </div>
</form>
</div>
</body><script language="javascript" type="text/javascript">
function executar(form,operacao,cod_chamado)
{
	form.operacao.value = operacao;
	form.cod_chamado.value = cod_chamado;
    
	form.submit();
}


</script>

</html>


