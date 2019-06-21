<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>Lista de passageiros</title>
<style type="text/css">  
  @import url("css_tabela.css");  
</style>
</head>

<body>

<%if(request.getSession().getAttribute("resultadoFinal")==null){
	    
 }else{%>
 	<div align="center"> 
  	  <p><%=request.getSession().getAttribute("resultadoFinal") %>      </p>
  	  <form id="form1" name="form1" method="post" action="">
  	    <input type="button" name="voltar" value="Voltar" onClick = "location.href='altera_convenio.jsp?cod_convenio=<%=request.getSession().getAttribute("cod_convenio") %>'" />
      </form>
  	  <p>&nbsp;  </p>
 	</div>
    <%request.getSession().removeAttribute("resultadoFinal");
    
    if(request.getSession().getAttribute("origem")!=null){ %>
   
    
    <%}
    
    }%>

</body>
</html>
