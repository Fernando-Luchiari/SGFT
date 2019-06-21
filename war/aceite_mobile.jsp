<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="modelo.Chamado_EnvioTO"%>
<%@page import="modelo.Chamado_Envio"%>
<%@page import="modelo.Chamado_ClienteTO"%>
<%@page import="modelo.Chamado_Cliente"%>
<%@page import="modelo.PassageiroTO"%>
<%@page import="modelo.Passageiro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="refresh"
	content="180; url=http://sgct.ddns.com.br:8080/sgft/Meio_mobile.jsp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css">
@import url("css_mobile.css");
</style>



</head>
<body onload="setTimeout(ContaTempo());">
<p align="left" class="style2"><strong><%=request.getSession().getAttribute("NomeMotorista")%>
conectado(a)</strong> <a href="ServletMovelWeb?operacao=EncerraSessao"
	target="mainFrame">Logoff</a></p>
<form name="frmChamado" action="ServletMovelWeb" method="post">
<input	type="hidden" name="operacao" value="VerificaCancelamento"> 
<input type="hidden" name="motoristaID"	value="<%=request.getSession().getAttribute("motoristaID")%>">
<input type="hidden" name="chamadoID" value="<%=request.getSession().getAttribute("numChamado")%>">

<input type="hidden" name="nomePassageiro" value="<%=request.getSession().getAttribute("nomePassageiro")%>">
<input type="hidden" name="telPassageiro" value="<%=request.getSession().getAttribute("telPassageiro")%>">
<input type="hidden" name="endOri" value="<%=request.getSession().getAttribute("endOri")%>">
<input type="hidden" name="endDest" value="<%=request.getSession().getAttribute("endDest")%>">
<%
String cancelou = null;
if(request.getSession().getAttribute("cancelou")!=null){	
	cancelou = request.getSession().getAttribute("cancelou").toString();
}
if(cancelou!= null && cancelou.equals("true")) {%>
	<p align="left" class="style2"><strong>Este chamado foi cancelado, qualquer duvida entre em contato com a central.</strong></p>
	<p align="left" class="style2"><strong>Clique no botão apra retornar a tela principal.</strong></p>
	<input type="button" name="voltar" value="Voltar" onClick="location.href='Meio_mobile.html'">
<%}else{%>
<table align="center">
	<tr>
		<td><strong>Nome do Passageiro</strong></td>
		<td><%=request.getSession().getAttribute("nomePassageiro")%></td>
	</tr>
	<tr>
		<td><strong>Telefone</strong></td>
		<td><%=request.getSession().getAttribute("telPassageiro")%></td>
	</tr>
	<tr>
		<td><strong>Endereço de Origem</strong></td>
		<td><%=request.getSession().getAttribute("endOri")%></td>
	</tr>
	<tr>
		<td><strong>Endereço de Destino</strong></td>
		<td><%=request.getSession().getAttribute("endDest")%></td>
	</tr>
	<tr>
		<td><strong>Valor do Chamado</strong></td>
		<td><input type="text" name="valor" size="20"  onkeypress='return SomenteNumero(event)' onKeydown="Formata(this,20,event,2)"></td>
	</tr>							
	</table>
	<p align="center">
		<input type="button" name="aceitar" value="Finalizar Chamado" onClick="executar(this.form,'FinalizarChamado')">
	</p>
<%}%>
	
	</form>
</body>

<script language="javascript" type="text/javascript">
function executar(frmChamado,operacao)
{
	if(Validacampos){
		frmChamado.operacao.value = operacao;
	    
		frmChamado.submit();
	}
}

function ContaTempo() {
	setTimeout('executar2()', 60000);
}

function executar2()
{	
	frmChamado.submit();
}

function SomenteNumero(e){
	var tecla=(window.event)?event.keyCode:e.whi…
	if((tecla > 47 && tecla < 58)) 
		return true;
	else{
		if (tecla != 8) 
			return false;
		else 
			return true;
		}
}

function Validacampos(){
	
	valor = document.frmChamado.valor.value;   


	if(valor==""){
			alert('Prencha o valor do chamado!');
			return false;
	}else{
			return true;
	}	
}

function Limpar(valor, validos) {
	// retira caracteres invalidos da string
	var result = "";
	var aux;
	for (var i=0; i < valor.length; i++) {
	aux = validos.indexOf(valor.substring(i, i+1));
	if (aux>=0) {
	result += aux;
	}
	}
	return result;
	}


function Formata(campo,tammax,teclapres,decimal) {
	var tecla = teclapres.keyCode;
	vr = Limpar(campo.value,"0123456789");
	tam = vr.length;
	dec=decimal

	if (tam < tammax && tecla != 8){ tam = vr.length + 1; }

	if (tecla == 8 )
	   { tam = tam - 1; }

	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 )
	{

	if ( tam <= dec )
	{ campo.value = vr; }

	if ( (tam > dec) && (tam <= 5) ){
	campo.value = vr.substr( 0, tam - 2 ) + "," + vr.substr( tam - dec, tam ); }
	if ( (tam >= 6) && (tam <= 8) ){
	campo.value = vr.substr( 0, tam - 5 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ); 
	}
	if ( (tam >= 9) && (tam <= 11) ){
	campo.value = vr.substr( 0, tam  - 8 ) + "." + vr.substr( tam  - 8, 3 ) +  "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ); }
	if ( (tam >= 12) && (tam <= 14) ){
	campo.value = vr.substr( 0, tam - 11 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - dec, tam ); }
	if ( (tam >= 15) && (tam <= 17) ){
	campo.value = vr.substr( 0, tam - 14 ) + "." + vr.substr( tam - 14, 3 ) + "." + vr.substr( tam - 11, 3 ) + "." + vr.substr( tam - 8, 3 ) + "." + vr.substr( tam - 5, 3 ) + "," + vr.substr( tam - 2, tam );}
	} 

	}


</script>
</html>