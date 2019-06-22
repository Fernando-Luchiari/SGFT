package controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.impl.DefineMotorista;

//import dao.impl.DefineMotorista;

import modelo.Chamado_Cliente;
import modelo.Chamado_ClienteTO;
import modelo.ClassesException;
import modelo.EnderecoTO;
import modelo.Log;
import modelo.LogTO;
import modelo.Passageiro;
import modelo.PassageiroTO;
import modelo.Status;
import modelo.StatusTO;

public class ServletChamado_Cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int codigo_chamado;
	private int codigo_status;
	private String codigo_passageiro;
	private String numero_origem;
	private String rua_origem;
	private String bairro_origem;
	private String cidade_origem;
	private String estado_origem;
	private String cep_origem;
	private String rua_destino;
	private String numero_destino;
	private String bairro_destino;
	private String cidade_destino;
	private String estado_destino;
	private String cep_destino;
	private String dataInclusao;
	private String operacao;
	private String complemento_origem;
	private String complemento_destino;
	private String convenio;

	public ServletChamado_Cliente() {
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

		codigo_chamado = 0;
		codigo_status = 1;
		codigo_passageiro = request.getParameter("txtCodPassageiro");
		rua_origem = request.getParameter("txtRuaOrigem");
		numero_origem = request.getParameter("txtNumeroOrigem");
		bairro_origem = request.getParameter("txtBairroOrigem");
		cidade_origem = request.getParameter("txtCidadeOrigem");
		estado_origem = request.getParameter("txtEstadoOrigem");
		cep_origem = request.getParameter("txtCepOrigem");
		rua_destino = request.getParameter("txtRuaDestino");
		numero_destino = request.getParameter("txtNumeroDestino");
		bairro_destino = request.getParameter("txtBairroDestino");
		cidade_destino = request.getParameter("txtCidadeDestino");
		estado_destino = request.getParameter("txtEstadoDestino");
		cep_destino = request.getParameter("txtCepDestino");
		dataInclusao = request.getParameter("txtDataInclusao");
		complemento_origem = request.getParameter("txtComplementoOrigem");
		complemento_destino = request.getParameter("txtComplementoDestino");
		operacao = request.getParameter("operacao");
		
		
		if (request.getSession().getAttribute("checkConvenio")==null){
			if (request.getParameter("checkConvenio")!= null){	
					convenio="S";
					request.getSession().setAttribute("checkConvenio", "checked");
				}else{
					convenio="N";
		    }
		}
		


		request.getSession().setAttribute("rua_destino", rua_destino);
		request.getSession().setAttribute("numero_destino", numero_destino);
		request.getSession().setAttribute("bairro_destino", bairro_destino);
		request.getSession().setAttribute("cidade_destino", cidade_destino);
		request.getSession().setAttribute("estado_destino", estado_destino);
		request.getSession().setAttribute("cep_destino", cep_destino);
		request.getSession().setAttribute("complemento_destino",
				complemento_destino);

		if ("consulta".equals(operacao)) {

			String resultado = "";
			String parametro = request.getParameter("parametroChamadoC");
			String tipoPesquisa = request.getParameter("tipoPesquisa");
			Chamado_ClienteTO chamadoC = new Chamado_ClienteTO();

			String tipoCons = "";

			if (Integer.parseInt(tipoPesquisa) == 2) {

				chamadoC.setCodigo_chamado(Integer.parseInt(parametro));
				tipoCons = "Código do chamado";
			}

			Chamado_Cliente chamadoCsel = new Chamado_Cliente(chamadoC);
			List<Chamado_ClienteTO> listaC = chamadoCsel.consultar(Integer
					.parseInt(tipoPesquisa));

			if (listaC.size() > 0) {

				// monta o cabeçalho da tabela
				resultado = "<table>"
						+"<tr>" + "<th width=‘86’ scope=‘col’>Codigo</th>"
						+ "<th width=‘291’ scope=‘col’>Passageiro</th>"
						+ "<th width=‘145’ scope=‘col’>Data</th>"
						+ "<th width=‘100’ scope=‘col’>Status</th>" + "</tr>";

				for (int i = 0; i < listaC.size(); i++) {

					// pesquisa o passageiro para trazer o nome
					PassageiroTO passageiro = new PassageiroTO();
					passageiro.setCodigo_passageiro(listaC.get(i)
							.getCodigo_passageiro());
					Passageiro passageiroSel = new Passageiro(passageiro);
					List<PassageiroTO> listaP = passageiroSel.consultar(3);

					// consulta status
					StatusTO status = new StatusTO();
					status.setCodigo_status(listaC.get(i).getCodigo_status());
					Status statusSel = new Status(status);
					List<StatusTO> listaS = statusSel.consultar();

					resultado = resultado
							+ "<tr>"
							+ "<td width=‘77’ nowrap=‘nowrap’ >"
							+ listaC.get(i).getCodigo_chamado()
							+ "</td>"
							+ "<td><a target='mainFrame' href=‘altera_chamado.jsp?cod_chamado="
							+ listaC.get(i).getCodigo_chamado() + "’>"
							+ listaP.get(0).getNome() + "</a></td>" + "<td>"
							+ listaC.get(i).getDataInclusao() + "</td>"
							+ "<td>" + listaS.get(0).getDescricao() + "</td>"
							+ "</tr>";

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

			String descricao = "";

			if (tipoCons != "") {

				descricao = "Consulta através do parâmetro " + parametro
						+ " como " + tipoCons;
			} else {
				descricao = "Consulta de todos os chamados";
			}

			LogTO log = new LogTO(0, "Consulta de chamado", "U", request
					.getSession().getAttribute("login").toString(), null,
					descricao);
			Log logIns = new Log(log);
			logIns.inserir();

			request.getSession().setAttribute("resultadoFinal", resultadoFinal);
			request.getRequestDispatcher("/HomePesquisa.jsp").forward(request,
					response);

		}
		if ("cadastro".equals(operacao)) {

			String mensagemIncluir = "";
			codigo_passageiro = request.getParameter("codigo_passageiro");
			Chamado_ClienteTO chamadoVI = new Chamado_ClienteTO();
			chamadoVI.setCodigo_passageiro(Integer.parseInt(codigo_passageiro));
			Chamado_Cliente verificaCI = new Chamado_Cliente(chamadoVI);
			List<Chamado_ClienteTO> listaVCI = verificaCI.consultar(4);

			PassageiroTO passageiroVI = new PassageiroTO();
			passageiroVI.setCodigo_passageiro(Integer
					.parseInt(codigo_passageiro));
			Passageiro verificaPI = new Passageiro(passageiroVI);
			List<PassageiroTO> listaVPI = verificaPI.consultar(3);

			if (listaVCI.size() > 0) {

				mensagemIncluir = "O cliente " + codigo_passageiro
						+ " já consta em outro chamado aberto";

				request.getSession().setAttribute("pagina",
						"inclui_chamado.jsp");

			} else if (listaVPI.size() < 0) {

				mensagemIncluir = "O cliente de código " + codigo_passageiro
						+ "não existe!";
				request.getSession().setAttribute("pagina",
						"inclui_chamado.jsp");
			} else {

				Chamado_ClienteTO chamadoC = new Chamado_ClienteTO(
						codigo_chamado, codigo_status, Integer
								.parseInt(codigo_passageiro), rua_origem,
						numero_origem, bairro_origem, cidade_origem,
						estado_origem, cep_origem, rua_destino, numero_destino,
						bairro_destino, cidade_destino, estado_destino,
						cep_destino, dataInclusao, complemento_origem,
						complemento_destino,null,convenio);
				Chamado_Cliente chamadoCins = new Chamado_Cliente(chamadoC);
				int iCod_chamado = chamadoCins.inserir();
				
				request.getSession().removeAttribute("checkConvenio");

				LogTO log = new LogTO(0, "Inclusao de chamado", "U", request
						.getSession().getAttribute("login").toString(), null,
						"Inclusao do chamdo com o código " + iCod_chamado);
				Log logIns = new Log(log);
				logIns.inserir();

				request.getSession().setAttribute("pagina",
						"pesquisa_chamado.jsp");

				mensagemIncluir = "O chamado incluído com sucesso! "
						+ "Numero do chamado: " + iCod_chamado;
				//algoritmo de escolha do melhor motorista
				DefineMotorista df=new DefineMotorista();
				df.calculaMelhorMotorista(iCod_chamado);

			}

			request.getSession().setAttribute("mensagem", mensagemIncluir);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);

		}

		if ("cancelar".equals(operacao)) {
			
			codigo_chamado = Integer.parseInt(request.getParameter("cod_chamado"));
			String justificativa = request.getParameter("txtJustificativa");
			
			
			if (justificativa.length()<2000){
				if (justificativa.length()>10){
					
					Chamado_ClienteTO chamado = new Chamado_ClienteTO();
					chamado.setCodigo_chamado(codigo_chamado);
					chamado.setJustificativa(justificativa);
					Chamado_Cliente chamadoCancel = new Chamado_Cliente(chamado);
					chamadoCancel.cancelar();
					
					LogTO log = new LogTO(0, "Cancelamento de chamado", "U", request
							.getSession().getAttribute("login").toString(), null,
							"Cancelamento do chamado com o código " + codigo_chamado);
					Log logIns = new Log(log);
					logIns.inserir();
					
					request.getSession().setAttribute("pagina", "pesquisa_chamado.jsp");
					request.getSession().setAttribute("mensagem", "Cancelamento efetuado com sucesso");
					request.getRequestDispatcher("mensagem.jsp").forward(request,
							response);
					
					
				}else {
					
					request.getSession().setAttribute("pagina", "justificativa_cancelamento.jsp?cod_chamado="+codigo_chamado);
					request.getSession().setAttribute("mensagem", "A justificativa precisa ter no mínimo 10 caracteres");
					request.getRequestDispatcher("mensagem.jsp").forward(request,
							response);
					
				}
			}else {
				request.getSession().setAttribute("pagina", "justificativa_cancelamento.jsp?cod_chamado="+codigo_chamado);
				request.getSession().setAttribute("mensagem", "Sua justificativa ultrapassou o limite maximo de 2000 caracteres");
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);
				
				
			}
			
			
		}
	
	
	if("consultaEnderecoOrigem".equals(operacao)){

		
		String nome = request.getSession().getAttribute("txtNome").toString();
        int codigo = Integer.parseInt(request.getSession().getAttribute("txtCodigoPassageiro").toString());
		

		request.getSession().setAttribute("txtRua", rua_origem);
		request.getSession().setAttribute("txtNome", nome);
		request.getSession().setAttribute("txtNumero", numero_origem);
		request.getSession().setAttribute("txtBairro", bairro_origem);
		request.getSession().setAttribute("txtCidade", cidade_origem);
		request.getSession().setAttribute("txtEstado", estado_origem);
		request.getSession().setAttribute("txtCep", cep_origem);
		request.getSession().setAttribute("txtComplementoOrigem", complemento_origem);
		request.getSession().setAttribute("txtCodigoPassageiro",
				codigo);

		
		String cep = request.getParameter("txtCepOrigem");
		EnderecoTO endereco = new EnderecoTO();
		endereco.setCep(cep);
		Chamado_Cliente chamadoEnd = new Chamado_Cliente(null);
		List<EnderecoTO> lista = chamadoEnd.consultarEndereco(endereco);
		
		if (lista.size()==0){

			String mensagem = "O CEP "+cep+" não é válido";

			request.getSession().setAttribute("pagina","inclui_chamado.jsp");
			request.getSession().setAttribute("mensagem", mensagem);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);



		}else{

			
			request.getSession().setAttribute("txtRua", lista.get(0).getRua());
			request.getSession().setAttribute("txtNumero", lista.get(0).getNumero());
			request.getSession().setAttribute("txtBairro", lista.get(0).getBairro());
			request.getSession().setAttribute("txtCidade", lista.get(0).getCidade());
			request.getSession().setAttribute("txtEstado", lista.get(0).getEstado());
			

			request.getRequestDispatcher("inclui_chamado.jsp").forward(request,
					response);	

		}
	}
	
	if("consultaEnderecoDestino".equals(operacao)){

        String nome = request.getSession().getAttribute("txtNome").toString();
        int codigo = Integer.parseInt(request.getSession().getAttribute("txtCodigoPassageiro").toString());

		request.getSession().setAttribute("txtRua", rua_origem);
		request.getSession().setAttribute("txtNome", nome);
		request.getSession().setAttribute("txtNumero", numero_origem);
		request.getSession().setAttribute("txtBairro", bairro_origem);
		request.getSession().setAttribute("txtCidade", cidade_origem);
		request.getSession().setAttribute("txtEstado", estado_origem);
		request.getSession().setAttribute("txtCep", cep_origem);
		request.getSession().setAttribute("txtComplementoOrigem", complemento_origem);
		request.getSession().setAttribute("txtCodigoPassageiro",codigo);

		
		String cep = request.getSession().getAttribute("cep_destino").toString();
		EnderecoTO endereco = new EnderecoTO();
		endereco.setCep(cep);
		Chamado_Cliente chamadoEnd = new Chamado_Cliente(null);
		List<EnderecoTO> lista = chamadoEnd.consultarEndereco(endereco);

		if (lista.size()==0){

			String mensagem = "O CEP "+cep+" não é válido";

			request.getSession().setAttribute("pagina","inclui_chamado.jsp");
			request.getSession().setAttribute("mensagem", mensagem);
			request.getRequestDispatcher("mensagem.jsp").forward(request,
					response);



		}else{

			
			request.getSession().setAttribute("rua_destino", lista.get(0).getRua());
			request.getSession().setAttribute("numero_destino", lista.get(0).getNumero());
			request.getSession().setAttribute("bairro_destino", lista.get(0).getBairro());
			request.getSession().setAttribute("cidade_destino", lista.get(0).getCidade());
			request.getSession().setAttribute("estado_destino", lista.get(0).getEstado());
			

			request.getRequestDispatcher("inclui_chamado.jsp").forward(request,
					response);	

		}
	}


}

}
