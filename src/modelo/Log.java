package modelo;

import java.util.List;
import dao.LogDAO;
import dao.impl.LogDAOImpl;

public class Log {
	LogTO dadosLog = null;
	LogDAO dao = new LogDAOImpl();

	public Log(LogTO dadosLog) {
		this.dadosLog = dadosLog;
	}

	public void inserir() throws ClassesException {
		dao.inserir(dadosLog);
	}

	public void alterar() throws ClassesException {
		dao.alterar(dadosLog);
	}

	public void excluir() throws ClassesException {
		dao.excluir(dadosLog);
	}

	public List<LogTO> consultar(int tipoWhere,String parametro,String diaDe,String diaAte) throws ClassesException {

		return dao.consultar(tipoWhere, parametro,diaDe,diaAte);
	}
}
