package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.Chamado_AceiteTO;

public interface Chamado_AceiteDAO {
	public void inserir(Chamado_AceiteTO item) throws ClassesException;
	
	public void alterar(Chamado_AceiteTO item)throws ClassesException;
	
	public void excluir(Chamado_AceiteTO item)throws ClassesException;
	
	public List<Chamado_AceiteTO> consultar(Chamado_AceiteTO item, int tipoWhere) throws ClassesException;
}
