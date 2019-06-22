package controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ClassesException;
import modelo.Log;
import modelo.LogTO;

import dao.Conexao;

/**
 * Servlet implementation class ServletRelatorioLog
 */
public class ServletRelatorioLog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletContext sc;

	private String idUsuario;



	private String tipoDeAlteracao;
	

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		sc = config.getServletContext();
		Conexao clsConexao = new Conexao();
		try {
			clsConexao.obtemConexao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ServletRelatorioLog() {
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

	protected void executa(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, ClassesException {
		String tipo = request.getParameter("tipo");

		
		if (tipo.equals("idUsuario")) {
			
			String diaDe = request.getParameter("txtDiaDe1");
			String mesDe = request.getParameter("txtMesDe1");
			String anoDe = request.getParameter("txtAnoDe1");
			String diaAte = request.getParameter("txtDiaAte1");
			String mesAte = request.getParameter("txtMesAte1");
			String anoAte = request.getParameter("txtAnoAte1");
			String dataDe = anoDe+"-"+mesDe+"-"+diaDe+" 00:00:00";
			String dataAte = anoAte+"-"+mesAte+"-"+diaAte+" 23:59:59";
			
			idUsuario = request.getParameter("txtIdUsuario");
			
			Log logRelat = new Log(null);
			List<LogTO> listLog = logRelat.consultar(1,idUsuario,dataDe,dataAte);
			
			if (listLog.size()==0){
				
				request.getSession().setAttribute("pagina",
				"relatorio_log.jsp");
				
				String mensagem = "Nenhum dado encontrado com os parâmetros selecionados";
				request.getSession().setAttribute("mensagem", mensagem);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);
			}else{
			
			RelatorioLog.execute(sc,listLog,request, response);
			
			}
		}
		
		if (tipo.equals("tipoDeAlteracao")){
			
			String diaDe = request.getParameter("txtDiaDe2");
			String mesDe = request.getParameter("txtMesDe2");
			String anoDe = request.getParameter("txtAnoDe2");
			String diaAte = request.getParameter("txtDiaAte2");
			String mesAte = request.getParameter("txtMesAte2");
			String anoAte = request.getParameter("txtAnoAte2");
			String dataDe = anoDe+"-"+mesDe+"-"+diaDe+" 00:00:00";
			String dataAte = anoAte+"-"+mesAte+"-"+diaAte+" 23:59:59";
			
			tipoDeAlteracao = request.getParameter("txtTipoAlteracao");
			
			Log logRelat = new Log(null);
			List<LogTO> listLog = logRelat.consultar(2,tipoDeAlteracao,dataDe,dataAte);
			
			if (listLog.size()==0){
				
				request.getSession().setAttribute("pagina",
				"relatorio_log.jsp");
				
				String mensagem = "Nenhum dado encontrado com os parâmetros selecionados";
				request.getSession().setAttribute("mensagem", mensagem);
				request.getRequestDispatcher("mensagem.jsp").forward(request,
						response);
			}else{
			
			RelatorioLog.execute(sc,listLog,request, response);
			
			
			}
			
			
			
		}
		
		
	}
}
