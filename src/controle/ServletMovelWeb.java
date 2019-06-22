package controle;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.Chamado_Aceite;
import modelo.Chamado_AceiteTO;
import modelo.Chamado_Cliente;
import modelo.Chamado_ClienteTO;
import modelo.Chamado_Final;
import modelo.Chamado_FinalTO;
import modelo.ClassesException;
import modelo.Convenio;
import modelo.ConvenioTO;
import modelo.Funcionario;
import modelo.FuncionarioTO;
import modelo.Log;
import modelo.LogTO;
import modelo.Motorista;
import modelo.MotoristaTO;
import modelo.Passageiro;
import modelo.PassageiroTO;
import dao.impl.DefineMotorista;

/**
 * Servlet implementation class ServletMovelWeb
 */
public class ServletMovelWeb extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private String login;

	private String senha;

	private String operacao;
	
	private String numChamado;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMovelWeb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			executa(request, response);
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("erro_mobile.jsp").forward(request,
					response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			executa(request, response);
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getRequestDispatcher("erro_mobile.jsp").forward(request,
					response);
		}
	}
	
	public void executa(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException, ClassesException {

		login = request.getParameter("txtID");
		senha = request.getParameter("txtSenha");
		operacao = request.getParameter("operacao");
		
		if ("AcessoUsuarioMovel".equals(operacao)) {
			
			String mensagemAcesso = null;
		
			MotoristaTO motoristaAcesso = new MotoristaTO();
			motoristaAcesso.setId_dispositivo(Integer.parseInt(login));
			motoristaAcesso.setSenha(senha);
			Motorista verifica = new Motorista(motoristaAcesso,null);
			List<MotoristaTO> lista = verifica.consultar(4);
			List<MotoristaTO> listaLogin = verifica.consultar(5);
			Iterator<MotoristaTO> iterator = lista.iterator();
			Iterator<MotoristaTO> iteratorAtivo = listaLogin.iterator();
			if (!iterator.hasNext()) {				
				mensagemAcesso = "O login ou senha inválidos!";
				request.getSession().setAttribute("pagina", "acesso_mobile.jsp");
				request.getSession().setAttribute("mensagem", mensagemAcesso);
				request.getRequestDispatcher("mensagem_mobile.jsp").forward(request,
						response);		
			} else {
				MotoristaTO item = iterator.next();				
				if(!iteratorAtivo.hasNext()){
					if(item.getAtivo() !=0){
						login = ""+item.getId_dispositivo();
						String nome_funcionario=null; 
						int cod_funcionario = item.getCodfuncionario();
						FuncionarioTO dados_funcionario =  new FuncionarioTO();
						dados_funcionario.setCodfuncionario(cod_funcionario);
						Funcionario funcionario = new Funcionario(dados_funcionario);
						List<FuncionarioTO> lista_func = funcionario.consultar(2);
						Iterator<FuncionarioTO> iterator_func = lista_func.iterator();
						if (iterator_func.hasNext()) {
							FuncionarioTO item_func = iterator_func.next();
							nome_funcionario =  item_func.getNome();
						}			
						request.getSession().setAttribute("login", login);		
						LogTO log = new LogTO(0, "Acesso ao sistema movel web", "U", login, null,
								"Motorista de id " + login + " acessou o sistema móvel web");
						Log logIns = new Log(log);
						logIns.inserir();
						MotoristaTO dadosmotorista = new MotoristaTO();
						dadosmotorista.setId_dispositivo(item.getId_dispositivo());
						Motorista motorista = new Motorista(dadosmotorista,null);
						motorista.alterarStatusWeb(1);
						request.getSession().setAttribute("motoristaID", item.getId_dispositivo());
						request.getSession().setAttribute("NomeMotorista", nome_funcionario);
						request.getRequestDispatcher("Meio_mobile.jsp").forward(request,
								response);
					}else{
						mensagemAcesso = "Motorista desativado!";
						request.getSession().setAttribute("pagina", "acesso_mobile.jsp");
						request.getSession().setAttribute("mensagem", mensagemAcesso);
						request.getRequestDispatcher("mensagem_mobile.jsp").forward(request,
								response);
					}	
				}else{
					mensagemAcesso = "Não são permitidos acessos simultâneos";										
					request.getSession().setAttribute("pagina", "acesso_mobile.jsp");
					request.getSession().setAttribute("mensagem", mensagemAcesso);
					request.getRequestDispatcher("mensagem_mobile.jsp").forward(request,
							response);
				}
			}	
		}
		
		if ("recusarChamado".equals(operacao)) {
			numChamado = request.getParameter("chamadoID");
			LogTO log = new LogTO(0, "Recusar Chamado", "U", request.getSession().getAttribute("motoristaID").toString(), null,
					"Login " + request.getSession().getAttribute("motoristaID")
							+ " Recusou o chamado");
			Log logIns = new Log(log);
			logIns.inserir();		
			request.getSession().setAttribute("chamadoID",numChamado);		
			request.getRequestDispatcher("justificativa_mobile.jsp").forward(request,
					response);
		}		
		if ("aceitarChamado".equals(operacao)) {
			numChamado = request.getParameter("chamadoID");
			login = request.getParameter("motoristaID");
			String passageiro = request.getParameter("nomePassageiro");
			String telefone = request.getParameter("telPassageiro");
			String origem = request.getParameter("endOri");
			String destino = request.getParameter("endDest");
			String jaAceito = request.getParameter("jaAceito");
			LogTO log = new LogTO(0, "Aceitar Chamado", "U", request.getSession().getAttribute("motoristaID").toString(), null,
					"Login " + request.getSession().getAttribute("motoristaID")
							+ " Aceitou o chamado");
			Log logIns = new Log(log);
			logIns.inserir();
			Chamado_AceiteTO dadoschamado_aceite	= new Chamado_AceiteTO(login,Integer.parseInt(numChamado));		
			Chamado_Aceite chamado_aceite	= new Chamado_Aceite(dadoschamado_aceite);
			chamado_aceite.inserir();
			
			//alterar status do motorista para ocupado
			MotoristaTO dadosmotorista = new MotoristaTO();
			dadosmotorista.setId_dispositivo(Integer.parseInt(login));
			dadosmotorista.setStatus(2);
			Motorista motorista = new Motorista(dadosmotorista,null);
			motorista.alterarStatus();
			
			//alterando o status do chamado para 2 (em andamento)
			Chamado_ClienteTO chamadoCli = new Chamado_ClienteTO();
			chamadoCli.setCodigo_chamado(Integer.parseInt(numChamado));
			chamadoCli.setCodigo_status(2);
			Chamado_Cliente chamadoStatus = new Chamado_Cliente(chamadoCli);
			chamadoStatus.alterarStatus();			
			request.getSession().setAttribute("numChamado",numChamado);
			request.getSession().setAttribute("nomePassageiro",passageiro);
			request.getSession().setAttribute("telPassageiro",telefone);	
			request.getSession().setAttribute("endOri",origem);	
			request.getSession().setAttribute("endDest",destino);	
			request.getRequestDispatcher("aceite_mobile.jsp").forward(request,
					response);
		}
		
		if("VerificaCancelamento".equals(operacao)){
			boolean cancelou=false;
			numChamado = request.getParameter("chamadoID");
			login = request.getParameter("motoristaID");
			String passageiro = request.getParameter("nomePassageiro");
			String telefone = request.getParameter("telPassageiro");
			String origem = request.getParameter("endOri");
			String destino = request.getParameter("endDest");
			
			Chamado_ClienteTO chamadoCli = new Chamado_ClienteTO();
			chamadoCli.setCodigo_chamado(Integer.parseInt(numChamado));
			Chamado_Cliente chamadoStatus = new Chamado_Cliente(chamadoCli);
			List<Chamado_ClienteTO> lista =chamadoStatus.consultar(2);
			Iterator<Chamado_ClienteTO> iterator = lista.iterator();
			while (iterator.hasNext()) {
				cancelou = true;
				//alterar status do motorista para livre
				MotoristaTO dadosmotorista = new MotoristaTO();
				dadosmotorista.setId_dispositivo(Integer.parseInt(login));
				dadosmotorista.setStatus(1);
				Motorista motorista = new Motorista(dadosmotorista,null);
				motorista.alterarStatus();					
				request.getSession().setAttribute("cancelou",cancelou);
			}
			
			request.getSession().setAttribute("numChamado",numChamado);
			request.getSession().setAttribute("nomePassageiro",passageiro);
			request.getSession().setAttribute("telPassageiro",telefone);	
			request.getSession().setAttribute("endOri",origem);	
			request.getSession().setAttribute("endDest",destino);	
			request.getRequestDispatcher("aceite_mobile.jsp").forward(request,
					response);
		}
		
		if ("afinalizar".equals(operacao)) {
			numChamado = request.getParameter("chamadoID");
			login = request.getParameter("motoristaID");
			String passageiro = request.getParameter("nomePassageiro");
			String telefone = request.getParameter("telPassageiro");
			String origem = request.getParameter("endOri");
			String destino = request.getParameter("endDest");
			String jaAceito = request.getParameter("jaAceito");
			request.getSession().setAttribute("numChamado",numChamado);
			request.getSession().setAttribute("nomePassageiro",passageiro);
			request.getSession().setAttribute("telPassageiro",telefone);	
			request.getSession().setAttribute("endOri",origem);	
			request.getSession().setAttribute("endDest",destino);	
			request.getRequestDispatcher("aceite_mobile.jsp").forward(request,
					response);
		}
		if ("cancelarRecusa".equals(operacao)) {
			numChamado = request.getParameter("chamadoID");
			LogTO log = new LogTO(0, "Recusar Chamado", "U", request.getSession().getAttribute("motoristaID").toString(), null,
					"Login " + request.getSession().getAttribute("motoristaID")
							+ " Cancelou a recusa do chamado");
			Log logIns = new Log(log);
			logIns.inserir();		
			request.getSession().setAttribute("chamadoID",numChamado);		
			request.getRequestDispatcher("Meio_mobile.jsp").forward(request,
					response);
		}
		
		if ("FinalizarChamado".equals(operacao)) {
			numChamado = request.getParameter("chamadoID");
			login = request.getParameter("motoristaID");
			String txtValor=request.getParameter("valor");
			txtValor=txtValor.replace(".", "");
			txtValor=txtValor.replace(",", ".");
			float valor = Float.parseFloat(txtValor);
			LogTO log = new LogTO(0, "Chamado finalizado", "U", request.getSession().getAttribute("motoristaID").toString(), null,
					"Login " + request.getSession().getAttribute("motoristaID")
							+ "finalizou o chamado");
			Log logIns = new Log(log);
			logIns.inserir();			
			Chamado_FinalTO dadoschamado_final	= new Chamado_FinalTO(login,Integer.parseInt(numChamado),valor);		
			Chamado_Final chamado_final	= new Chamado_Final(dadoschamado_final);
			chamado_final.inserir();
			
			//alterando o status do motorista
			MotoristaTO dadosmotorista = new MotoristaTO();
			dadosmotorista.setId_dispositivo(Integer.parseInt(login));
			dadosmotorista.setStatus(1);
			Motorista motorista = new Motorista(dadosmotorista,null);
			motorista.alterarStatus();
			
			//alterando o status do chamado para 5 (em andamento)
			Chamado_ClienteTO chamadoCli = new Chamado_ClienteTO();
			chamadoCli.setCodigo_chamado(Integer.parseInt(numChamado));
			chamadoCli.setCodigo_status(5);
			Chamado_Cliente chamadoStatus = new Chamado_Cliente(chamadoCli);
			chamadoStatus.alterarStatus();
			
			//Atualizando valor gasto no convenio
			
			if (chamadoStatus.consultarChamado().getConvenio().equals("S")){
				PassageiroTO passageiro = new PassageiroTO();
				passageiro.setCodigo_passageiro(chamadoStatus.consultarChamado().getCodigo_passageiro());
				Passageiro pegaConvenio = new Passageiro(passageiro);
				List <PassageiroTO> listaPas = pegaConvenio.consultar(3);
				Iterator<PassageiroTO> iteratorPas = listaPas.iterator();
				
				
				if (iteratorPas.hasNext()) {
				  PassageiroTO item = iteratorPas.next();
					if (item.getCodigo_convenio()>0){
						ConvenioTO convenio =new ConvenioTO();
						convenio.setCodigo_convenio(item.getCodigo_convenio());
						Convenio atualizaValor = new Convenio(convenio);
						atualizaValor.alteraValorGasto(valor);
					}
				}			
		    }
			
			
			
			request.getRequestDispatcher("Meio_mobile.jsp").forward(request,
					response);
		}
		
		if ("JustificarRecusa".equals(operacao)) {
			numChamado = request.getParameter("chamadoID");
			login = request.getParameter("motoristaID");
			String Justificativa= request.getParameter("txtJustificativa");
			LogTO log = new LogTO(0, "Chamado nao aceito", "U",login, null,
					"Login " + login
							+ "não aceitou o chamado");
			Log logIns = new Log(log);
			logIns.inserir();			
			Chamado_AceiteTO dadoschamado_aceite	= new Chamado_AceiteTO(login,Integer.parseInt(numChamado),Justificativa);		
			Chamado_Aceite chamado_aceite	= new Chamado_Aceite(dadoschamado_aceite);
			chamado_aceite.inserir();
			//alterando o status do motorista
			MotoristaTO dadosmotorista = new MotoristaTO();
			dadosmotorista.setId_dispositivo(Integer.parseInt(login));
			dadosmotorista.setStatus(1);
			Motorista motorista = new Motorista(dadosmotorista,null);
			motorista.alterarStatus();
			
			DefineMotorista encontraMotorista = new DefineMotorista();
			encontraMotorista.calculaMelhorMotorista(Integer.parseInt(numChamado));
			
			request.getRequestDispatcher("Meio_mobile.jsp").forward(request,
					response);
		}
		
		if("contarMinuto".equals(operacao)){
			numChamado = request.getParameter("chamadoID");
			login = request.getParameter("motoristaID");
			int tempogasto=0;
			System.out.println(request.getParameter("TempoGasto"));
			if (request.getParameter("TempoGasto") != null && !request.getParameter("TempoGasto").toString().equals("null")){
				tempogasto= Integer.parseInt(request.getParameter("TempoGasto").toString());
			}			
			tempogasto=tempogasto+1;
			if(tempogasto==10){
				numChamado = request.getParameter("chamadoID");
				login = request.getParameter("motoristaID");
				tempogasto=0;
				if(numChamado != null){
					String Justificativa= "Chamado recusado por demora de resposta";
					LogTO log = new LogTO(0, "Chamado nao aceito", "U", login, null,
							"Login " + login
									+ "não aceitou o chamado");
					Log logIns = new Log(log);
					logIns.inserir();			
					Chamado_AceiteTO dadoschamado_aceite	= new Chamado_AceiteTO(login,Integer.parseInt(numChamado),Justificativa);		
					Chamado_Aceite chamado_aceite	= new Chamado_Aceite(dadoschamado_aceite);
					chamado_aceite.inserir();
					//alterando o status do motorista
					MotoristaTO dadosmotorista = new MotoristaTO();
					dadosmotorista.setId_dispositivo(Integer.parseInt(login));
					dadosmotorista.setStatus(1);
					Motorista motorista = new Motorista(dadosmotorista,null);
					motorista.alterarStatus();
					
					DefineMotorista encontraMotorista = new DefineMotorista();
					encontraMotorista.calculaMelhorMotorista(Integer.parseInt(numChamado));
					request.getSession().setAttribute("motoristaID",login);	
					request.getSession().setAttribute("chamadoID",numChamado);
					request.getRequestDispatcher("Meio_mobile.jsp").forward(request,
							response);
				}
			}else{
				request.getSession().setAttribute("motoristaID",login);	
				request.getSession().setAttribute("chamadoID",numChamado);	
				request.getSession().setAttribute("TempoGasto",tempogasto);	
				request.getRequestDispatcher("Meio_mobile.jsp").forward(request,
						response);
			}
		}
		
		if ("EncerraSessao".equals(operacao)) {		
			LogTO log = new LogTO(0, "Encerrar sessao", "U", request.getSession().getAttribute("motoristaID").toString(), null,
					"Login " + request.getSession().getAttribute("motoristaID")
							+ " encerrou a sessão");
			Log logIns = new Log(log);
			logIns.inserir();
			String idmotorista=request.getSession().getAttribute("motoristaID").toString();
			MotoristaTO dadosmotorista = new MotoristaTO();
			dadosmotorista.setId_dispositivo(Integer.parseInt(idmotorista));
			Motorista motorista = new Motorista(dadosmotorista,null);
			motorista.alterarStatusWeb(0);
			request.getRequestDispatcher("acesso_mobile.jsp").forward(request, response);
		}

	}

}
