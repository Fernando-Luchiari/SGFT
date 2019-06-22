package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.StatusTO;

public interface StatusDAO {
	
	public void inserir(StatusTO item) throws ClassesException;
	
	public void alterar(StatusTO item)throws ClassesException;
	
	public void excluir(StatusTO item)throws ClassesException;
	
	public List<StatusTO> consultar(StatusTO item) throws ClassesException;
	
}
