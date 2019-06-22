package modelo;



import dao.Motorista_localizacaoDAO;
import dao.impl.Motorista_localizacaoDAOImpl;


public class Motorista_Localizacao {
	Motorista_LocalizacaoTO dadosMotorista_Localizacao = null;
	Motorista_localizacaoDAO dao = new Motorista_localizacaoDAOImpl();	

	
	public Motorista_Localizacao(Motorista_LocalizacaoTO dadosMotorista_Localizacao) 
	{
		this.dadosMotorista_Localizacao = dadosMotorista_Localizacao;
	}
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosMotorista_Localizacao);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosMotorista_Localizacao);
	}

	public void excluir() throws ClassesException 
	{
		dao.excluir(dadosMotorista_Localizacao);
	}
	
	public boolean consultaUltimaAtualizacao() throws ClassesException
	{
		
		return dao.consultaUltimaAtualizacao(dadosMotorista_Localizacao);
	}

	public Motorista_LocalizacaoTO consultar() throws ClassesException
	{
		
		return dao.consultar(dadosMotorista_Localizacao);
	}
}
