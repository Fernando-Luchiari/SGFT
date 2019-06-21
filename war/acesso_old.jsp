<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Usu&aacute;rio</title>
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
<script language="javascript">

function Validacampos(){
	
	var verifica = false;
	nome = document.frmcpf.txtNome.value;
	cpf = document.frmcpf.txtCpf.value;
	login = document.frmcpf.txtLogin.value;
	senha = document.frmcpf.txtSenha.value;
        


	if(nome==""){
			verifica = true;
		}
	if(verifica!=true && cpf==""){
			verifica = true;
		}
	if(verifica!=true && login==""){
			verifica = true;
		}
	if(verifica!=true && senha==""){
			verifica = true;
	}

	if(verifica==true){
		alert('Campo(s) obrigatório(s) em branco');
		}
	else{
		Validasenha();
		}
				
}

function Validasenha(){
	senha1 = document.frmcpf.txtSenha.value;
	senha2 = document.frmcpf.txtSenha2.value;

	if(senha1 != senha2){
			alert('Senhas não conferem');
		}
	else{
		Validacpf();
		form.submit();
	}
}
function Validacpf(){
	
	if(document.frmcpf.txtCpf.value!=""){

		if (vercpf(document.frmcpf.txtCpf.value)) 
		{document.frmcpf.submit();}else 
		{errors="1";if (errors) alert('CPF Inválido');
		document.retorno = (errors == '');}}
		function vercpf (txtCpf) 
		{if (txtCpf.length != 11 || txtCpf == "00000000000" || txtCpf == "11111111111" || txtCpf == "22222222222" || txtCpf == "33333333333" || txtCpf == "44444444444" || txtCpf == "55555555555" || txtCpf == "66666666666" || txtCpf == "77777777777" || txtCpf == "88888888888" || txtCpf == "99999999999")
		return false;
		add = 0;
		for (i=0; i < 9; i ++)
		add += parseInt(txtCpf.charAt(i)) * (10 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
		rev = 0;
		if (rev != parseInt(txtCpf.charAt(9)))
		return false;
		add = 0;
		for (i = 0; i < 10; i ++)
		add += parseInt(txtCpf.charAt(i)) * (11 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
		rev = 0;
		if (rev != parseInt(txtCpf.charAt(10)))
		return false;
		return true;
	}
}





</script>
<script type="text/javascript">
  (function(a,b){
	  if(/android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(a.substr(0,4)))window.location=b})
	  (navigator.userAgent||navigator.vendor||window.opera,'http://sgct.ddns.com.br:8080/sgft/acesso_mobile.jsp');
  </script>
<style type="text/css">  
  @import url("css_tabela.css");  
.style1 {font-weight: bold}
.style2 {font-family: Arial, Helvetica, sans-serif}
</style></head>

<body>
<div id="fundo">
<form name="frmcpf" method="post" action="ServletAcesso" onSubmit="VerificaCPF();">
<input type="hidden" name="operacao" value="AcessoUsuario">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p class="style1" align="center">
  </p>
  <p class="style1" align="center">
  
  <div align="center">
    <table width="200" border="1">
      <tr>
        <td colspan="2"><p align="center" class="style2"><strong>Seja bem vindo ao SGCT.<br>
          Insira seu usu&aacute;rio e sua senha para acessar ao sistema. </strong></p>          </td>
        </tr>
      <tr>
        <td><img src="logopreto.png" width="271" height="80"></td>
        <td><table width="305" height="131" border="1">
          <tr>
            <th width="295" ><div align="left">
                <label><span class="style2">Usu&aacute;rio:</span>
                <input type="text" name="txtLogin" size="18">
                </label>
            </div></th>
          </tr>
          <tr>
            <td height="63"><div align="left">
                <label><span class="style2"><strong> Senha:  </strong></span> 
                <input type="password" name="txtSenha" size="18">
                </label>
                <label>
                <input type="submit" name="Submit" value="Ok">
                </label>
            </div></td>
          </tr>
        </table></td>
        </tr>
    </table>
  </div>
  <%if(request.getSession().getAttribute("mensagemAcesso")!=null){ %>
	
	<div align="center">
 	<table width="200" border="1">
    <tr>
      <th scope="col"><div align="center">Mensagem!</div></th>
    </tr>
    <tr>
      <td><div align="center"><%=request.getSession().getAttribute("mensagemAcesso") %></div></td>
    </tr>
  </table>
  </div>
   <%request.getSession().removeAttribute("mensagemAcesso");    
    }%>
   

</form>
</div>

</body>
</html>


