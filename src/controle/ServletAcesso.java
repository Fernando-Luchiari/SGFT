package controle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ClassesException;
import modelo.Log;
import modelo.LogTO;
import modelo.Usuario;
import modelo.UsuarioTO;

public class ServletAcesso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String login;

	private String tipoUsuario;

	private String senha;

	private String operacao;

	private String loginp;

	public ServletAcesso() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			executa(request, response);
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			executa(request, response);
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void executa(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassesException {

		loginp = request.getParameter("txtLogin");
		senha = request.getParameter("txtSenha");
		operacao = request.getParameter("operacao");

		if ("AcessoUsuario".equals(operacao)) {

			String mensagemAcesso = null;

			UsuarioTO usuarioAcesso = new UsuarioTO();
			usuarioAcesso.setLogin(loginp);
			usuarioAcesso.setSenha(senha);
			Usuario verifica = new Usuario(usuarioAcesso, null);
			List<UsuarioTO> listaAtivos = verifica.consultar(2);
			List<UsuarioTO> listaSenha = verifica.consultar(4);
			List<UsuarioTO> listaLogado=verifica.consultar(5);

			if (listaSenha.size() == 0) {
	
				mensagemAcesso = "O login e/ou a senha estão incorretos";
				request.getSession().setAttribute("pagina", "acesso.jsp");
				request.getSession().setAttribute("mensagem", mensagemAcesso);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);

			} else if (listaAtivos.size() == 0) {

				mensagemAcesso = "O usuário em questão consta desativado";
				request.getSession().setAttribute("pagina", "acesso.jsp");
				request.getSession().setAttribute("mensagem", mensagemAcesso);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);

			} else if (listaLogado.size()==0){
				
				mensagemAcesso = "Não são permitidos acessos simultâneos";
				request.getSession().setAttribute("pagina", "acesso.jsp");
				request.getSession().setAttribute("mensagem", mensagemAcesso);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);
				
			}else{

				Usuario acessar = new Usuario(listaLogado.get(0),null);
				acessar.acesso("S");
				
				login = listaLogado.get(0).getLogin();

				request.getSession().setAttribute("login", login);

				LogTO log = new LogTO(0, "Acesso ao sistema", "U", login, null,
						"Login " + login + " acessou o sistema");
				Log logIns = new Log(log);
				logIns.inserir();

				if (listaSenha.get(0).getSupervisor() == 0) {

					tipoUsuario = "A";

				} else {

					tipoUsuario = "S";
				}

				request.getSession().setAttribute("tipoUsuario", tipoUsuario);
				request.getSession().setAttribute("usuario", listaSenha.get(0));
				request.getRequestDispatcher("Principal.html").forward(request,
						response);
				
				

			}

			

		}

		if ("EncerraSessao".equals(operacao)) {
		
			
			if (request.getSession().getAttribute("login")!= null){
				String login = request.getSession().getAttribute("login").toString();
				UsuarioTO usuario = new UsuarioTO();
				usuario.setLogin(login);
				Usuario acesso = new Usuario(usuario,null);
				acesso.acesso("N");
				
				LogTO log = new LogTO(0, "Encerrar sessao", "U", login, null,
						"Login " + request.getSession().getAttribute("login")
								+ " encerrou a sessão");
				Log logIns = new Log(log);
				logIns.inserir();
				request.getSession().removeAttribute("login");
				request.getSession().removeAttribute("tipoUsuario");
				request.getSession().removeAttribute("usuario");
	
				request.getRequestDispatcher("acesso.jsp").forward(request,
						response);
			}else{
				
				request.getSession().setAttribute("pagina", "acesso.jsp");
				request.getSession().setAttribute("mensagem", "Erro ao encerrar sessão. Entre em contato com o suporte técnico");

				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);
			}
		}

	}

}
