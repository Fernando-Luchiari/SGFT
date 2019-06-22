package controle;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ClassesException;
import modelo.Log;
import modelo.LogTO;
import modelo.Motorista;
import modelo.MotoristaTO;
import modelo.Motorista_Localizacao;
import modelo.Motorista_LocalizacaoTO;

/**
 * Servlet implementation class ServletMovel
 */
public class ServletMovel extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String login;
	private String senha;
	private String operacao;
	private String latitude;
	private String longitude;
	private boolean acessado=false;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletMovel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			executa(request, response);
			response.reset();
			if (acessado){
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
				acessado=false;
			}
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			executa(request, response);
			if (acessado){
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
				acessado=false;
			}
			
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			
		}
	}

	public void executa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassesException {
		login = request.getParameter("id");
		senha = request.getParameter("senha");
		operacao = request.getParameter("operacao");

		if ("AcessoMotorista".equals(operacao)) {
			MotoristaTO motoristaAcesso = new MotoristaTO();
			motoristaAcesso.setId_dispositivo(Integer.parseInt(login));
			motoristaAcesso.setSenha(senha);
			Motorista verifica = new Motorista(motoristaAcesso, null);
			List<MotoristaTO> listaSenha = verifica.consultar(4);
			Iterator<MotoristaTO> iteratorM = listaSenha.iterator();
			try {
				MotoristaTO itemM = iteratorM.next();
				if(itemM.getStatus()!=1 || itemM.getAtivo()== 0){
					Motorista verifica2 = new Motorista(motoristaAcesso, null);
					motoristaAcesso.setStatus(1);
					verifica2.alterarStatus();
					LogTO log = new LogTO(0, "Acesso ao sistema movel", "M", login, null,
							"Motorista com id " + login+"conectando ao sistema movel ");
					Log logIns = new Log(log);
					logIns.inserir();
				}else{
					acessado=true;					
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			}

		}

		if ("logoutMotorista".equals(operacao)) {
			MotoristaTO motoristaAcesso = new MotoristaTO();
			motoristaAcesso.setId_dispositivo(Integer.parseInt(login));
			motoristaAcesso.setSenha(senha);
			Motorista verifica = new Motorista(motoristaAcesso, null);
			List<MotoristaTO> listaSenha = verifica.consultar(4);
			Iterator<MotoristaTO> iteratorM = listaSenha.iterator();
			try {
				MotoristaTO itemM = iteratorM.next();
				Motorista verifica2 = new Motorista(motoristaAcesso, null);
				motoristaAcesso.setStatus(0);
				verifica2.alterarStatus();
				LogTO log = new LogTO(0, "Encerrar sessao no sistema móvel", "M", login, null,
						"Motorista com id " + login+"desconectando do sistema movel ");
				Log logIns = new Log(log);
				logIns.inserir();

			} catch (Exception e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
			}

		}

		if ("GravarCoordenadas".equals(operacao)) {
			latitude = request.getParameter("latitude");
			longitude = request.getParameter("longitude");
			Motorista_LocalizacaoTO motoristaloc = new Motorista_LocalizacaoTO();
			motoristaloc.setId_dispositivo(Integer.parseInt(login));
			motoristaloc.setLatitude(Float.parseFloat(latitude));
			motoristaloc.setLongitude(Float.parseFloat(longitude));
			System.out.println("latitude = " + latitude);
			System.out.println("longitude = " + longitude);
			Motorista_Localizacao verifica = new Motorista_Localizacao(
					motoristaloc);
			boolean existe = verifica.consultaUltimaAtualizacao();
			if (existe) {
				verifica.alterar();
				LogTO log = new LogTO(0, "Alteracao de coordenadas", "M", login, null,
						"Motorista com id "+login +"alterando coordenadas no sistema ");
				Log logIns = new Log(log);
				logIns.inserir();
			} else {
				verifica.inserir();
				LogTO log = new LogTO(0, "Insercao de coordenadas", "M", login, null,
						 "Motorista com id "+login+"gravando coordenadas no sistema ");
				Log logIns = new Log(log);
				logIns.inserir();
			}

		}
	}

}
