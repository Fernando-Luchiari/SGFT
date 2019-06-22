package dao;



import modelo.ClassesException;
import modelo.Motorista_LocalizacaoTO;

public interface Motorista_localizacaoDAO {
	public void inserir(Motorista_LocalizacaoTO item) throws ClassesException;
	
	public void alterar(Motorista_LocalizacaoTO item)throws ClassesException;
	
	public void excluir(Motorista_LocalizacaoTO item)throws ClassesException;
	
	public boolean consultaUltimaAtualizacao(Motorista_LocalizacaoTO item) throws ClassesException;
	
	public Motorista_LocalizacaoTO consultar(Motorista_LocalizacaoTO item) throws ClassesException;

}
