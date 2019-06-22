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
import modelo.Motorista;
import modelo.MotoristaTO;

public class ServletMotorista extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int codFuncionario;
	private String cpf;
	private String rg;
	private String telefone;
	private String nome;
	private int ano_veiculo;
	private String ddd;
	private String id_dispositivo;
	private String modelo_veiculo;
	private String placa;
	private String proprietario;
	private String senha;
	private String operacao;
	private String dataInclusao;
	

	public ServletMotorista() {
		super();

	}

	protected void doGet(HttpServletRequest request,
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
			throws ServletException, IOException, ClassesException {

		codFuncionario = 0;
		cpf = request.getParameter("txtCpf");
		rg = request.getParameter("txtRg");
		telefone = request.getParameter("txtTelefone");
		ddd = request.getParameter("txtDdd");
		nome = request.getParameter("txtNome");
		id_dispositivo = request.getParameter("txtDispositivo");
		modelo_veiculo = request.getParameter("txtModelo");
		placa = request.getParameter("txtPlaca");
		proprietario = request.getParameter("txtProprietario");
		senha = request.getParameter("txtSenha");
		dataInclusao = request.getParameter("txtDataInclusao");
		operacao = request.getParameter("operacao");
		

		request.getSession().setAttribute("cpf_motorista", cpf);
		request.getSession().setAttribute("rg_motorista", rg);
		request.getSession().setAttribute("telefone_motorista", telefone);
		request.getSession().setAttribute("ddd_motorista", ddd);
		request.getSession().setAttribute("nome_motorista", nome);
		request.getSession().setAttribute("id_dispositivo_motorista",
				id_dispositivo);
		request.getSession().setAttribute("modelo_motorista", modelo_veiculo);
		request.getSession().setAttribute("placa_motorista", placa);

		int iproprietario;
		int iativo = 0;

		if (operacao.equals("alteracao") || (operacao.equals("cadastro"))) {
			if (request.getParameter("txtAno") != "") {
				ano_veiculo = Integer.parseInt(request.getParameter("txtAno"));
				request.getSession().setAttribute("ano_motorista", ano_veiculo);
			}
		}
		if ("true".equals(proprietario)) {

			iproprietario = 1;

		} else {

			iproprietario = 0;
		}

		if ("consulta".equals(operacao)) {
			boolean cabecalho=false;
			boolean encontrou=false;
			String resultado = "";
			String parametro = request.getParameter("txtParametroMotorista");
			int tipoPesquisa = Integer.parseInt(request
					.getParameter("tipoPesquisa"));
			FuncionarioTO funcionario = new FuncionarioTO();
			MotoristaTO motorista = new MotoristaTO();
			String tipoCons = "";
			if (tipoPesquisa == 1) {

				funcionario.setCpf(parametro);
				tipoCons = "Cpf";
			} else if (tipoPesquisa == 2) {
				funcionario.setCodfuncionario(Integer.parseInt(parametro));
				tipoCons = "Código funcional";
			}else if (tipoPesquisa == 6) {
				funcionario.setNome(parametro);
				tipoCons = "Nome funcionário";
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
				motorista.setCodfuncionario(itemF.getCodfuncionario());
				Motorista motoristaSel = new Motorista(motorista, null);
				List<MotoristaTO> listaM = motoristaSel.consultar(1);
				Iterator<MotoristaTO> iteratorM = listaM.iterator();				
				while (iteratorM.hasNext()) {
					if (!cabecalho){
						resultado = "<table width=‘78%’ border=‘1’>" + "<tr>"
						+ "<th width=‘164’>CPF</th>"
						+ "<th width=‘260’>C&oacute;digo</th>"
						+ "<th width=‘319’>Nome</th>"
						+ "<th width=‘189’>Ativo</th>" + "</tr>";
						cabecalho=true;
						encontrou=true;
					}
					MotoristaTO itemM = iteratorM.next();
					String sAtivo = "";
					if (itemM.getAtivo() == 1) {
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
							+ itemM.getCodfuncionario()
							+ "</td>"
							+ "<td><a target = 'mainFrame' href=‘altera_motorista.jsp?cod_funcionario="
							+ itemM.getCodfuncionario() + "’>"
							+ itemF.getNome() + "</a></td>" + "<td>" + sAtivo
							+ "</td>" + "</tr>";
				}

			} 
			if (!encontrou){
				resultado = "<table>"
					+ "<tr>"
					+ "<td colspan=‘4’><div align=‘center’><strong>Nenhum dado Encontrado! </strong></div></td>"
					+ "</tr>";
			}
			resultado = resultado + "</table>";
			String resultadoFinal = resultado.replace("‘", "\"");
			resultadoFinal = resultadoFinal.replace("’", "\"");

			LogTO log = new LogTO(0, "Consulta de motorista", "U", request
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
			iativo = 1;

			String mensagemIncluir = "";
			FuncionarioTO funcionarioVI = new FuncionarioTO();
			funcionarioVI.setCpf(cpf);
			funcionarioVI.setRg(rg);
			// mudei akii
			funcionarioVI.setCodfuncionario(codFuncionario);
			Funcionario verificaFI = new Funcionario(funcionarioVI);
			List<FuncionarioTO> listaVerificaCpfI = verificaFI.consultar(1);
			List<FuncionarioTO> listaVerificaRgI = null;
			if (rg != "") {
				listaVerificaRgI = verificaFI.consultar(3);
			}
			MotoristaTO motoristaVI = new MotoristaTO();
			motoristaVI.setId_dispositivo(Integer.parseInt(id_dispositivo));
			// aki tb alterei mudei o numero do where pra 3
			motoristaVI.setCodfuncionario(codFuncionario);
			Motorista verificaMI = new Motorista(motoristaVI, null);
			List<MotoristaTO> listaVerificaDispositivoI = verificaMI
					.consultar(2);

			if (listaVerificaCpfI.size() > 0) {

				mensagemIncluir = "O CPF " + cpf
						+ " já consta cadastrado no sistema ";
				request.getSession().setAttribute("pagina",
						"inclui_motorista.jsp");

			} else if ((listaVerificaRgI != null)
					&& listaVerificaRgI.size() > 0) {

				mensagemIncluir = "O Rg " + rg
						+ " já consta cadastrado no sistema ";
				request.getSession().setAttribute("pagina",
						"inclui_motorista.jsp");

			} else if (listaVerificaDispositivoI.size() > 0) {

				mensagemIncluir = "O Id do dispositivo " + id_dispositivo
						+ " já consta cadastrado no sistema ";
				request.getSession().setAttribute("pagina",
						"inclui_motorista.jsp");

			} else {
				
				MotoristaTO motorista = new MotoristaTO(codFuncionario,
						ano_veiculo, Integer.parseInt(id_dispositivo),
						modelo_veiculo, placa, iproprietario, iativo, senha,
						dataInclusao);
				FuncionarioTO funcionario = new FuncionarioTO(codFuncionario,
						cpf, rg, telefone, nome,ddd);
				Motorista motoristaIns = new Motorista(motorista, funcionario);
				int cod_motorista = motoristaIns.inserir();

				request.getSession().setAttribute("pagina",
						"pesquisa_motorista.jsp");

				LogTO log = new LogTO(0, "Inclusao de motorista", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusao do motorista com o id_dispositivo "
								+ id_dispositivo);
				Log logIns = new Log(log);
				logIns.inserir();

				mensagemIncluir = "Motorista incluído com sucesso! "
						+ "Código funcional: " + cod_motorista;
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
			if (rg != "") {
				listaVerificaRgA = verificaFA.consultar(4);
			}

			MotoristaTO motoristaVA = new MotoristaTO();
			motoristaVA.setId_dispositivo(Integer.parseInt(id_dispositivo));
			motoristaVA.setCodfuncionario(codFuncionario);
			Motorista verificaMA = new Motorista(motoristaVA, null);
			List<MotoristaTO> listaVerificaDispositivoA = verificaMA
					.consultar(3);

			if ((listaVerificaRgA != null) && listaVerificaRgA.size() > 0) {

				mensagemAlterar = "O Rg " + rg
						+ " já consta cadastado no sistema ";

				request.getSession().setAttribute("pagina",
						"altera_motorista.jsp");

			} else if (listaVerificaDispositivoA.size() > 0) {

				mensagemAlterar = "O Id do dispositivo " + id_dispositivo
						+ " já consta cadastado no sistema ";

				request.getSession().setAttribute("pagina",
						"altera_motorista.jsp");

			} else {

				MotoristaTO motorista = new MotoristaTO(codFuncionario,
						ano_veiculo, Integer.parseInt(id_dispositivo),
						modelo_veiculo, placa, iproprietario, iativo, senha,
						dataInclusao);
				FuncionarioTO funcionario = new FuncionarioTO(codFuncionario,
						cpf, rg, telefone, nome,ddd);
				Motorista motoristaUp = new Motorista(motorista, null);
				Funcionario funcionarioup = new Funcionario(funcionario);
				motoristaUp.alterar();
				funcionarioup.alterar();

				request.getSession().setAttribute("pagina",
						"pesquisa_motorista.jsp");

				LogTO log = new LogTO(0, "Alteracao de motorista", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Alteração do motorista com o id_dispositivo "
								+ id_dispositivo);
				Log logIns = new Log(log);
				logIns.inserir();

				mensagemAlterar = "Motorista alterado com sucesso";

			}

			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);
		}

		if ("excluir".equals(operacao)) {
			MotoristaTO motorista = new MotoristaTO();
			motorista.setId_dispositivo(Integer.parseInt(id_dispositivo));
			Motorista motoristaDel = new Motorista(motorista, null);
			motoristaDel.excluir(0);

			LogTO log = new LogTO(0, "Desativacao de motorista", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Desativação de motorista com o id_dispositivo "
							+ id_dispositivo);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Motorista desativado com sucesso";
			request.getSession().setAttribute("pagina", "pesquisa_motorista.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}
		if ("ativar".equals(operacao)) {
			MotoristaTO motorista = new MotoristaTO();
			motorista.setId_dispositivo(Integer.parseInt(id_dispositivo));
			Motorista motoristaDel = new Motorista(motorista, null);
			motoristaDel.excluir(1);

			LogTO log = new LogTO(0, "Ativacao de motorista", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Ativação de motorista com o id_dispositivo "
							+ id_dispositivo);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Motorista ativado com sucesso";
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

	}
}
