package modelo;

import java.util.List;

import dao.Chamado_ClienteDAO;
import dao.impl.Chamado_ClienteDAOImpl;

public class Chamado_Cliente {
	Chamado_ClienteTO dadosChamado_Cliente = null;
	Chamado_ClienteDAO dao = new Chamado_ClienteDAOImpl();
    
	public Chamado_Cliente() {
		
	}
	
	public Chamado_Cliente(Chamado_ClienteTO dadosChamado_Cliente) {
		this.dadosChamado_Cliente = dadosChamado_Cliente;
	}

	public int inserir() throws ClassesException {

		int cod_chamado = dao.inserir(dadosChamado_Cliente);

		return cod_chamado;
	}

	public void cancelar() throws ClassesException {
		dao.cancelar(dadosChamado_Cliente);
	}
	
	public void alterarStatus() throws ClassesException {
		dao.alterarStatus(dadosChamado_Cliente);
	}

	public List<Chamado_ClienteTO> consultar(int tipoWhere)
	throws ClassesException {

		return dao.consultar(dadosChamado_Cliente, tipoWhere);
	}

	public List<ChamadoRelatTO> consultarRelatorio(int tipoParametro, String parametro, String dataDe,String dataAte) 
	throws ClassesException{

		return dao.consultarRelatorio(tipoParametro,parametro,dataDe,dataAte);
	}

	public Chamado_ClienteTO consultarChamado() throws ClassesException {

		return dao.consultarChamado(dadosChamado_Cliente);
	}
	
	public List<EnderecoTO> consultarEndereco(EnderecoTO item) throws ClassesException {

		return dao.consultarEndereco(item);
	}
}
