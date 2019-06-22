package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.FuncionarioTO;
import modelo.UsuarioTO;

public interface UsuarioDAO {

	public int inserir(UsuarioTO itemU, FuncionarioTO itemF)
			throws ClassesException;

	public void alterar(UsuarioTO item) throws ClassesException;

	public void excluir(UsuarioTO item,int valor) throws ClassesException;

	public List<UsuarioTO> consultar(UsuarioTO dadosConsulta, int tipoWhere)
			throws ClassesException;
	
	public void acesso(UsuarioTO item,String logado) throws ClassesException;

}
