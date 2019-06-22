package modelo;

import java.util.List;

import dao.Chamado_AceiteDAO;
import dao.impl.Chamado_AceiteDAOImpl;

public class Chamado_Aceite {
	Chamado_AceiteTO dadosChamado_Aceite = null;
	Chamado_AceiteDAO dao = new Chamado_AceiteDAOImpl();	

	
	public Chamado_Aceite(Chamado_AceiteTO dadosChamado_Aceite) 
	{
		this.dadosChamado_Aceite = dadosChamado_Aceite;
	}
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosChamado_Aceite);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosChamado_Aceite);
	}

	public void excluir() throws ClassesException 
	{
		dao.excluir(dadosChamado_Aceite);
	}
	


	public List<Chamado_AceiteTO> consultar(int tipoWhere) throws ClassesException
	{
		
		return dao.consultar(dadosChamado_Aceite,tipoWhere);
	}
}
