package modelo;

import java.util.List;

import dao.MotoristaDAO;
import dao.impl.MotoristaDAOImpl;

public class Motorista {
	MotoristaTO dadosMotorista = null;
	FuncionarioTO dadosFuncionario = null;
	MotoristaDAO dao = new MotoristaDAOImpl();

	public Motorista(MotoristaTO dadosMotorista, FuncionarioTO dadosFuncionario) {
		this.dadosMotorista = dadosMotorista;
		this.dadosFuncionario = dadosFuncionario;
	}

	public int inserir() throws ClassesException {
		int cod_funcionario = dao.inserir(dadosMotorista, dadosFuncionario);

		return cod_funcionario;
	}

	public void alterar() throws ClassesException {
		dao.alterar(dadosMotorista);
	}
	
	public void alterarStatus() throws ClassesException {
		dao.alterarStatus(dadosMotorista);
	}
	
	public void alterarStatusWeb(int status) throws ClassesException {
		dao.alterarStatusWeb(dadosMotorista,status);
	}

	public void excluir(int valor) throws ClassesException {
		dao.excluir(dadosMotorista,valor);
	}

	public List<MotoristaTO> consultar(int tipoWhere) throws ClassesException {

		return dao.consultar(dadosMotorista, tipoWhere);
	}
}
