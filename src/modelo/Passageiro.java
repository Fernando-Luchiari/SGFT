package modelo;

import java.util.List;

import dao.PassageiroDAO;
import dao.impl.PassageiroDAOImpl;

public class Passageiro {
	PassageiroTO dadosPassageiro = null;
	PassageiroDAO dao = new PassageiroDAOImpl();

	public Passageiro(PassageiroTO dadosPassageiro) {
		this.dadosPassageiro = dadosPassageiro;
	}

	public int inserir() throws ClassesException {
		int cod_passageiro = dao.inserir(dadosPassageiro);

		return cod_passageiro;
	}

	public void alterar() throws ClassesException {
		dao.alterar(dadosPassageiro);
	}

	public void excluir(int valor) throws ClassesException {
		dao.excluir(dadosPassageiro, valor);
	}

	public List<PassageiroTO> consultar(int tipowhere) throws ClassesException {

		return dao.consultar(dadosPassageiro, tipowhere);
	}
	
	public List<EnderecoTO> consultarEndereco(EnderecoTO item) throws ClassesException {

		return dao.consultarEndereco(item);
	}
}
