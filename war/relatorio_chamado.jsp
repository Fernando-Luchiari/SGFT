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
<form name="frmcpf" method="post" action="ServletRelatorioChamado" onSubmit="">
<input type="hidden" name="tipo" value="relatorio">
<div id="fundo">
  <p class="style1" align="center">Relat&oacute;rio de Chamados </p>
  <div align = "center">
  <table width="700" height="90" border="1">
    <tr>
      <td width="700" height="41"><p><strong>Selecione o tipo de par&acirc;metro:</strong></p>
        <p>
          <label>
          <select name="tipoParametro">
            <option value="1">Passageiro (Cpf)</option>
            <option value="2">Conv&ecirc;nio (Cnpj)</option>
            <option value="3">Motorista (Id do dispositivo)</option>
          </select>
          <input type="text" name="txtParametro">
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
          <input type="button" name="gerar" value="Gerar" onClick="executar(this.form,'dinamico')">
        </p></td>
    </tr>
    <tr>
      <td width="700" height="41"><p><strong>Periodo</strong></p>
        <p>Status
          <select id="txtTipoStatus" name="txtStatus">
            <option value="1">Aberto</option>
            <option value="3">Aguardando aceite</option>
            <option value="4">Cancelado</option>
            <option value="2">Em andamento</option>
            <option value="5">Fechado</option>
            <option value="0">Todos</option>	
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
        <input type="button" name="gerar" value="Gerar" onClick="executar(this.form,'periodo')">
        </p></td>
    </tr>
  </table>
  <p>
    <input type="button" name="Submit" value="Voltar" onclick="location.href='relatorio_menu.jsp'">
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


