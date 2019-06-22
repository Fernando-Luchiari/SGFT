package modelo;

import java.util.List;

import dao.ConvenioDAO;
import dao.impl.ConvenioDAOImpl;

public class Convenio {
	ConvenioTO dadosconvenio = null;
	ConvenioDAO dao = new ConvenioDAOImpl();	

	
	public Convenio(ConvenioTO dadosconvenio) 
	{
		this.dadosconvenio = dadosconvenio;
	}
	
	
	public void inserir() throws ClassesException
	{
		dao.inserir(dadosconvenio);
	}
	  

	public void alterar() throws ClassesException 
	{
		dao.alterar(dadosconvenio);
	}

	public void excluir(int valor) throws ClassesException 
	{
		dao.excluir(dadosconvenio,valor);
	}
	


	public List<ConvenioTO> consultar(int tipoWhere) throws ClassesException
	{
		
		return dao.consultar(dadosconvenio,tipoWhere);
	}
	
	public List<EnderecoTO> consultarEndereco(EnderecoTO item) throws ClassesException {

		return dao.consultarEndereco(item);
	}
	
	public ConvenioTO  pegarCodConvenio() throws ClassesException
	{
		return dao.pegarCodConvenio(dadosconvenio);
	}
	
	public void alteraValorGasto(float valor_chamado) throws ClassesException {
		
		dao.alteraValorGasto(dadosconvenio, valor_chamado);	
			
		
	}
	
public void zerarValorGasto() throws ClassesException {
		
		dao.zerarValorGasto(dadosconvenio);	
			
		
	}
	
}
