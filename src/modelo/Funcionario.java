package modelo;

import java.util.List;

import dao.FuncionarioDAO;
import dao.impl.FuncionarioDAOImpl;

public class Funcionario {
	
	FuncionarioTO dadosfuncionario = null;
	FuncionarioDAO dao = new FuncionarioDAOImpl();	

	
	public Funcionario(FuncionarioTO dadosfuncionario) 
	{
		this.dadosfuncionario = dadosfuncionario;
	}
	
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosfuncionario);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosfuncionario);
	}

	public void excluir() throws ClassesException 
	{
		dao.excluir(dadosfuncionario);
	}
	


	public List<FuncionarioTO> consultar(int tipoWhere) throws ClassesException
	{
		
		return dao.consultar(dadosfuncionario,tipoWhere);
	}
	
	
}

