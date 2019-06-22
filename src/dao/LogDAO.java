package dao;

import java.util.List;
import modelo.ClassesException;
import modelo.LogTO;


/**
 * Interface que define metodos de acesso a tabela de log
 * 
 * @author Rita
 * 
 */
public interface LogDAO {
	public void inserir(LogTO item) throws ClassesException;

	public void alterar(LogTO item) throws ClassesException;

	public void excluir(LogTO item) throws ClassesException;

	public List<LogTO> consultar( int tipoWhere,String parametro,String dataDe, String dataAte)
			throws ClassesException;

}
