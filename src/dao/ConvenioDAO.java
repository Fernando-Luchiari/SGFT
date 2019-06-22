package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.ConvenioTO;
import modelo.EnderecoTO;

public interface ConvenioDAO {
	public void inserir(ConvenioTO item) throws ClassesException;
	
	public void alterar(ConvenioTO item)throws ClassesException;
	
	public void excluir(ConvenioTO item,int valor)throws ClassesException;
	
	public List<ConvenioTO> consultar(ConvenioTO item,int tipoWhere) throws ClassesException;
	
	public List<EnderecoTO> consultarEndereco(EnderecoTO item) throws ClassesException;
	
	public ConvenioTO pegarCodConvenio(ConvenioTO item)throws ClassesException;
	
	public void alteraValorGasto(ConvenioTO item, float valor_chamado) throws ClassesException ;
	
	public void zerarValorGasto(ConvenioTO item) throws ClassesException;

}
