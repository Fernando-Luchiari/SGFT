<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">  
div#fundo{
	background-image: url('fundo_topo.gif');
	width:800px ;
	height:640px;
	margin-left:auto;
	margin-right:auto;
}
  table#erro{
	width: 650px;
	border-collapse:collapse;
	border:none;
	
}

tbody#erro th,td {
	font-size: 0.9em;
	line-height: 1.4em;
	font-family: Arial, Helvetica, sans-serif;
	color: #777777;
	padding: 10px 7px;
	border-top: none;
	border-right: none;
	text-align: center;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de Gerência de Chamados de taxi</title>
</head>
<body>
	<div id = "fundo" >
		<table id= "erro"  align="center" >
    	<tr>
			<td>Sua Sessão Expirou !</td>
		</tr>
		<tr>
			<td>Clique <a href="acesso.jsp" target="_top">aqui</a> para retornar a tela de login !</td>
		</tr>
		
		</table>	
		
	</div>
	
</body>
</html>