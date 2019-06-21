<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Menu de Relatorios</title>

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

<style type="text/css">  
  @import url("css_tabela.css");  
</style></head>

<body>
<form name="frmcpf" method="post" action="ServletRelatorioLog" onSubmit="">
<input type="hidden" name="tipo" value="relatorio">
<div id="fundo">
  <p class="style1" align="center">Relat&oacute;rio de Log </p>
  <div align = "center">
  <table width="700" height="90" border="1">
    <tr>
      <td width="700" height="41"><p><strong>Por Login</strong></p>
        <p>
          <label>Id do Usuário:
          <input type="text" name="txtIdUsuario">
          </label>
        </p>
        <p>De: 
          <label>dia
          <select id="txtDiaDe1" name="txtDiaDe1">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
          </select>
          </label>
          <label>mes
          <select id="txtMesDe1" name="txtMesDe1">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
          </label>
          <label>ano
          <select id="txtAnoDe1" name="txtAnoDe1">
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
          </select>
          </label> 
           &nbsp;At&eacute;: &nbsp;dia
           <select id="txtDiaAte1" name="txtDiaAte1">
             <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
           </select>
        mes
            <select id="txtMesAte1" name="txtMesAte1">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
          <label> </label>
          <label>ano
          <select id="txtAnoAte1" name="txtAnoAte1">
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
          </select>
          </label>
          <input type="button" name="gerar" value="Gerar" onClick="executar(this.form,'idUsuario')">
        </p></td>
    </tr>
    <tr>
      <td width="700" height="41"><p><strong>Por tipo de altera&ccedil;&atilde;o</strong> </p>
        <p>Tipo de altera&ccedil;&atilde;o: 
          <select id="txtTipoAlteracao" name="txtTipoAlteracao">
			    <option value="Aceitar Chamado">Aceitar Chamado</option>                                         
				<option value="Acesso ao sistema">Acesso ao sistema</option>                                     
				<option value="Acesso ao sistema móvel web">Acesso ao sistema móvel web</option>                 
				<option value="Acesso ao sistema móvel">Acesso ao sistema móvel</option>                         
				<option value="Alteracao de Usuario">Alteracao de Usuario</option>                               
				<option value="Alteracao de convenio">Alteracao de convenio</option>                             
				<option value="Alteracao de coordenadas">Alteracao de coordenadas</option>                       
				<option value="Alteracao de motorista">Alteracao de motorista</option>                           
				<option value="Alteracao de passageiro">Alteracao de passageiro</option>                         
				<option value="Ativacao de Usuario">Ativacao de Usuario</option>                                 
				<option value="Ativacao de convenio">Ativacao de convenio</option>                               
				<option value="Ativacao de motorista">Ativacao de motorista</option>                             
				<option value="Ativacao de passageiro">Ativacao de passageiro</option>                           
				<option value="Cancelamento de chamado">Cancelamento de chamado</option>                         
				<option value="Chamado finalizado">Chamado finalizado</option>                                   
				<option value="Chamado nao aceito">Chamado nao aceito</option>                                   
				<option value="Consulta de chamado">Consulta de chamado</option>                                 
				<option value="Consulta de convenio">Consulta de convenio</option>                               
				<option value="Consulta de motorista">Consulta de motorista</option>                             
				<option value="Consulta de passageiro">Consulta de passageiro</option>                           
				<option value="Consulta de passageiro por convenio">Consulta de passageiro por convenio</option> 
				<option value="Consulta de usuario">Consulta de usuario</option>                                 
				<option value="DesAtivacao de Usuario">DesAtivacao de Usuario</option>                           
				<option value="DesAtivacao de chamado">DesAtivacao de chamado</option>                           
				<option value="DesAtivacao de convenio">DesAtivacao de convenio</option>                         
				<option value="DesAtivacao de motorista">DesAtivacao de motorista</option>                       
				<option value="DesAtivacao de passageiro">DesAtivacao de passageiro</option>                     
				<option value="Encerrar sessao">Encerrar sessao</option>                                         
				<option value="Encerrar sessao no sistema móvel">Encerrar sessao no sistema móvel</option>       
				<option value="Expirou sessao">Expirou sessao</option>                                           
				<option value="Inclusao de Usuario">Inclusao de Usuario</option>                                 
				<option value="Inclusao de chamado">Inclusao de chamado</option>                                                                                             
				<option value="Inclusao de motorista">Inclusao de motorista</option>                             
				<option value="Inclusao de passageiro">Inclusao de passageiro</option>                           
				<option value="Inclusao de convenio">Inclusao de convenio</option>                               
				<option value="Insercao de coordenadas">Insercao de coordenadas</option>                         
				<option value="Recusar Chamado">Recusar Chamado</option>                                         
	
          </select>
        </p>
       <p>De: 
          <label>dia
          <select id="txtDiaDe2" name="txtDiaDe2">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
          </select>
          </label>
          <label>mes
          <select id="txtMesDe2" name="txtMesDe2">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
          </label>
          <label>ano
          <select id="txtAnoDe2" name="txtAnoDe2">
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
          </select>
          </label> 
           &nbsp;At&eacute;: &nbsp;<label>dia
           <select id="txtDiaAte2" name="txtDiaAte2">
             <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
           </select>
           </label>
        <label>mes
            <select id="txtMesAte2" name="txtMesAte2">
            <option value="01">01</option>
            <option value="02">02</option>
            <option value="03">03</option>
            <option value="04">04</option>
            <option value="05">05</option>
            <option value="06">06</option>
            <option value="07">07</option>
            <option value="08">08</option>
            <option value="09">09</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
          </select>
          </label>
          <label>ano
          <select id="txtAnoAte2" name="txtAnoAte2">
            <option value="2009">2009</option>
            <option value="2010">2010</option>
            <option value="2011">2011</option>
            <option value="2012">2012</option>
          </select>
          </label>
        <input type="button" name="gerar" value="Gerar" onClick="executar(this.form,'tipoDeAlteracao')">
        </p></td>
    </tr>
  </table>
  <p>
    <input type="button" name="Submit" value="Voltar"  onclick="location.href='relatorio_menu.jsp'">
  </p>
  </div>
  <p class="style1" align ="center">
</p>
</div>
</form>
</body>

<script language="javascript" type="text/javascript">
function executar(frmcpf,tipo)
{
	frmcpf.tipo.value = tipo;
    
	frmcpf.submit();
}

</script>
</html>


