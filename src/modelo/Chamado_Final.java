package modelo;

import java.util.List;

import dao.Chamado_FinalDAO;
import dao.impl.Chamado_FinalDAOImpl;

public class Chamado_Final {
	Chamado_FinalTO dadosChamado_Final = null;
	Chamado_FinalDAO dao = new Chamado_FinalDAOImpl();	

	
	public Chamado_Final(Chamado_FinalTO dadosChamado_Final) 
	{
		this.dadosChamado_Final = dadosChamado_Final;
	}
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosChamado_Final);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosChamado_Final);
	}

	public void excluir() throws ClassesException 
	{
		dao.excluir(dadosChamado_Final);
	}
	


	public List<Chamado_FinalTO> consultar( int tipoWhere) throws ClassesException
	{
		
		return dao.consultar(dadosChamado_Final, tipoWhere);
	}
}
