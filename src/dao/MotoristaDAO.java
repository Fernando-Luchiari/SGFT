package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.FuncionarioTO;
import modelo.MotoristaTO;

public interface MotoristaDAO {

	public int inserir(MotoristaTO itemM, FuncionarioTO itemF)
			throws ClassesException;

	public void alterar(MotoristaTO item) throws ClassesException;
	
	public void alterarStatus(MotoristaTO item) throws ClassesException;

	public void alterarStatusWeb(MotoristaTO item,int status) throws ClassesException;
	
	public void excluir(MotoristaTO item,int valor) throws ClassesException;

	public List<MotoristaTO> consultar(MotoristaTO dadosConsulta, int tipoWhere)
			throws ClassesException;

	public List<MotoristaTO> consultarMotoristaLivre() throws ClassesException;

}
