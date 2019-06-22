package dao;

import java.util.List;

import modelo.ClassesException;
import modelo.FuncionarioTO;

public interface FuncionarioDAO {

	public int inserir(FuncionarioTO item) throws ClassesException;

	public void alterar(FuncionarioTO item) throws ClassesException;

	public void excluir(FuncionarioTO item) throws ClassesException;

	public List<FuncionarioTO> consultar(FuncionarioTO dadosConsulta,
			int tipoWhere) throws ClassesException;

}
