package controle;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import modelo.ClassesException;
import modelo.Log;
import modelo.LogTO;
import modelo.Usuario;
import modelo.UsuarioTO;

public class FinalizaSessao implements HttpSessionListener {
	
	public boolean expirou=false;

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		if(expirou){
			HttpSession session = arg0.getSession();
			session.setAttribute("expirou", "sim");
			expirou=false;
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		String login=null;
		if (session.getAttribute("login")!=null){
			login=session.getAttribute("login").toString();
		}
		if (login!=null){
			UsuarioTO usuario = new UsuarioTO();			
			usuario.setLogin(session.getAttribute("login").toString());
			Usuario acesso = new Usuario(usuario,null);
			session.removeAttribute("login");
			session.removeAttribute("tipoUsuario");
			session.removeAttribute("usuario");
			expirou=true;
			try {
				acesso.acesso("N");
			} catch (ClassesException e) {
				e.printStackTrace();
			}
			
			LogTO log = new LogTO(0, "Expirou sessão", "U", login, null,
					"Login " + session.getAttribute("login")
							+ " expirou a sessão");
			Log logIns = new Log(log);
			try {
				logIns.inserir();
			} catch (ClassesException e) {
				e.printStackTrace();
			}
		}



	}


}
