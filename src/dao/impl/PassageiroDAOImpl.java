package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ClassesException;
import modelo.EnderecoTO;
import modelo.PassageiroTO;
import dao.Conexao;
import dao.PassageiroDAO;

public class PassageiroDAOImpl implements PassageiroDAO {

	private PreparedStatement stmt;
	private ResultSet rs;

	@Override
	public void alterar(PassageiroTO item) throws ClassesException {
		String sql = "update passageiro set " + "Nome = ?, " + "Rua = ?,"
		+ "Numero = ?," + "Bairro = ?," + "Cidade = ?," + "Estado = ?,"
		+ "Conveniado = ?," +  "ddd = ?,"
		+ "telefone = ?," + "complemento=?";
		if (item.getCodigo_convenio() != 0) {
			sql = sql + ",cod_convenio = ? ";
		}

		sql = sql + " where cod_passageiro = " + item.getCodigo_passageiro();

		Connection conn = null;

		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, item.getNome());
			stmt.setString(2, item.getRua());
			stmt.setString(3, item.getNumero());
			stmt.setString(4, item.getBairro());
			stmt.setString(5, item.getCidade());
			stmt.setString(6, item.getEstado());
			stmt.setInt(7, item.getConveniado());
			stmt.setString(8, item.getDdd());
			stmt.setString(9, item.getTelefone());
			stmt.setString(10, item.getComplemento());

			if (item.getCodigo_convenio() != 0) {
				stmt.setInt(11, item.getCodigo_convenio());
			}
			
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
	public List<PassageiroTO> consultar(PassageiroTO item, int tipoWhere)
	throws ClassesException {
		ArrayList<PassageiroTO> resultado = new ArrayList<PassageiroTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select cod_passageiro,cod_convenio, nome, cpf, rua,  numero,  bairro,  cidade,"
			+ " estado,  cep,  conveniado,  ativo,"
			+ " telefone,  ddd,  ifnull(complemento,'') as complemento from passageiro ";
		sql = sql + montaClausulawWhere(item, tipoWhere);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new PassageiroTO(rs.getInt("cod_passageiro"), rs
						.getInt("cod_convenio"), rs.getString("nome"), rs
						.getString("cpf"), rs.getString("rua"), rs
						.getString("numero"), rs.getString("bairro"), rs
						.getString("cidade"), rs.getString("estado"), rs
						.getString("cep"), rs.getInt("conveniado"), rs
						.getInt("ativo"), rs.getString("telefone"), rs
						.getString("ddd"), rs.getString("complemento")));
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

	public List<EnderecoTO> consultarEndereco(EnderecoTO item)
	throws ClassesException {
		ArrayList<EnderecoTO> resultado = new ArrayList<EnderecoTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select ifnull(rua,'') as rua,"+
		"ifnull(numero,'')as numero ,"+
		"ifnull(bairro,'') as bairro,"+
		"ifnull(cidade,'') as cidade,"+
		"ifnull(estado,'') as estado,"+
		"ifnull(complemento,'') as complemento,"+
		"ifnull(cep,'') as cep "+
		"from endereco where cep='"+item.getCep()+"'";

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {

				resultado.add(new EnderecoTO(rs.getString("rua"), rs
						.getString("numero"),rs.getString("bairro"), rs.getString("cidade"), rs
						.getString("estado"), rs.getString("complemento"), rs
						.getString("cep")));
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
	public void excluir(PassageiroTO item, int valor) throws ClassesException {
		String sql = "update passageiro set ativo =" + valor
		+ " where cod_passageiro = " + item.getCodigo_passageiro();

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
	public int inserir(PassageiroTO item) throws ClassesException {

		PegaDataAtual data = new PegaDataAtual();
		// proxPassageiro ();

		int cod_passageiro = 0;

		String sql = "insert into passageiro (" + "Nome, " + "Cpf," + "Rua ,"
		+ "Numero," + "Bairro ," + "Cidade," + "Estado ," + "CEP ,"
		+ "Conveniado," + "dataInclusao, ddd, telefone, complemento";

		String sql2 = "select last_insert_id() as cod_passageiro";

		if (item.getCodigo_convenio() != 0) {
			sql = sql + ",cod_convenio";
		}
		sql = sql + ") values (?,?,?,?,?,?,?,?,?,?,?,?,?";
		if (item.getCodigo_convenio() != 0) {
			sql = sql + ",?";
		}
		sql = sql + ")";

		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stm = null;

		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, item.getNome());
			stmt.setString(2, item.getCpf());
			stmt.setString(3, item.getRua());
			stmt.setString(4, item.getNumero());
			stmt.setString(5, item.getBairro());
			stmt.setString(6, item.getCidade());
			stmt.setString(7, item.getEstado());
			stmt.setString(8, item.getCep());
			stmt.setInt(9, item.getConveniado());
			stmt.setString(10, data.dataAtual());
			stmt.setString(11, item.getDdd());
			stmt.setString(12, item.getTelefone());
			stmt.setString(13, item.getComplemento());

			if (item.getCodigo_convenio() != 0)
				stmt.setInt(14, item.getCodigo_convenio());

			stmt.execute();

			stm = conn.prepareStatement(sql2);
			rs = stm.executeQuery();

			while (rs.next()) {

				cod_passageiro = rs.getInt("cod_passageiro");
			}

			return cod_passageiro;

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

	private String montaClausulawWhere(PassageiroTO item, int tipoWhere) {
		String where = "";

		if (tipoWhere == 1) {
			where = "where cpf = '" + item.getCpf() + "'";

		}

		if (tipoWhere == 2) {
			where = "where nome like '%" + item.getNome() + "%'";
		}
		if (tipoWhere == 3) {
			where = "where cod_passageiro = " + item.getCodigo_passageiro();
		}

		if (tipoWhere == 4) {
			where = "where cpf = '" + item.getCodigo_passageiro()
			+ "' and not cod_passageiro= "
			+ item.getCodigo_passageiro();
		}

		if (tipoWhere == 5) {
			where = "where telefone = '" + item.getTelefone() + "'";
		}

		if (tipoWhere == 6) {
			where = "where cod_convenio = " + item.getCodigo_convenio()+ " and ativo = 1";
		}
		return where;

	}
}
