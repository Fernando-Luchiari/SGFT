package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.ClassesException;
import modelo.Motorista_LocalizacaoTO;
import dao.Conexao;
import dao.Motorista_localizacaoDAO;

public class Motorista_localizacaoDAOImpl implements Motorista_localizacaoDAO {

	private PreparedStatement stmt;
	private ResultSet rs;

	@Override
	public void alterar(Motorista_LocalizacaoTO item) throws ClassesException {
		PegaDataAtual data = new PegaDataAtual();
		String sql = "update motorista_localizacao set " + "latitude = ?,"
				+ "longitude = ?," + "dataAtualizacao=?"
				+ " where id_dispositivo= " + item.getId_dispositivo()
				+ " and dataAtualizacao between'"
				+ data.dataAtualSemHora() + " 00:00:00' and '"+ data.dataAtualSemHora()+ " 23:59:59'";

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();
			stm = conn.prepareStatement(sql);
			stm.setDouble(1, item.getLatitude());
			stm.setDouble(2, item.getLongitude());
			stm.setString(3, data.dataAtual());
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
	public Motorista_LocalizacaoTO consultar(Motorista_LocalizacaoTO item)
			throws ClassesException {
		Motorista_LocalizacaoTO resultado = null;
		PegaDataAtual data = new PegaDataAtual();
		Connection con = null;
		stmt = null;
		rs = null;

		String sql = "select " + "id_dispositivo, " + "latitude," + "longitude"
				+ " from motorista_localizacao " + "where id_dispositivo = " + item.getId_dispositivo()
				+ " and dataAtualizacao between'"
				+ data.dataAtualSemHora() + " 00:00:00' and '"+ data.dataAtualSemHora()+ " 23:59:59'";
		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				resultado = new Motorista_LocalizacaoTO(rs.getInt(1), rs
						.getFloat(2), rs.getFloat(3));
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

	public boolean consultaUltimaAtualizacao(
			Motorista_LocalizacaoTO item) throws ClassesException {
		boolean hoje = false;
		int quant = 0;
		PegaDataAtual data = new PegaDataAtual();
		Connection con = null;
		stmt = null;
		rs = null;

		String SQL = "select count(*) as hoje from motorista_localizacao where dataAtualizacao between'"
				+ data.dataAtualSemHora() + " 00:00:00' and '"+ data.dataAtualSemHora()+ " 23:59:59'"
				+ " and id_dispositivo = '"
				+ item.getId_dispositivo()+"'";

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(SQL);
			rs = stmt.executeQuery();
			if (rs.next()) {
				quant = rs.getInt("hoje");
			}

			if (quant > 0) {

				hoje = true;
			}

			return hoje;
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
	public void excluir(Motorista_LocalizacaoTO item) throws ClassesException {
		String sql = "update motorista_localizacao set(" + "ativo = 1"// 1-disponivel
																		// 2-ocupado
																		// 3-fora
																		// de
																		// servi�o
				+ "where id_dispositivo = ?";

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();
			stm = conn.prepareStatement(sql);
			stm.setInt(1, item.getId_dispositivo());
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
	public void inserir(Motorista_LocalizacaoTO item) throws ClassesException {
		PegaDataAtual data = new PegaDataAtual();
		String sql = "insert into motorista_localizacao (" + "id_dispositivo,"
				+ "latitude," + "longitude," + "dataAtualizacao)"
				+ "values (?,?,?,?)";

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();
			stm = conn.prepareStatement(sql);
			stm.setInt(1, item.getId_dispositivo());
			stm.setDouble(2, item.getLatitude());
			stm.setDouble(3, item.getLongitude());
			stm.setString(4, data.dataAtual());
			// executa inserção do registro no banco
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

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}

}
