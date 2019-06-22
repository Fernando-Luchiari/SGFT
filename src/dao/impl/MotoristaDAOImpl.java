package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ClassesException;
import modelo.FuncionarioTO;
import modelo.MotoristaTO;
import dao.Conexao;
import dao.MotoristaDAO;

public class MotoristaDAOImpl implements MotoristaDAO {
	private PreparedStatement stmt;
	private ResultSet rs;

	public void alterar(MotoristaTO item) throws ClassesException {
		String sql = "update motorista set modelo_veiculo = ?, "
				+ "placa_veiculo = ?," + "ano_veiculo = ?,"
				+ " proprietario = ?," + " ativo = ?," + " senha = ?"
				+ " where cod_funcionario =  " + item.getCodfuncionario();

		Connection conn = null;

		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, item.getModelo_veiculo());
			stmt.setString(2, item.getPlaca());
			stmt.setInt(3, item.getAno_veiculo());
			stmt.setInt(4, item.getProprietario());
			stmt.setInt(5, item.getAtivo());
			stmt.setString(6, item.getSenha());
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
	public List<MotoristaTO> consultar(MotoristaTO dadosConsulta, int tipoWhere)
			throws ClassesException {
		ArrayList<MotoristaTO> resultado = new ArrayList<MotoristaTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select * from motorista ";
		sql = sql + montaClausulawWhere(dadosConsulta, tipoWhere);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new MotoristaTO(rs.getInt(2), rs.getInt(3), rs
						.getInt(1), rs.getString(4), rs.getString(5), rs
						.getInt(6), rs.getInt(8), rs.getString(7), rs
						.getString(9),rs.getInt(10)));
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
	public void excluir(MotoristaTO item,int valor) throws ClassesException {
		String sql = "update motorista set ativo = " + valor + " where id_dispositivo = "
				+ item.getId_dispositivo();

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

	public int inserir(MotoristaTO itemM, FuncionarioTO itemF)
			throws ClassesException {
		String sql = "CALL `sgft`.`SP_MOTORISTA_INS`(?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2 = "select last_insert_id() as cod_funcionario";
		Connection conn = null;
		rs = null;
		PreparedStatement stm = null;
		int cod_funcionario = 0;
		try {

			conn = obtemConexao();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, itemF.getNome());
			stmt.setString(2, itemF.getCpf());
			stmt.setString(3, itemF.getRg());
			stmt.setString(4, itemF.getTelefone());
			stmt.setString(5, itemF.getDdd());
			stmt.setInt(6, itemM.getId_dispositivo());
			stmt.setString(7, itemM.getModelo_veiculo());
			stmt.setString(8, itemM.getPlaca());
			stmt.setInt(9, itemM.getAno_veiculo());
			stmt.setInt(10, itemM.getProprietario());
			stmt.setInt(11, itemM.getAtivo());
			stmt.setString(12, itemM.getSenha());

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

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}

	@Override
	public List<MotoristaTO> consultarMotoristaLivre() throws ClassesException {
		ArrayList<MotoristaTO> resultado = new ArrayList<MotoristaTO>();
		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select " + "id_dispositivo," + "status"
				+ " from motorista " + "where status = 1 and statusWeb = 1";
		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new MotoristaTO(rs.getInt(1), rs.getInt(2)));
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
	
	public void alterarStatus(MotoristaTO item) throws ClassesException {
		String sql = "update motorista set status=" + item.getStatus()
				+ " where id_dispositivo =  " + item.getId_dispositivo();

		Connection conn = null;

		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);
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
	
	public void alterarStatusWeb(MotoristaTO item,int status) throws ClassesException {
		String sql = "update motorista set statusWeb=" + status
				+ " where id_dispositivo =  " + item.getId_dispositivo();

		Connection conn = null;

		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);
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
	
	private String montaClausulawWhere(MotoristaTO item, int tipoWhere) {

		String where = "";

		if (tipoWhere == 1) {
			where = "where cod_funcionario = " + item.getCodfuncionario();

		}
		if (tipoWhere == 2) {
			where = "where id_dispositivo = '" + item.getId_dispositivo() + "'";
		}

		if (tipoWhere == 3) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()
					+ "' and not cod_funcionario= " + item.getCodfuncionario();
		}		
		if (tipoWhere == 4) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()
			+ "' and senha= '" + item.getSenha()+"'";			

		}		
		if (tipoWhere == 5) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()
			+ "' and statusWeb = " + 1;		

		}	
		if (tipoWhere == 7) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()
			+ "' and status = " + 1 +" or status=" + 2;		

		}
		if (tipoWhere == 6) {
			where = "order by cod_funcionario desc";		

		}
		return where;

	}

}
