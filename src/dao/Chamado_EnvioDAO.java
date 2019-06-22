package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.Chamado_EnvioTO;

public interface Chamado_EnvioDAO {
public void inserir(Chamado_EnvioTO item) throws ClassesException;
	
	public void alterar(Chamado_EnvioTO item)throws ClassesException;
	
	public void excluir(Chamado_EnvioTO item)throws ClassesException;
	
	public List<Chamado_EnvioTO> consultar(Chamado_EnvioTO item,int tipoWhere) throws ClassesException;
	
	public List<Chamado_EnvioTO> consultarUtimoEnvio(Chamado_EnvioTO item,int tipoWhere)
	throws ClassesException;
}
