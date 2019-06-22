package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ClassesException;
import modelo.FuncionarioTO;
import modelo.UsuarioTO;
import dao.Conexao;
import dao.UsuarioDAO;

public class UsuarioDAOImpl implements UsuarioDAO {

	private PreparedStatement stmt;
	private ResultSet rs;

	public void alterar(UsuarioTO item) throws ClassesException {
		String sql = "update usuario set " + "senha = ?," + "login = ?, "
				+ "supervisor = ? where cod_funcionario= "
				+ item.getCodfuncionario();

		Connection conn = null;

		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, item.getSenha());
			stmt.setString(2, item.getLogin());
			stmt.setInt(3, item.getSupervisor());

			stmt.execute();
		} catch (SQLException e) {
			throw new ClassesException(e);
		} catch (Exception e) {
			throw new ClassesException(e);
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
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
	public List<UsuarioTO> consultar(UsuarioTO dadosConsulta, int tipoWhere)
			throws ClassesException {
		ArrayList<UsuarioTO> resultado = new ArrayList<UsuarioTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select * from usuario ";

		sql = sql + montaClausulawWhere(dadosConsulta, tipoWhere);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new UsuarioTO(rs.getInt(2), rs.getString(3), rs
						.getString(1), rs.getInt(4), rs.getInt(5), rs
						.getString(6),rs.getString("logado")));
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
	public void excluir(UsuarioTO item,int valor) throws ClassesException {
		String sql = "update usuario set ativo = " + valor 
				+ " where cod_funcionario = " + item.getCodfuncionario();

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
	
	public void acesso(UsuarioTO item,String logado) throws ClassesException {
		String sql = "update usuario set logado = '" + logado 
				+ "' where login = '" + item.getLogin()+"'";

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
	public int inserir(UsuarioTO itemU, FuncionarioTO itemF)
			throws ClassesException {

		int cod_funcionario = 0;
		String sql = "call SP_USUARIO_INS(" + "?," + "?," + "?," + "?," + "?,"
				+ "?,?," + "?)";
		String sql2 = "select last_insert_id() as cod_funcionario";
		Connection conn = null;
		rs = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, itemF.getNome());
			stmt.setString(2, itemF.getCpf());
			stmt.setString(3, itemF.getRg());
			stmt.setString(4, itemF.getTelefone());
			stmt.setString(5, itemF.getDdd());
			stmt.setString(6, itemU.getLogin());
			stmt.setInt(7, itemU.getSupervisor());
			stmt.setString(8, itemU.getSenha());			
			// executa inserção do registro no banco
			stmt.executeQuery();
			stm = conn.prepareStatement(sql2);
			rs = stm.executeQuery();
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

	private String montaClausulawWhere(UsuarioTO item, int tipoWhere) {

		String where = "";

		if (tipoWhere == 1) {
			where = "where cod_funcionario = " + item.getCodfuncionario();

		}

		if (tipoWhere == 2) {
			where = "where login = '" + item.getLogin() + "' and senha='"+item.getSenha()+"' and ativo = 1";
		}

		if (tipoWhere == 3) {
			where = "where login = '" + item.getLogin()
					+ "' and not cod_funcionario=" + item.getCodfuncionario();
		}

		if (tipoWhere == 4) {
			where = "where login = '" + item.getLogin() + "' and  senha= '"
					+ item.getSenha() + "'";
		}
		
		if (tipoWhere == 5) {
			where = "where login = '" + item.getLogin() + "' and  senha= '"
					+ item.getSenha() + "' and logado='N'";
		}
		
		if (tipoWhere == 7) {
			where = "order by cod_funcionario desc";
		}


		return where;

	}

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();
	}

}
