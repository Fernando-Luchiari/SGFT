<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="modelo.Chamado_EnvioTO"%>
<%@page import="modelo.Chamado_Envio"%>
<%@page import="modelo.MotoristaTO"%>
<%@page import="modelo.Motorista"%>
<%@page import="modelo.Chamado_ClienteTO"%>
<%@page import="modelo.Chamado_Cliente"%>
<%@page import="modelo.Chamado_AceiteTO"%>
<%@page import="modelo.Chamado_Aceite"%>
<%@page import="modelo.PassageiroTO"%>
<%@page import="modelo.Passageiro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style type="text/css"> 
 @import url("css_mobile.css"); 
</style>
</head>
<body onload="setTimeout(ContaTempo());">	
	<p align="left" class="style2"><strong>Bem vindo(a) <%=request.getSession().getAttribute("NomeMotorista")%>!</strong> </p>
	<p>	</p>
	
	<form name="frmChamado" action="ServletMovelWeb" method="post">
	<input type="button" name="encerrar" value="Logoff" onclick="executar(this.form,'EncerraSessao')">
	<input type="hidden" name="operacao" value="contarMinuto">
	<input type="hidden" name="motoristaID" value="<%=request.getSession().getAttribute("motoristaID")%>">
	<%	
		boolean chamado =false;
		boolean afinalizar = false;
		String endereçoOri=null;
		String endereçoDest=null;
		String cidadeestOri=null;
		String cidadeestDest=null;
		String nomePassageiro=null;
		String telPassageiro=null;
		int numChamado=0;
		int idDispositivo=0;
		//
		MotoristaTO motoristaAcesso = new MotoristaTO();
		motoristaAcesso.setId_dispositivo(Integer.parseInt(request.getSession().getAttribute("motoristaID").toString()));
		Motorista verifica = new Motorista(motoristaAcesso,null);
		List<MotoristaTO> listaLogin = verifica.consultar(7);
		Iterator<MotoristaTO> iteratorAtivo = listaLogin.iterator();
		if(!iteratorAtivo.hasNext()){%>
			<p align="left" class="style2"><strong>Você ainda não está conectado ao Location Movel, para você receber chamados é necessário estar conectado!</strong></p>
		<%}
		//--------------------
		Chamado_EnvioTO dadoschamadoEnv = new Chamado_EnvioTO();
		dadoschamadoEnv.setId_dispositivo(Integer.parseInt(request.getSession().getAttribute("motoristaID").toString()));
		Chamado_Envio chamado_Envio = new Chamado_Envio(dadoschamadoEnv);
		List<Chamado_EnvioTO> listachamadoEnv = chamado_Envio.consultar(1);
		Iterator<Chamado_EnvioTO> iteratorEnv = listachamadoEnv.iterator();
		while (iteratorEnv.hasNext()) {
			Chamado_EnvioTO itemEnv = iteratorEnv.next();
			numChamado=itemEnv.getCodigo_chamado();
			idDispositivo=itemEnv.getId_dispositivo();
			//--verifica se o chamado foi recusado pelo motorista
			Chamado_AceiteTO dadoschamadoaceite = new Chamado_AceiteTO(""+itemEnv.getId_dispositivo(),
					itemEnv.getCodigo_chamado());
			Chamado_Aceite chamadoaceite = new Chamado_Aceite(
					dadoschamadoaceite);
			List<Chamado_AceiteTO> listablock = chamadoaceite.consultar(1);
			Iterator<Chamado_AceiteTO> iteratorBlock = listablock
					.iterator();
			//-----
			if(listablock.isEmpty()){
				Chamado_ClienteTO dadoschamado = new Chamado_ClienteTO();
				dadoschamado.setCodigo_chamado(itemEnv.getCodigo_chamado());
				Chamado_Cliente chamado_cliente = new Chamado_Cliente(dadoschamado);
				List<Chamado_ClienteTO> listachamado = chamado_cliente.consultar(2);
				Iterator<Chamado_ClienteTO> iterator = listachamado.iterator();	
				while (iterator.hasNext()) {
					Chamado_ClienteTO item = iterator.next();
					if((item.getCodigo_status()== 3)){
						chamado =true;
						endereçoOri= item.getRua_origem() +","+ item.getNumero_origem()+","+item.getComplementoOrigem();
						endereçoDest= item.getRua_destino() +","+ item.getNumero_destino()+","+item.getComplementoDestino();					
						cidadeestOri=item.getCidade_origem() + " - " + item.getEstado_origem();
						cidadeestDest=item.getCidade_destino() + " - " + item.getEstado_destino();
						
						PassageiroTO dadospassageiro = new PassageiroTO();
						dadospassageiro.setCodigo_passageiro(item.getCodigo_passageiro());
						Passageiro passageiro = new Passageiro(dadospassageiro);
						List<PassageiroTO> listapassageiros = passageiro.consultar(3);
						Iterator<PassageiroTO> iteratorPass = listapassageiros.iterator();
						if(iteratorPass.hasNext()){
							PassageiroTO itemPass = iteratorPass.next();
							nomePassageiro=itemPass.getNome();
							telPassageiro=itemPass.getDdd()+" "+itemPass.getTelefone();
						}
					}else if(item.getCodigo_status()==2){
						afinalizar=true;
						endereçoOri= item.getRua_origem() +","+ item.getNumero_origem()+","+item.getComplementoOrigem();
						endereçoDest= item.getRua_destino() +","+ item.getNumero_destino()+","+item.getComplementoDestino();					
						cidadeestOri=item.getCidade_origem() + " - " + item.getEstado_origem();
						cidadeestDest=item.getCidade_destino() + " - " + item.getEstado_destino();
						
						PassageiroTO dadospassageiro = new PassageiroTO();
						dadospassageiro.setCodigo_passageiro(item.getCodigo_passageiro());
						Passageiro passageiro = new Passageiro(dadospassageiro);
						List<PassageiroTO> listapassageiros = passageiro.consultar(3);
						Iterator<PassageiroTO> iteratorPass = listapassageiros.iterator();
						if(iteratorPass.hasNext()){
							PassageiroTO itemPass = iteratorPass.next();
							nomePassageiro=itemPass.getNome();
							telPassageiro=itemPass.getDdd()+" "+itemPass.getTelefone();
						}
					}								
				}
			}
		}
		
	if (chamado){%>
			<input type="hidden" name="TempoGasto" value="<%=request.getSession().getAttribute("TempoGasto")%>">		
			<input type="hidden" name="motoristaID" value="<%=idDispositivo%>">
			<input type="hidden" name="chamadoID" value="<%=numChamado%>"> 
			
			<input type="hidden" name="nomePassageiro" value="<%=nomePassageiro%>">
			<input type="hidden" name="telPassageiro" value="<%=telPassageiro%>"> 
			<input type="hidden" name="endOri" value="<%=endereçoOri + " " + cidadeestOri%>"> 
			<input type="hidden" name="endDest" value="<%=endereçoDest + " " + cidadeestDest%>"> 
			<table align="center">
				<tr>
					<td><strong>Nome do Passageiro</strong></td><td><%=nomePassageiro%></td>
				</tr>
				<tr>
					<td><strong>Telefone</strong></td><td><%=telPassageiro%></td>
				</tr>
				<tr>
					<td><strong>Endereço de Origem</strong></td><td><%=endereçoOri + " " + cidadeestOri%></td>
				</tr>
				<tr>
					<td><strong>Endereço de Destino</strong></td><td><%=endereçoDest + " " + cidadeestDest%></td>
				</tr>
				<tr>
					<td><input type="button" name="aceitar" value="Aceitar" onClick="executar(this.form,'aceitarChamado')"></td>
					<td><input type="button" name="recusar" value="Recusar" onClick="executar(this.form,'recusarChamado')"></td>
				</tr>			
			</table>
		</form>
	<%
	}
	if (afinalizar == true){
		afinalizar=false;%>
		<input type="hidden" name="motoristaID" value="<%=idDispositivo%>">
		<input type="hidden" name="chamadoID" value="<%=numChamado%>">
		<input type="hidden" name="nomePassageiro" value="<%=nomePassageiro%>">
		<input type="hidden" name="telPassageiro" value="<%=telPassageiro%>"> 
		<input type="hidden" name="endOri" value="<%=endereçoOri + " " + cidadeestOri%>"> 
		<input type="hidden" name="endDest" value="<%=endereçoDest + " " + cidadeestDest%>">  
		<p align="left" class="style2"><strong>Você possui um chamado a ser finalizado clique no botão para ser redirecionado.</strong></p>
		<input type="button" name="aceitar" value="Finalizar" onClick="executar(this.form,'afinalizar')">
	
	
	
	<%} %>
	
	
	
<script language="javascript" type="text/javascript">

function ContaTempo() {
	setTimeout('executar2()', 60000);
}

function executar2()
{	
	frmChamado.submit();
}

function executar(frmChamado,operacao)
{	
	frmChamado.operacao.value = operacao;
    frmChamado.submit();
}


</script>
</html>