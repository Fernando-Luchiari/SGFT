package dao;

import java.util.List;

import modelo.ChamadoRelatTO;
import modelo.Chamado_ClienteTO;
import modelo.ClassesException;
import modelo.EnderecoTO;

public interface Chamado_ClienteDAO {
	public int inserir(Chamado_ClienteTO item) throws ClassesException;
	
	public void alterarStatus(Chamado_ClienteTO item) throws ClassesException;

	public List<Chamado_ClienteTO> consultar(Chamado_ClienteTO item,
			int tipoWhere) throws ClassesException;

	public Chamado_ClienteTO consultarChamado(Chamado_ClienteTO item)
			throws ClassesException;
	
	public List<EnderecoTO> consultarEndereco(EnderecoTO item) throws ClassesException;
	
	public List<ChamadoRelatTO> consultarRelatorio(int tipoParametro, String parametro, String dataDe,String dataAte) throws ClassesException;

	void cancelar(Chamado_ClienteTO item) throws ClassesException;
}
