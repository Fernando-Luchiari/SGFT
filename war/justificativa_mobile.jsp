<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Justificativa</title>
<style type="text/css"> 
 	@import url("css_mobile.css");  
</style>

</head>
<body>
	<p align="left" class="style2"><strong><%=request.getSession().getAttribute("NomeMotorista")%> conectado(a)</strong>     <a href="ServletMovelWeb?operacao=EncerraSessao" target="mainFrame" >Logoff</a></p>
	<form name="frmJustifica" method="post" action="ServletMovelWeb">		
		<input type="hidden" name="operacao" value="informeJustificativa">		
		<input type="hidden" name="motoristaID" value="<%=request.getSession().getAttribute("motoristaID")%>">
		<input type="hidden" name="chamadoID" value="<%=request.getSession().getAttribute("chamadoID")%>">
		<p class="style1" align="center">Informe a Justificativa </p>
		<table align="center">			
			<tr>
				<td>faltam&nbsp;<input readonly type=text name=remLen size=3 maxlength=3 value="250"></font></td>
			</tr>
			<tr>
				<td><textarea  rows="5" cols="50"  wrap=physical name="txtJustificativa" onKeyDown="textCounter(this.form.txtJustificativa,this.form.remLen,250);" onKeyUp="textCounter(this.form.txtJustificativa,this.form.remLen,250);"></textarea></td>
			</tr>	
		</table>
			<p align="center"><input type="button" name="aceitar" value="Confirmar" onClick="confirmBox2(this.form,'JustificarRecusa')">
			<input type="button" name="recusar" value="Cancelar" onClick="executar(this.form,'cancelarRecusa')"></p>
			
	</form>
</body>
<script language="javascript" type="text/javascript">
function Validacampos(){
	
	var verifica = false;
	justificativa = document.frmJustifica.txtJustificativa.value;
	
	if(justificativa==""){
		alert = ('Campo justificativa não pode ficar em branco!');
		return false;
	}else{
		return true;	
	}
}

function textCounter(field, countfield, maxlimit) {
	if (field.value.length > maxlimit)
		field.value = field.value.substring(0, maxlimit);
	else 
		countfield.value = maxlimit - field.value.length;
	}

</script>
<script language="javascript" type="text/javascript">
function confirmBox2(frmJustifica,operacao) {
	if (confirm("Tem certeza que deseja cancelar esse chamado?")) {
		executar(frmJustifica,operacao);
	}
} 	
</script>
<script language="javascript" type="text/javascript">
function executar(frmChamado,operacao)
{
	if(operacao=='cancelarRecusa'){
		frmChamado.operacao.value = operacao;   
		frmChamado.submit();
	}
	if(Validacampos()){
		frmChamado.operacao.value = operacao;   
		frmChamado.submit();
	}
}
</script>
</html>