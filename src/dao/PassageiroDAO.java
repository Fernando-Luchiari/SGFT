package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.EnderecoTO;
import modelo.PassageiroTO;

public interface PassageiroDAO {

	public int inserir(PassageiroTO item) throws ClassesException;

	public void alterar(PassageiroTO item) throws ClassesException;

	public void excluir(PassageiroTO item, int valor) throws ClassesException;

	public List<PassageiroTO> consultar(PassageiroTO item, int tipoWhere)
			throws ClassesException;
	
	public List<EnderecoTO> consultarEndereco(EnderecoTO item)
	throws ClassesException;

}
