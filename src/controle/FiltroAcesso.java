package controle;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import modelo.UsuarioTO;

/**
 * Servlet Filter implementation class FiltroAcesso
 */
public class FiltroAcesso implements Filter {
	
	/**
	 * Default constructor.
	 */
	public FiltroAcesso() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		boolean acessomovel=false;
		HttpSession session = req.getSession();
		int motorista = 0;
		UsuarioTO usuario = (UsuarioTO) session.getAttribute("usuario");
		if(session.getAttribute("expirou")=="sim"){
			req.getRequestDispatcher("sessao_expirada.jsp").forward(request, response);
			session.setAttribute("expirou","nao");
		}else{
			if(req.getRequestURI().contains("_mobile")){
				acessomovel=true;
				if(session.getAttribute("motoristaID")!=null){
					motorista = Integer.parseInt(session.getAttribute("motoristaID").toString());
				}
			}		
			if(motorista==0 && acessomovel &&(!"AcessoUsuarioMovel".equals(req.getParameter("operacao")))) {
				req.getRequestDispatcher("acesso_mobile.jsp").forward(request, response);
			}else if (usuario == null
					&& !"AcessoUsuario".equals(req.getParameter("operacao"))
					&& !req.getRequestURI().contains("_mobile")) {
				acessomovel=false;
				req.getRequestDispatcher("acesso.jsp").forward(request, response);
			}
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	

}
