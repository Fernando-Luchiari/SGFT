package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ClassesException;
import modelo.StatusTO;
import dao.Conexao;
import dao.StatusDAO;

public class StatusDAOImpl implements StatusDAO {

	private PreparedStatement stmt;
	private ResultSet rs;

	@Override
	public void alterar(StatusTO item) throws ClassesException {
		String sql = "update status set(" + "descricao = ?"
				+ "where cod_status = ? ";

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();

			stm = conn.prepareStatement(sql);

			stm.setString(1, item.getDescricao());
			stm.setInt(2, item.getCodigo_status());
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
	public List<StatusTO> consultar(StatusTO item) throws ClassesException {
		ArrayList<StatusTO> resultado = new ArrayList<StatusTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select descricao, cod_status " + " from status "
				+ " where cod_status = " + item.getCodigo_status();

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new StatusTO(rs.getInt("cod_status"), rs
						.getString("descricao")));
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
	public void excluir(StatusTO item) throws ClassesException {
		// TODO Auto-generated method stub

	}

	@Override
	public void inserir(StatusTO item) throws ClassesException {
		// TODO Auto-generated method stub

	}

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}

}
