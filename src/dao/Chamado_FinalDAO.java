package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.Chamado_FinalTO;

public interface Chamado_FinalDAO {
	public void inserir(Chamado_FinalTO item) throws ClassesException;
	
	public void alterar(Chamado_FinalTO item)throws ClassesException;
	
	public void excluir(Chamado_FinalTO item)throws ClassesException;
	
	public List<Chamado_FinalTO> consultar(Chamado_FinalTO item, int tipoWhere) throws ClassesException;

	
		
}
