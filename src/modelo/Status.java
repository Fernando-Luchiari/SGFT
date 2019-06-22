package modelo;

import java.util.List;

import dao.StatusDAO;
import dao.impl.StatusDAOImpl;


public class Status 
{
	StatusTO dadosStatus = null;
	StatusDAO dao = new StatusDAOImpl();	

	
	public Status(StatusTO dadosStatus) 
	{
		this.dadosStatus = dadosStatus;
	}
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosStatus);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosStatus);
	}

	public void excluir() throws ClassesException 
	{
		dao.excluir(dadosStatus);
	}
	public List<StatusTO> consultar() throws ClassesException
	{
		
		return dao.consultar(dadosStatus);
	}
}
