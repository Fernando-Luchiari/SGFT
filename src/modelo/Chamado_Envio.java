package modelo;

import java.util.List;

import dao.Chamado_EnvioDAO;
import dao.impl.Chamado_EnvioDAOImpl;

public class Chamado_Envio {
	Chamado_EnvioTO dadosChamado_Envio = null;
	Chamado_EnvioDAO dao = new Chamado_EnvioDAOImpl();	

	
	public Chamado_Envio(Chamado_EnvioTO dadosChamado_Envio) 
	{
		this.dadosChamado_Envio = dadosChamado_Envio;
	}
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosChamado_Envio);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosChamado_Envio);
	}

	public void excluir() throws ClassesException 
	{
		dao.excluir(dadosChamado_Envio);
	}
	public List<Chamado_EnvioTO> consultar(int tipoWhere) throws ClassesException
	{
		
		return dao.consultar(dadosChamado_Envio,tipoWhere);
	}
	
	public List<Chamado_EnvioTO> consultarUtimoEnvio(int tipoWhere) throws ClassesException
	{
		
		return dao.consultar(dadosChamado_Envio,tipoWhere);
	}
}
