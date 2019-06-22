package controle;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ClassesException;
import modelo.Convenio;
import modelo.ConvenioTO;
import modelo.EnderecoTO;
import modelo.Log;
import modelo.LogTO;
import modelo.Passageiro;
import modelo.PassageiroTO;

public class ServletConvenio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int codigo_convenio;
	private String razaoSocial;
	private String nomeFantasia;
	private String cnpj;
	private String cidade;
	private String estado;
	private String numero;
	private String rua;
	private String bairro;
	private String cep;
	private String telefone;
	private String ddd;
	private String complemento;
	private boolean ativo;
	private String dataInclusao;
	private String operacao;
	private String valor_limite;
	private String valor_gasto;
	
	

	public ServletConvenio() {
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

		codigo_convenio = 0;
		razaoSocial = request.getParameter("txtRazaoSocial");
		nomeFantasia = request.getParameter("txtNomeFantasia");
		cnpj = request.getParameter("txtCnpj");
		cidade = request.getParameter("txtCidade");
		estado = request.getParameter("txtEstado");
		numero = request.getParameter("txtNumero");
		rua = request.getParameter("txtRua");
		bairro = request.getParameter("txtBairro");
		cep = request.getParameter("txtCep");
		ativo = request.getParameter("txtAtivo") != null;
		dataInclusao = request.getParameter("txtDataInclusao");
		operacao = request.getParameter("operacao");
		telefone = request.getParameter("txtTelefone");
		ddd = request.getParameter("txtDdd");
		complemento = request.getParameter("txtComplemento");
		valor_limite = request.getParameter("txtValorLimite");
		valor_gasto = request.getParameter("txtValorGasto");
		
		if (valor_limite!=null){
		
			valor_limite = valor_limite.replace(",", ".");
		}else{
			
			valor_gasto="0";
	     }
		

		if (valor_gasto!=null){
			
			valor_gasto = valor_gasto.replace(",", ".");
		}else{
			
			valor_gasto="0";
		}
		request.getSession().setAttribute("razaoSocial", razaoSocial);
		request.getSession().setAttribute("nomeFantasia", nomeFantasia);
		request.getSession().setAttribute("cnpj_convenio", cnpj);
		request.getSession().setAttribute("cidade_convenio", cidade);
		request.getSession().setAttribute("estado_convenio", estado);
		request.getSession().setAttribute("numero_convenio", numero);
		request.getSession().setAttribute("rua_convenio", rua);
		request.getSession().setAttribute("bairro_convenio", bairro);
		request.getSession().setAttribute("cep_convenio", cep);
		request.getSession().setAttribute("telefone_convenio", telefone);
		request.getSession().setAttribute("complemento_convenio", complemento);
		request.getSession().setAttribute("telefone_convenio", telefone);
		request.getSession().setAttribute("ddd_convenio", ddd);
		request.getSession().setAttribute("valor_limite", valor_limite);
		request.getSession().setAttribute("valor_gasto", valor_gasto);

		int iativo;

		if (ativo == true) {

			iativo = 1;
		} else {

			iativo = 0;
		}

		if ("consulta".equals(operacao)) {

			String resultado = "";
			String parametro = request.getParameter("parametroConvenio");
			int tipoPesquisa = Integer.parseInt(request
					.getParameter("tipoPesquisa"));
			ConvenioTO convenio = new ConvenioTO();

			String tipoCons = "";

			if (tipoPesquisa == 1) {

				convenio.setRazao_social(parametro);
				tipoCons = "Razão social";
			} else if(tipoPesquisa==2){

				convenio.setCnpj(parametro);
				tipoCons = "Cnpj";
			}

			Convenio convenioSel = new Convenio(convenio);
			List<ConvenioTO> listaC = convenioSel.consultar(tipoPesquisa);
			Iterator<ConvenioTO> iterator = listaC.iterator();
			if (iterator.hasNext()) {
				resultado = "<table width=‘51%’ border=‘1’>" + "<tr>"
						+ "<th width=‘29%’>Cnpj</th>"
						+ "<th width=‘41%’>Raz&atilde;o Social </th>"
						+ "<th width=‘30%’>Ativo</th>" + "</tr>";

				while (iterator.hasNext()) {
					ConvenioTO item = iterator.next();
					String sAtivo = "";
					if (item.getAtivo() == 1) {
						sAtivo = "Sim";
					} else {
						sAtivo = "Não";
					}
					resultado = resultado
							+ "<tr>"
							+ "<td>"
							+ item.getCnpj()
							+ "</td>"
							+ "<td>"
							+ "<a target='mainFrame' href=‘altera_convenio.jsp?codConvenio="
							+ item.getCodigo_convenio() + "’>"
							+ item.getRazao_social() + "</a></td><td>" + sAtivo
							+ "</td>" + "</tr>";

				}

			} else {

				resultado = resultado
						+ "<tr>"
						+ "<td colspan=‘4’><div align=‘center’><strong>Nenhum dado Encontrado! </strong></div></td>"
						+ "</tr>";

			}

			resultado = resultado + "</table>";
			String resultadoFinal = resultado.replace("‘", "\"");
			resultadoFinal = resultadoFinal.replace("’", "\"");

			LogTO log = new LogTO(0, "Consulta de convenio", "U", request
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

		
			String mensagemIncluir = "";
			ConvenioTO convenioVI = new ConvenioTO();
			convenioVI.setCnpj(cnpj);
			Convenio verificaCI = new Convenio(convenioVI);
			List<ConvenioTO> listaCI = verificaCI.consultar(2);

			if (listaCI.size() > 0) {

				mensagemIncluir = "O Cnpj " + cnpj
						+ " já consta cadastrado no sistema";
				request.getSession().setAttribute("pagina",
						"inclui_convenio.jsp");

			} else {
				
				valor_gasto="0";

				ConvenioTO convenio = new ConvenioTO(codigo_convenio, razaoSocial, nomeFantasia, cnpj, cidade,
						estado, rua, bairro, numero, cep, iativo, dataInclusao,
						complemento,telefone,ddd,valor_limite,valor_gasto);
				Convenio convenioIns = new Convenio(convenio);
				convenioIns.inserir();

				request.getSession().setAttribute("pagina",
						"pesquisa_convenio.jsp");

				LogTO log = new LogTO(0, "Inclusao de convenio", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusão do convênio com o cnpj " + cnpj);
				Log logIns = new Log(log);
				logIns.inserir();

				mensagemIncluir = "Convênio incluido com sucesso!";
			}
			request.getSession().setAttribute("mensagem", mensagemIncluir);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("alteracao".equals(operacao)) {

			
			codigo_convenio = Integer.parseInt(request
					.getParameter("txtCodconvenio"));
						String mensagemAlterar = "";
		
				ConvenioTO convenio = new ConvenioTO(codigo_convenio, razaoSocial, nomeFantasia,
						cnpj, cidade, estado, rua, bairro, numero, cep, iativo,
						dataInclusao, complemento, telefone, ddd, valor_limite, valor_gasto);
				Convenio convenioUp = new Convenio(convenio);
				convenioUp.alterar();

				LogTO log = new LogTO(0, "Alteracao de convenio", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Alteração do convênio com o cnpj " + cnpj);
				Log logIns = new Log(log);
				logIns.inserir();

				request.getSession().setAttribute("pagina",
						"pesquisa_convenio.jsp");
				mensagemAlterar = "Empresa alterada com sucesso";
			
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);
	
		}

		if ("excluir".equals(operacao)) {
			codigo_convenio = Integer.parseInt(request
					.getParameter("txtCodconvenio"));
			ConvenioTO convenio = new ConvenioTO();
			convenio.setCodigo_convenio(codigo_convenio);
			Convenio convenioDel = new Convenio(convenio);
			convenioDel.excluir(0);

			LogTO log = new LogTO(0, "Desativacao de convenio", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Desativação de convênio com o cnpj " + cnpj);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Convênio desativado com sucesso";
			request.getSession()
					.setAttribute("pagina", "pesquisa_convenio.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("ativar".equals(operacao)) {
			codigo_convenio = Integer.parseInt(request
					.getParameter("txtCodconvenio"));
			ConvenioTO convenio = new ConvenioTO();
			convenio.setCodigo_convenio(codigo_convenio);
			Convenio convenioDel = new Convenio(convenio);
			convenioDel.excluir(1);

			LogTO log = new LogTO(0, "Ativacao de convenio", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Ativação de convênio com o cnpj " + cnpj);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Convênio ativado com sucesso";
			request.getSession()
					.setAttribute("pagina", "pesquisa_convenio.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("incluirpassageiro".equals(operacao)) {

			ConvenioTO convenio = new ConvenioTO(codigo_convenio, razaoSocial, nomeFantasia,
					cnpj, cidade, estado, rua, bairro, numero, cep, iativo,
					dataInclusao, complemento, telefone, ddd, valor_limite,valor_gasto);
			Convenio convenioSel = new Convenio(convenio);
			ConvenioTO dadosconvenio = new ConvenioTO();
			dadosconvenio = convenioSel.pegarCodConvenio();

			request.getSession().setAttribute("nome_passageiro", "");
			request.getSession().setAttribute("cpf_passageiro", "");
			request.getSession().setAttribute("rua_passageiro", "");
			request.getSession().setAttribute("numero_passageiro", "");
			request.getSession().setAttribute("bairro_passageiro", "");
			request.getSession().setAttribute("cidade_passageiro", "");
			request.getSession().setAttribute("estado_passageiro", "");
			request.getSession().setAttribute("cep_passageiro", "");
			request.getSession().setAttribute("telefone_passageiro", "");
			request.getSession().setAttribute("ddd_passageiro", "");
			request.getSession().setAttribute("complemento_passageiro", "");

			request.getSession().setAttribute("codconvenio",
					dadosconvenio.getCodigo_convenio());
			request.getSession().setAttribute("conveniado", "sim");
			request.getRequestDispatcher("inclui_passageiro.jsp").forward(
					request, response);

		}

		if ("listarpassageiro".equals(operacao)) {

			String resultado = "";
			PassageiroTO passageiro = new PassageiroTO();
			int codConvenio = Integer.parseInt(request
					.getParameter("txtCodconvenio"));
			passageiro.setCodigo_convenio(codConvenio);

			Passageiro passageirosel = new Passageiro(passageiro);
			List<PassageiroTO> listaP = passageirosel.consultar(6);
			Iterator<PassageiroTO> iterator = listaP.iterator();
			if (iterator.hasNext()) {
				resultado = "<table width=‘200’ border=‘1’>" + "<tr>"
						+ "<td>CPF</td>" + "<td>Nome</td>" + "<td>Ativo</td>"
						+ "</tr>";

				while (iterator.hasNext()) {

					PassageiroTO item = iterator.next();

					String sAtivo = "";

					if (item.getAtivo() == 1) {
						sAtivo = "Sim";
					} else {
						sAtivo = "Não";
					}

					resultado = resultado + "<tr>" + "<td>" + item.getCpf()
							+ "</td>" + "<td>" + item.getNome() + "</td>"
							+ "<td>" + sAtivo + "</td>" + "</tr>";
				}

			} else {

				resultado = resultado
						+ "<tr>"
						+ "<td colspan=‘4’><div align=‘center’><strong>Nenhum dado Encontrado! </strong></div></td>"
						+ "</tr>";
			}

			resultado = resultado + "</table>";
			String resultadoFinal = resultado.replace("‘", "\"");
			resultadoFinal = resultadoFinal.replace("’", "\"");

			LogTO log = new LogTO(0, "Consulta de passageiro por convenio", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Consulta através da tela de alteração do convênio código "
							+ codConvenio);
			Log logIns = new Log(log);
			logIns.inserir();

			request.getSession().setAttribute("origem", "convenio");
			request.getSession().setAttribute("resultadoFinal", resultadoFinal);
			request.getRequestDispatcher("lista_passageiros.jsp?cod_convenio="+codConvenio).forward(request,
					response);

		}
		
		if ("zerarValor".equals(operacao)) {
			codigo_convenio = Integer.parseInt(request
					.getParameter("txtCodconvenio"));
			ConvenioTO convenio = new ConvenioTO();
			convenio.setCodigo_convenio(codigo_convenio);
			Convenio convenioAlt = new Convenio(convenio);
			convenioAlt.zerarValorGasto();

			LogTO log = new LogTO(0, "Atulaização de valorgasto", "U", request
					.getSession().getAttribute("login").toString(), null,
					"Atribuição de 0 ao valor gasto do convenio de cnpj " + cnpj);
			Log logIns = new Log(log);
			logIns.inserir();

			String mensagemAlterar = "Valor atulaizado com sucesso!";
			request.getSession()
					.setAttribute("pagina", "pesquisa_convenio.jsp");
			request.getSession().setAttribute("mensagem", mensagemAlterar);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}



			
	
	if("consultaEndereco".equals(operacao)){

		String cep = request.getSession().getAttribute("cep_convenio").toString();
		EnderecoTO endereco = new EnderecoTO();
		endereco.setCep(cep);
		Convenio convenioEnd = new Convenio(null);
		List<EnderecoTO> lista = convenioEnd.consultarEndereco(endereco);

		if (lista.size()==0){

			String mensagem = "O CEP "+cep+" não é válido";

			request.getSession().setAttribute("pagina","inclui_convenio.jsp");
			request.getSession().setAttribute("mensagem", mensagem);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);



		}else{

			request.getSession().setAttribute("rua_convenio",lista.get(0).getRua());
			request.getSession().setAttribute("numero_convenio", lista.get(0).getNumero());
			request.getSession().setAttribute("bairro_convenio", lista.get(0).getBairro());
			request.getSession().setAttribute("cidade_convenio", lista.get(0).getCidade());
			request.getSession().setAttribute("estado_convenio", lista.get(0).getEstado());

			request.getRequestDispatcher("inclui_convenio.jsp").forward(request,
					response);	

		}
	}

}

}
