package modelo;

import java.util.List;

import dao.UsuarioDAO;
import dao.impl.UsuarioDAOImpl;

public class Usuario {

	UsuarioTO dadosUsuario = null;
	FuncionarioTO dadosFuncionario = null;
	UsuarioDAO dao = new UsuarioDAOImpl();

	public Usuario(UsuarioTO dadosUsuario, FuncionarioTO dadosFuncionario) {
		this.dadosUsuario = dadosUsuario;
		this.dadosFuncionario = dadosFuncionario;
	}

	public int inserir() throws ClassesException {
		int cod_funcionario = dao.inserir(dadosUsuario, dadosFuncionario);

		return cod_funcionario;
	}

	public void alterar() throws ClassesException {
		dao.alterar(dadosUsuario);
	}

	public void excluir(int valor) throws ClassesException {
		dao.excluir(dadosUsuario,valor);
	}
	
	public void acesso(String logado) throws ClassesException{
		
		dao.acesso(dadosUsuario, logado);
	}

	public List<UsuarioTO> consultar(int Tipowhere) throws ClassesException {

		return dao.consultar(dadosUsuario, Tipowhere);
	}
}
