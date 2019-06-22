package controle;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ClassesException;
import modelo.EnderecoTO;
import modelo.Log;
import modelo.LogTO;
import modelo.Passageiro;
import modelo.PassageiroTO;

public class ServletPassageiro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int codigo_passageiro;
	private int codigo_convenio;
	private String nome;
	private String cpf;
	private String rua;
	private String numero;
	private String bairro;
	private String cidade;
	private String estado;
	private String operacao;
	private String cep;
	private String telefone;
	private String ddd;
	private String complemento;

	public ServletPassageiro() {
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

		codigo_passageiro = 0;
		codigo_convenio = 0;

		nome = request.getParameter("txtNome");
		cpf = request.getParameter("txtCpf");
		rua = request.getParameter("txtRua");
		numero = request.getParameter("txtNumero");
		bairro = request.getParameter("txtBairro");
		cidade = request.getParameter("txtCidade");
		estado = request.getParameter("txtEstado");
		cep = request.getParameter("txtCep");
		telefone = request.getParameter("txtTelefone");
		ddd = request.getParameter("txtDdd");
		complemento = request.getParameter("txtComplemento");
		operacao = request.getParameter("operacao");
		
		int iconveniado;
		String espacos=null;
		if (request.getParameter("txtCodConvenio") != null ) {
			espacos = request.getParameter("txtCodConvenio");
			espacos=espacos.trim();
			if(espacos.isEmpty()){
				request.getSession().setAttribute("codconvenio","");
				iconveniado = 0;
			}else{				
					codigo_convenio = Integer.parseInt(request
							.getParameter("txtCodConvenio"));
					request.getSession().setAttribute("codconvenio",codigo_convenio);
					iconveniado = 1;
		    }
		}else{				
			request.getSession().setAttribute("codconvenio","");
			iconveniado = 0;
	    }
		request.getSession().setAttribute("nome_passageiro", nome);
		request.getSession().setAttribute("cpf_passageiro", cpf);
		request.getSession().setAttribute("rua_passageiro", rua);
		request.getSession().setAttribute("numero_passageiro", numero);
		request.getSession().setAttribute("bairro_passageiro", bairro);
		request.getSession().setAttribute("cidade_passageiro", cidade);
		request.getSession().setAttribute("estado_passageiro", estado);
		request.getSession().setAttribute("cep_passageiro", cep);
		request.getSession().setAttribute("telefone_passageiro", telefone);
		request.getSession().setAttribute("ddd_passageiro", ddd);
		request.getSession()
		.setAttribute("complemento_passageiro", complemento);
		

		int iativo = 0;
		

		if ("consulta".equals(operacao)) {

			String resultado = "";
			String parametro = request.getParameter("parametroPassageiro");
			int tipoPesquisa = Integer.parseInt(request
					.getParameter("tipoPesquisa"));
			PassageiroTO passageiro = new PassageiroTO();

			String tipoCons = "";

			if (tipoPesquisa == 1) {

				passageiro.setCpf(parametro);
				tipoCons = "Cpf";

			} else if (tipoPesquisa == 2) {

				passageiro.setNome(parametro);
				tipoCons = "Nome";
			} else if (tipoPesquisa == 5) {

				passageiro.setTelefone(parametro);
				tipoCons = "Telefone";

			}

			Passageiro passageirosel = new Passageiro(passageiro);
			List<PassageiroTO> listaP = passageirosel.consultar(tipoPesquisa);
			Iterator<PassageiroTO> iterator = listaP.iterator();
			if (iterator.hasNext()) {
				resultado = "<table width=‘200’ border=‘1’>" + "<tr>"
				+ "<th>CPF</th>" + "<th>Nome</th>" + "<th>Ativo</th>"
				+ "</tr>";

				while (iterator.hasNext()) {

					PassageiroTO item = iterator.next();

					String sAtivo = "";

					if (item.getAtivo() == 1) {
						sAtivo = "Sim";
					} else {
						sAtivo = "Não";
					}

					resultado = resultado
					+ "<tr>"
					+ "<td>"
					+ item.getCpf()
					+ "</td>"
					+ "<td><a target='mainFrame' href=‘altera_passageiro.jsp?cod_passageiro="
					+ item.getCodigo_passageiro() + "’>"
					+ item.getNome() + "</a></td>" + "<td>" + sAtivo
					+ "</td>" + "</tr>";
				}

			} else {

				resultado = "<table>"
				+ "<tr>"
				+ "<td colspan=‘4’><div align=‘center’><strong>Nenhum dado Encontrado! </strong></div></td>"
				+ "</tr>";
			}

			resultado = resultado + "</table>";
			String resultadoFinal = resultado.replace("‘", "\"");
			resultadoFinal = resultadoFinal.replace("’", "\"");

			LogTO log = new LogTO(0, "Consulta de passageiro", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Consulta através do parâmetro " + parametro + " como "
					+ tipoCons);

			Log logIns = new Log(log);
			logIns.inserir();

			request.getSession().setAttribute("resultadoFinal", resultadoFinal);
			request.getRequestDispatcher("/HomePesquisa.jsp").forward(request,
					response);

		}
		if ("cadastro".equals(operacao)) {

			String mensagemIncluir = "";
			PassageiroTO passageiroVI = new PassageiroTO();
			passageiroVI.setCpf(cpf);
			Passageiro verificaPI = new Passageiro(passageiroVI);
			List<PassageiroTO> listaPI = verificaPI.consultar(1);

			if (listaPI.size() > 0) {

				mensagemIncluir = "O Cpf " + cpf
				+ " já consta cadastrado no sistema";

				request.getSession().setAttribute("pagina",
				"inclui_passageiro.jsp");

			} else {
				if (Boolean.parseBoolean(request.getParameter("txtAtivo"))) {
					iativo = 1;
				} else {
					iativo = 0;
				}
				PassageiroTO passageiro = new PassageiroTO(codigo_passageiro,
						codigo_convenio, nome, cpf, rua, numero, bairro,
						cidade, estado, cep, iconveniado, iativo, telefone,
						ddd, complemento);
				Passageiro passageiroIns = new Passageiro(passageiro);
				passageiroIns.inserir();

				LogTO log = new LogTO(0, "Inclusao de passageiro", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusao do passageiro com o cpf " + cpf);
				Log logIns = new Log(log);
				logIns.inserir();

				mensagemIncluir = "Passageiro Incluído com sucesso!";

				request.getSession().setAttribute("pagina",
				"pesquisa_passageiro.jsp");

			}

			request.getSession().setAttribute("mensagem", mensagemIncluir);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);
		}

		if ("alteracao".equals(operacao)) {

			String mensagemAlterar = "";

			if (Boolean.parseBoolean(request.getParameter("txtAtivo"))) {
				iativo = 1;
			} else {
				iativo = 0;
			}
			codigo_passageiro = Integer.parseInt(request
					.getParameter("txtCodpassageiro"));
			PassageiroTO passageiro = null;
			if (codigo_convenio == 0) {
				passageiro = new PassageiroTO(codigo_passageiro,
						codigo_convenio, nome, cpf, rua, numero, bairro,
						cidade, estado, cep, iconveniado, iativo, telefone,
						ddd, complemento);
			} else {
				passageiro = new PassageiroTO(codigo_passageiro,
						codigo_convenio, nome, cpf, rua, numero, bairro,
						cidade, estado, cep, iconveniado, iativo, telefone,
						ddd, complemento);
			}
			Passageiro passageiroUp = new Passageiro(passageiro);
			passageiroUp.alterar();

			LogTO log = new LogTO(0, "Alteracao de passageiro", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Alteração do passageiro com o cpf " + cpf);
			Log logIns = new Log(log);
			logIns.inserir();

			mensagemAlterar = "Passageiro alterado com sucesso";

			request.getSession().setAttribute("pagina",
			"pesquisa_passageiro.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("excluir".equals(operacao)) {
			codigo_passageiro = Integer.parseInt(request
					.getParameter("txtCodpassageiro"));
			PassageiroTO passageiro = new PassageiroTO();
			passageiro.setCodigo_passageiro(codigo_passageiro);
			Passageiro passageiroDel = new Passageiro(passageiro);
			passageiroDel.excluir(0);
			request.getSession().setAttribute("pagina",
			"pesquisa_passageiro.jsp");
			LogTO log = new LogTO(0, "Desativacao de passageiro", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Desativação de passageiro com o cpf " + cpf);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Passageiro desativado com sucesso";
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("ativar".equals(operacao)) {
			codigo_passageiro = Integer.parseInt(request
					.getParameter("txtCodpassageiro"));
			PassageiroTO passageiro = new PassageiroTO();
			passageiro.setCodigo_passageiro(codigo_passageiro);
			Passageiro passageiroDel = new Passageiro(passageiro);
			passageiroDel.excluir(1);
			request.getSession().setAttribute("pagina",
			"pesquisa_passageiro.jsp");

			LogTO log = new LogTO(0, "Ativacao de passageiro", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Ativação de passageiro com o cpf " + cpf);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Passageiro ativado com sucesso";
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("chamadoEndPadraoAlterar".equals(operacao)) {

			rua = request.getParameter("txtRua");
			nome = request.getParameter("txtNome");
			numero = request.getParameter("txtNumero");
			bairro = request.getParameter("txtBairro");
			cidade = request.getParameter("txtCidade");
			estado = request.getParameter("txtEstado");
			cep = request.getParameter("txtCep");
			complemento = request.getParameter("txtComplemento");
			codigo_passageiro = Integer.parseInt(request
					.getParameter("txtCodpassageiro"));

			request.getSession().setAttribute("txtRua", rua);
			request.getSession().setAttribute("txtNome", nome);
			request.getSession().setAttribute("txtNumero", numero);
			request.getSession().setAttribute("txtComplementoOrigem",
					complemento);
			request.getSession().setAttribute("txtBairro", bairro);
			request.getSession().setAttribute("txtCidade", cidade);
			request.getSession().setAttribute("txtEstado", estado);
			request.getSession().setAttribute("txtCep", cep);
			request.getSession().setAttribute("txtCodigoPassageiro",
					codigo_passageiro);

			request.getSession().setAttribute("rua_destino", "");
			request.getSession().setAttribute("numero_destino", "");
			request.getSession().setAttribute("bairro_destino", "");
			request.getSession().setAttribute("cidade_destino", "");
			request.getSession().setAttribute("estado_destino", "");
			request.getSession().setAttribute("cep_destino", "");
			request.getSession().setAttribute("complemento_destino", "");
			
			request.getSession().setAttribute("pagina_passageiro", "altera_passageiro.jsp?cod_passageiro="+codigo_passageiro);
			
			request.getRequestDispatcher("inclui_chamado.jsp").forward(request,
					response);
			

		}
		
		if ("chamadoEndAlternativoAlterar".equals(operacao)) {

			nome = request.getParameter("txtNome");
			codigo_passageiro = Integer.parseInt(request
					.getParameter("txtCodpassageiro"));

			request.getSession().setAttribute("txtNome", nome);

			request.getSession().setAttribute("txtCodigoPassageiro",
					codigo_passageiro);
			
			request.getSession().setAttribute("txtRua", "");
			request.getSession().setAttribute("txtNumero", "");
			request.getSession().setAttribute("txtBairro", "");
			request.getSession().setAttribute("txtCidade", "");
			request.getSession().setAttribute("txtEstado", "");
			request.getSession().setAttribute("txtCep", "");
			request.getSession().setAttribute("txtComplementoOrigem", "");
			
			request.getSession().setAttribute("rua_destino", "");
			request.getSession().setAttribute("numero_destino", "");
			request.getSession().setAttribute("bairro_destino", "");
			request.getSession().setAttribute("cidade_destino", "");
			request.getSession().setAttribute("estado_destino", "");
			request.getSession().setAttribute("cep_destino", "");
			request.getSession().setAttribute("complemento_destino", "");
			
			request.getSession().setAttribute("pagina_passageiro", "altera_passageiro.jsp?cod_passageiro="+codigo_passageiro);
			
			request.getRequestDispatcher("inclui_chamado.jsp").forward(request,
					response);

		}


		if ("chamadoEndPadraoIncluir".equals(operacao)) {

			String mensagemIncluir = "";
			int cod_passageiro = 0;
			PassageiroTO passageiroVI = new PassageiroTO();
			passageiroVI.setCpf(cpf);
			Passageiro verificaPI = new Passageiro(passageiroVI);
			List<PassageiroTO> listaPI = verificaPI.consultar(1);

			if (listaPI.size() > 0) {

				mensagemIncluir = "O Cpf " + cpf
				+ " já consta cadastrado no sistema";

				request.getSession().setAttribute("pagina",
				"inclui_passageiro.jsp");
				request.getSession().setAttribute("mensagem", mensagemIncluir);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);

			} else {
				if (Boolean.parseBoolean(request.getParameter("txtAtivo"))) {
					iativo = 1;
				} else {
					iativo = 0;
				}
				PassageiroTO passageiro = new PassageiroTO(codigo_passageiro,
						codigo_convenio, nome, cpf, rua, numero, bairro,
						cidade, estado, cep, iconveniado, iativo, telefone,
						ddd, complemento);
				Passageiro passageiroIns = new Passageiro(passageiro);
				cod_passageiro = passageiroIns.inserir();

				LogTO log = new LogTO(0, "Inclusao de passageiro", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusao do passageiro com o cpf " + cpf);
				Log logIns = new Log(log);
				logIns.inserir();

				request.getSession().setAttribute("txtRua", rua);
				request.getSession().setAttribute("txtNome", nome);
				request.getSession().setAttribute("txtNumero", numero);
				request.getSession().setAttribute("txtBairro", bairro);
				request.getSession().setAttribute("txtCidade", cidade);
				request.getSession().setAttribute("txtEstado", estado);
				request.getSession().setAttribute("txtCep", cep);
				request.getSession().setAttribute("txtComplementoOrigem",
						complemento);
				request.getSession().setAttribute("txtCodigoPassageiro",
						cod_passageiro);

				request.getSession().setAttribute("rua_destino", "");
				request.getSession().setAttribute("numero_destino", "");
				request.getSession().setAttribute("bairro_destino", "");
				request.getSession().setAttribute("cidade_destino", "");
				request.getSession().setAttribute("estado_destino", "");
				request.getSession().setAttribute("cep_destino", "");
				request.getSession().setAttribute("complemento_destino", "");
				
				request.getSession().setAttribute("pagina_passageiro", "altera_passageiro.jsp?cod_passageiro="+cod_passageiro);

				request.getRequestDispatcher("inclui_chamado.jsp").forward(
						request, response);

			}

		}

		if ("chamadoEndAlternativoIncluir".equals(operacao)) {

			String mensagemIncluir = "";
			int cod_passageiro = 0;
			PassageiroTO passageiroVI = new PassageiroTO();
			passageiroVI.setCpf(cpf);
			Passageiro verificaPI = new Passageiro(passageiroVI);
			List<PassageiroTO> listaPI = verificaPI.consultar(1);

			if (listaPI.size() > 0) {

				mensagemIncluir = "O Cpf " + cpf
				+ " já consta cadastrado no sistema";

				request.getSession().setAttribute("pagina",
				"inclui_passageiro.jsp");
				request.getSession().setAttribute("mensagem", mensagemIncluir);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);

			} else {
				if (Boolean.parseBoolean(request.getParameter("txtAtivo"))) {
					iativo = 1;
				} else {
					iativo = 0;
				}
				PassageiroTO passageiro = new PassageiroTO(codigo_passageiro,
						codigo_convenio, nome, cpf, rua, numero, bairro,
						cidade, estado, cep, iconveniado, iativo, telefone,
						ddd, complemento);
				Passageiro passageiroIns = new Passageiro(passageiro);
				cod_passageiro = passageiroIns.inserir();

				LogTO log = new LogTO(0, "Inclusao de passageiro", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusao do passageiro com o cpf " + cpf);
				Log logIns = new Log(log);
				logIns.inserir();

				request.getSession().setAttribute("txtNome", nome);
				request.getSession().setAttribute("txtCodigoPassageiro",
						cod_passageiro);
				
				request.getSession().setAttribute("txtRua", "");
				request.getSession().setAttribute("txtNumero", "");
				request.getSession().setAttribute("txtBairro", "");
				request.getSession().setAttribute("txtCidade", "");
				request.getSession().setAttribute("txtEstado", "");
				request.getSession().setAttribute("txtCep", "");
				request.getSession().setAttribute("txtComplementoOrigem", "");
				

				request.getSession().setAttribute("rua_destino", "");
				request.getSession().setAttribute("numero_destino", "");
				request.getSession().setAttribute("bairro_destino", "");
				request.getSession().setAttribute("cidade_destino", "");
				request.getSession().setAttribute("estado_destino", "");
				request.getSession().setAttribute("cep_destino", "");
				request.getSession().setAttribute("complemento_destino", "");
				
				request.getSession().setAttribute("pagina_passageiro", "altera_passageiro.jsp?cod_passageiro="+cod_passageiro);

				request.getRequestDispatcher("inclui_chamado.jsp").forward(
						request, response);

			}

		}

		
		if("consultaEndereco".equals(operacao)){

			String cep = request.getSession().getAttribute("cep_passageiro").toString();
			EnderecoTO endereco = new EnderecoTO();
			endereco.setCep(cep);
			Passageiro passageiroEnd = new Passageiro(null);
			List<EnderecoTO> lista = passageiroEnd.consultarEndereco(endereco);

			if (lista.size()==0){

				String mensagem = "O CEP "+cep+" não é válido";

				request.getSession().setAttribute("pagina","inclui_passageiro.jsp");
				request.getSession().setAttribute("mensagem", mensagem);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);



			}else{

				request.getSession().setAttribute("rua_passageiro",lista.get(0).getRua());
				request.getSession().setAttribute("numero_passageiro", lista.get(0).getNumero());
				request.getSession().setAttribute("bairro_passageiro", lista.get(0).getBairro());
				request.getSession().setAttribute("cidade_passageiro", lista.get(0).getCidade());
				request.getSession().setAttribute("estado_passageiro", lista.get(0).getEstado());

				request.getRequestDispatcher("inclui_passageiro.jsp").forward(request,
						response);	

			}
		}

	}
}
