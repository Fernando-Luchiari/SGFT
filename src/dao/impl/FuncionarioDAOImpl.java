package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ClassesException;
import modelo.FuncionarioTO;
import dao.Conexao;
import dao.FuncionarioDAO;

public class FuncionarioDAOImpl implements FuncionarioDAO {
	private PreparedStatement stmt;
	private ResultSet rs;

	public void alterar(FuncionarioTO item) throws ClassesException {
		String sql = "update funcionario set " + "nome= ?," + "cpf = ?,"
		+ "rg = ?, " + "telefone = ?," + "ddd = ?" + " where cod_funcionario =  "
		+ item.getCodfuncionario();

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();

			stm = conn.prepareStatement(sql);

			stm.setString(1, item.getNome());
			stm.setString(2, item.getCpf());
			stm.setString(3, item.getRg());
			stm.setString(4, item.getTelefone());
			stm.setString(5, item.getDdd());

			stm.execute();
		} catch (SQLException e) {
			throw new ClassesException(e);
		} catch (Exception e) {
			throw new ClassesException(e);
		} finally {
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					throw new ClassesException(e);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					throw new ClassesException(e);
				}
			}

		}

	}

	public List<FuncionarioTO> consultar(FuncionarioTO item, int tipoWhere)
	throws ClassesException {

		ArrayList<FuncionarioTO> resultado = new ArrayList<FuncionarioTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select cod_funcionario, nome, cpf, ifnull(rg,'') as rg," +
				"ifnull(telefone,'') as telefone, ifnull(ddd,'') as ddd from funcionario";

		sql = sql + montaClausulawWhere(item, tipoWhere);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			System.out.println(stmt);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new FuncionarioTO(rs.getInt(1), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(2),rs.getString(6)));
			}
			return resultado;
		} catch (SQLException e) {
			throw new ClassesException(e);
		} catch (Exception e) {
			throw new ClassesException(e);
		}

		finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException sqle) {
					throw new ClassesException(sqle);
				}
			}
			if (stmt != null) {
				try {
					stmt.close();

				} catch (SQLException sqle) {
					throw new ClassesException(sqle);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException sqle) {
					throw new ClassesException(sqle);
				}
			}
		}

	}

	@Override
	public void excluir(FuncionarioTO item) throws ClassesException {
		String sql = "update funcionarios set ativo = 0 where cod_funcionario = "
			+ item.getCodfuncionario();

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();
			stm = conn.prepareStatement(sql);
			stm.execute();
		} catch (SQLException e) {
			throw new ClassesException(e);
		} catch (Exception e) {
			throw new ClassesException(e);
		} finally {
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					throw new ClassesException(e);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					throw new ClassesException(e);
				}
			}

		}

	}

	@Override
	public int inserir(FuncionarioTO item) throws ClassesException {

		int cod_funcionario = 0;

		String sql = "insert into funcionarios (" + "cod_funcionario, "
		+ "nome," + "cpf," + "rg, " + "telefone,ddd)" + "values (?,?,?,?,?,?)";

		String sql2 = "select last_insert_id() as cod_funcionario";

		Connection conn = null;
		PreparedStatement stm = null;
		PreparedStatement stmt = null;

		try {
			conn = obtemConexao();

			stm = conn.prepareStatement(sql);
			stm.setInt(1, item.getCodfuncionario());
			stm.setString(2, item.getNome());
			stm.setString(3, item.getCpf());
			stm.setString(4, item.getRg());
			stm.setString(5, item.getTelefone());
			stm.setString(6, item.getDdd());
			// executa inserção do registro no banco
			stm.execute();

			stmt = conn.prepareStatement(sql2);
			rs = stmt.executeQuery();

			while (rs.next()) {

				cod_funcionario = rs.getInt("cod_funcionario");
			}

			return cod_funcionario;

		} catch (SQLException e) {
			throw new ClassesException(e);
		} catch (Exception e) {
			throw new ClassesException(e);
		} finally {
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					throw new ClassesException(e);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					throw new ClassesException(e);
				}
			}

		}
	}

	private String montaClausulawWhere(FuncionarioTO item, int tipoWhere) {
		String where = "";

		if (tipoWhere == 1) {
			where = " where cpf = '" + item.getCpf() + "'";

		}

		if (tipoWhere == 2) {
			where = " where cod_funcionario = " + item.getCodfuncionario();
		}

		if (tipoWhere == 3) {
			where = " where rg = '" + item.getRg() + "'";
		}
		if (tipoWhere == 4) {
			where = " where rg = '" + item.getRg()
			+ "' and not cod_funcionario=" + item.getCodfuncionario();
		}
		if (tipoWhere == 5) {
			where = " where cpf = '" + item.getCpf()
			+ "' and not cod_funcionario=" + item.getCodfuncionario();
		}
		if (tipoWhere == 6) {			
			where = " where nome like '%" + item.getNome() + "%'";			
		}
		return where;

	}

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}
}
