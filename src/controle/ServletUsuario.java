package controle;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ClassesException;
import modelo.Funcionario;
import modelo.FuncionarioTO;
import modelo.Log;
import modelo.LogTO;
import modelo.Usuario;
import modelo.UsuarioTO;

public class ServletUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int codFuncionario;
	private String senha;
	private String login;
	private Boolean supervisor;
	private String cpf;
	private String rg;
	private String telefone;
	private String ddd;
	private String nome;
	private String operacao;
	private String dataInclusao;

	public ServletUsuario() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			executa(request, response);
		} catch (ClassesException e) {
			System.out.print("Erro");
			e.printStackTrace();
			if (!operacao.equals("consulta")){
				request.getRequestDispatcher("erro.jsp").forward(request,
					response);
			}
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			executa(request, response);
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			if (!operacao.equals("consulta")){
				request.getRequestDispatcher("erro.jsp").forward(request,
					response);
			}
		}
	}

	public void executa(HttpServletRequest request, HttpServletResponse response)
			throws ClassesException, ServletException, IOException {

		codFuncionario = 0;
		senha = request.getParameter("txtSenha");
		login = request.getParameter("txtLogin");
		supervisor = Boolean
				.parseBoolean(request.getParameter("txtSupervisor"));
		cpf = request.getParameter("txtCpf");
		rg = request.getParameter("txtRg");
		telefone = request.getParameter("txtTelefone");
		ddd = request.getParameter("txtDdd");
		nome = request.getParameter("txtNome");
		operacao = request.getParameter("operacao");

		request.getSession().setAttribute("nome", nome);
		request.getSession().setAttribute("login_cadastro", login);
		request.getSession().setAttribute("cpf", cpf);
		request.getSession().setAttribute("rg", telefone);
		request.getSession().setAttribute("telefone", telefone);

		int isupervisor;
		int iativo;
		

		if (supervisor == true) {

			isupervisor = 1;

		} else {

			isupervisor = 0;

		}

		if ("consulta".equals(operacao)) {

			String resultado = "";
			boolean cabecalho=false;
			boolean encontrou=false;
			String parametro = request.getParameter("txtParametroUsuario");
			int tipoPesquisa = Integer.parseInt(request
					.getParameter("tipoPesquisa"));
			FuncionarioTO funcionario = new FuncionarioTO();
			UsuarioTO usuario = new UsuarioTO();

			String tipoCons = "";
			if (tipoPesquisa == 1) {
				funcionario.setCpf(parametro);
				tipoCons = "Cpf";
			} else if(tipoPesquisa == 2){
				funcionario.setCodfuncionario(Integer.parseInt(parametro));
				tipoCons = "Código funcional";
			}else if(tipoPesquisa == 6){
				funcionario.setNome(parametro);
				tipoCons = "Nome funcionário";
			}else if(tipoPesquisa == 7){
				
				parametro="Nulo";
				tipoCons = "Todos";
			}

			Funcionario funcionarioSel = new Funcionario(funcionario);
			List<FuncionarioTO> listaF = funcionarioSel.consultar(tipoPesquisa);
			Iterator<FuncionarioTO> iteratorF = listaF.iterator();
			if (!iteratorF.hasNext()){
				resultado = resultado
				+ "<tr>"
				+ "<td colspan=‘4’><div align=‘center’><strong>Nenhum dado Encontrado! </strong></div></td>"
				+ "</tr>";
			}
			while (iteratorF.hasNext()) {
				FuncionarioTO itemF = iteratorF.next();
				usuario.setCodfuncionario(itemF.getCodfuncionario());
				Usuario usuarioSel = new Usuario(usuario, null);
				List<UsuarioTO> listaU = usuarioSel.consultar(1);
				Iterator<UsuarioTO> iteratorU = listaU.iterator();
				
				while (iteratorU.hasNext()) {
					if (!cabecalho){
						resultado = "</tr>" + "<table width=‘78%’ border=‘1’>"
						+ "<tr>" + "<th width=‘164’>CPF</th>"
						+ "<th width=‘260’>Código</th>"
						+ "<th width=‘319’>Nome</th>"
						+ "<th width=‘189’>Ativo</th>" + "</tr>";
						cabecalho=true;
						encontrou=true;
					}
					UsuarioTO itemU = iteratorU.next();
					String sAtivo = "";

					if (itemU.getAtivo() == 1) {
						sAtivo = "Sim";
					} else {
						sAtivo = "Não";
					}

					resultado = resultado
							+ "<tr>"
							+ "<td>"
							+ itemF.getCpf()
							+ "</td>"
							+ "<td>"
							+ itemU.getCodfuncionario()
							+ "</td>"
							+ "<td><a target='mainFrame' href=‘altera_usuario.jsp?cod_funcionario="
							+ itemU.getCodfuncionario() + "’>"
							+ itemF.getNome() + "</a></td>" + "<td>" + sAtivo
							+ "</td>" + "</tr>";
				}

			} 
			
			if (!encontrou){
				resultado =  "<tr>"
				+ "<td colspan=‘4’><div align=‘center’><strong>Nenhum dado Encontrado! </strong></div></td>"
				+ "</tr>";
			}
			
			resultado = resultado + "</table>";
			String resultadoFinal = resultado.replace("‘", "\"");
			resultadoFinal = resultadoFinal.replace("’", "\"");

			LogTO log = new LogTO(0, "Consulta de usuario", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Consulta através do parâmetro " + parametro + " como "
							+ tipoCons);
			Log logIns = new Log(log);
			logIns.inserir();

			request.getSession().setAttribute("resultadoFinal", resultadoFinal);
			request.getRequestDispatcher("/HomePesquisa.jsp").forward(request,
					response);
			resultadoFinal = "";

		}
		if ("cadastro".equals(operacao)) {
			if (Boolean.parseBoolean(request.getParameter("txtAtivo"))) {
				iativo = 1;
			} else {
				iativo = 0;
			}
			String mensagemIncluir = "";

			FuncionarioTO funcionarioVI = new FuncionarioTO();
			funcionarioVI.setCpf(cpf);
			funcionarioVI.setRg(rg);
			Funcionario verificaFI = new Funcionario(funcionarioVI);
			List<FuncionarioTO> listaVerificaCpfI = verificaFI.consultar(1);
			List<FuncionarioTO> listaVerificaRgI = null;
			if (rg != "")
				listaVerificaRgI = verificaFI.consultar(3);

			UsuarioTO usuarioVI = new UsuarioTO();
			usuarioVI.setLogin(login);

			Usuario verificaUI = new Usuario(usuarioVI, null);
			List<UsuarioTO> listaVerificaLoginI = verificaUI.consultar(2);

			if (listaVerificaCpfI.size() > 0) {

				mensagemIncluir = "O CPF " + cpf
						+ " já consta cadastrado no sistema ";
				request.getSession().setAttribute("pagina",
						"inclui_usuario.jsp");

			} else if (listaVerificaRgI != null && listaVerificaRgI.size() > 0) {
				mensagemIncluir = "O Rg " + rg
						+ " já consta cadastrado no sistema ";
				request.getSession().setAttribute("pagina",
						"inclui_usuario.jsp");

			} else if (listaVerificaLoginI.size() > 0) {

				mensagemIncluir = "O Login " + login
						+ " já consta cadastrado no sistema ";

				request.getSession().setAttribute("pagina",
						"inclui_usuario.jsp");

			} else {

				UsuarioTO usuario = new UsuarioTO(codFuncionario, senha, login,
						isupervisor, iativo, dataInclusao,"N");
				FuncionarioTO funcionario = new FuncionarioTO(codFuncionario,
						cpf, rg, telefone, nome,ddd);
				Usuario usuarioIns = new Usuario(usuario, funcionario);
				int cod_funcionario = usuarioIns.inserir();

				LogTO log = new LogTO(0, "Inclusao de Usuario", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusao do motorista com o login " + login);
				Log logIns = new Log(log);
				logIns.inserir();

				mensagemIncluir = "O Usuário cadastrado com sucesso! "
						+ "Código funcional: " + cod_funcionario;
				request.getSession().setAttribute("pagina",
						"pesquisa_usuario.jsp");

			}
			request.getSession().setAttribute("mensagem", mensagemIncluir);

			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);
		}

		if ("alteracao".equals(operacao)) {

			iativo = 1;
			codFuncionario = Integer.parseInt(request
					.getParameter("txtCodfuncionario"));

			String mensagemAlterar = "";
			FuncionarioTO funcionarioVA = new FuncionarioTO();
			funcionarioVA.setRg(rg);
			funcionarioVA.setCodfuncionario(codFuncionario);
			Funcionario verificaFA = new Funcionario(funcionarioVA);
			List<FuncionarioTO> listaVerificaRgA = null;
			if (rg != "")
				listaVerificaRgA = verificaFA.consultar(4);

			if ((listaVerificaRgA != null) && listaVerificaRgA.size() > 0) {
				mensagemAlterar = "O Rg " + rg
						+ " já consta cadastrado no sistema";
				request.getSession().setAttribute("pagina",
						"altera_usuario.jsp");

			} else {

				UsuarioTO usuario = new UsuarioTO(codFuncionario, senha, login,
						isupervisor, iativo, dataInclusao,"N");
				FuncionarioTO funcionario = new FuncionarioTO(codFuncionario,
						cpf, rg, telefone, nome,ddd);
				Usuario usuarioup = new Usuario(usuario, null);
				Funcionario funcionarioup = new Funcionario(funcionario);
				usuarioup.alterar();
				funcionarioup.alterar();

				LogTO log = new LogTO(0, "Alteracao de Usuario", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Alteração do Usuario com o login " + login);
				Log logIns = new Log(log);
				logIns.inserir();

				mensagemAlterar = "Usuário alterado com sucesso!";

			}

			request.getSession().setAttribute("pagina", "pesquisa_usuario.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.removeAttribute("cod_usuario");
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);
		}
		if ("excluir".equals(operacao)) {
			codFuncionario = Integer.parseInt(request
					.getParameter("txtCodfuncionario"));
			UsuarioTO usuario = new UsuarioTO();
			usuario.setCodfuncionario(codFuncionario);
			Usuario usuarioDel = new Usuario(usuario, null);
			usuarioDel.excluir(0);

			LogTO log = new LogTO(0, "Desativacao de Usuario", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Desativação de Usuario com o login " + login);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Usuário desativado com sucesso";
			request.getSession().setAttribute("pagina", "pesquisa_usuario.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}
		if ("ativar".equals(operacao)) {
			codFuncionario = Integer.parseInt(request
					.getParameter("txtCodfuncionario"));
			UsuarioTO usuario = new UsuarioTO();
			usuario.setCodfuncionario(codFuncionario);
			Usuario usuarioDel = new Usuario(usuario, null);
			usuarioDel.excluir(1);

			LogTO log = new LogTO(0, "Ativacao de Usuario", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Ativação de Usuario com o login " + login);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Usuário ativado com sucesso";
			request.getSession().setAttribute("pagina", "pesquisa_usuario.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

	}

}
