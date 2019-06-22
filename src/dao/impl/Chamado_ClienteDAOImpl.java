package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ChamadoRelatTO;
import modelo.Chamado_ClienteTO;
import modelo.ClassesException;
import modelo.EnderecoTO;
import dao.Chamado_ClienteDAO;
import dao.Conexao;

public class Chamado_ClienteDAOImpl implements Chamado_ClienteDAO {

	private PreparedStatement stmt;
	private ResultSet rs;

	@Override
	public void cancelar(Chamado_ClienteTO item) throws ClassesException {
		String sql = "update chamado_cliente set cod_status = 4, justificativa=?"
				+ "where cod_chamado = " + item.getCodigo_chamado();

		Connection conn = null;
		stmt = null;
		try {
			conn = obtemConexao();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, item.getJustificativa());
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
	public List<Chamado_ClienteTO> consultar(Chamado_ClienteTO item,
			int tipoWhere) throws ClassesException {
		ArrayList<Chamado_ClienteTO> resultado = new ArrayList<Chamado_ClienteTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		String sql = "select cod_chamado, cod_status, cod_passageiro, rua_origem,  numero_origem,"
				+ "bairro_origem,  cidade_origem,  estado_origem,"
				+ "cep_origem,  rua_destino,  numero_destino,"
				+ "bairro_destino,  cidade_destino,"
				+ "estado_destino,  cep_destino,  dataInclusao,"
				+ "complemento_origem,  complemento_destino, ifnull(justificativa,'') as justificativa, convenio from chamado_cliente ";

		sql = sql + montaClausulawWhere(item, tipoWhere);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {

				resultado.add(new Chamado_ClienteTO(rs.getInt("cod_chamado"),
						rs.getInt("cod_status"), rs.getInt("cod_passageiro"),
						rs.getString("rua_origem"), rs
								.getString("numero_origem"), rs
								.getString("bairro_origem"), rs
								.getString("cidade_origem"), rs
								.getString("estado_origem"), rs
								.getString("cep_origem"), rs
								.getString("rua_destino"), rs
								.getString("numero_destino"), rs
								.getString("bairro_destino"), rs
								.getString("cidade_destino"), rs
								.getString("estado_destino"), rs
								.getString("cep_destino"), rs
								.getString("dataInclusao"), rs
								.getString("complemento_origem"), rs
								.getString("complemento_destino"),rs.getString("justificativa"),rs.getString("convenio")));
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
	
	public List<ChamadoRelatTO> consultarRelatorio(int tipoParametro, String parametro, String dataDe,String dataAte) throws ClassesException {
		
		ArrayList<ChamadoRelatTO> resultado = new ArrayList<ChamadoRelatTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		String sql = "call SP_RELATORIO_CHAMADO_SEL ("+tipoParametro+",'"+parametro+"','"+dataDe+"','"+dataAte+"')";

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new ChamadoRelatTO(rs.getInt("cod_chamado"),rs.getString("Status"),rs.getString("passageiro"),rs.getString("cpf"),rs.getString("convenio"),rs.getString("cnpj"),
						rs.getString("dataInclusao"),rs.getString("motorista"),rs.getString("id_dispositivo"),rs.getString("data_envio"),rs.getString("data_aceite"),
						rs.getString("justificativa_recusa"),rs.getString("justificativa_cancelamento"),rs.getString("data_fechamento"),rs.getFloat("valor"),rs.getString("convenioCheck")));
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
	public Chamado_ClienteTO consultarChamado(Chamado_ClienteTO item)
			throws ClassesException {
		Chamado_ClienteTO resultado = null;

		Connection con = null;
		stmt = null;
		rs = null;

		String sql = "select cod_chamado, cod_status, cod_passageiro, rua_origem,  numero_origem,"
				+ "bairro_origem,  cidade_origem,  estado_origem,"
				+ "cep_origem,  rua_destino,  numero_destino,"
				+ "bairro_destino,  cidade_destino,"
				+ "estado_destino,  cep_destino,  dataInclusao,"
				+ "complemento_origem,  complemento_destino, ifnull(justificativa,'') as justificativa, convenio from chamado_cliente where cod_chamado = "
				+ item.getCodigo_chamado();

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado = new Chamado_ClienteTO(rs.getInt("cod_chamado"), rs
						.getInt("cod_status"), rs.getInt("cod_passageiro"), rs
						.getString("rua_origem"),
						rs.getString("numero_origem"), rs
								.getString("bairro_origem"), rs
								.getString("cidade_origem"), rs
								.getString("estado_origem"), rs
								.getString("cep_origem"), rs
								.getString("rua_destino"), rs
								.getString("numero_destino"), rs
								.getString("bairro_destino"), rs
								.getString("cidade_destino"), rs
								.getString("estado_destino"), rs
								.getString("cep_destino"), rs
								.getString("dataInclusao"), rs
								.getString("complemento_origem"), rs
								.getString("complemento_destino"),rs.getString("justificativa"),rs.getString("convenio"));
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

	public Chamado_ClienteTO consultarChamado(Chamado_ClienteTO item,
			int tipoWhere) throws ClassesException {
		Chamado_ClienteTO resultado = new Chamado_ClienteTO();

		Connection con = null;
		stmt = null;
		rs = null;

		String sql = "select cod_chamado, cod_status, cod_passageiro, rua_origem,  numero_origem,"
				+ "bairro_origem,  cidade_origem,  estado_origem,"
				+ "cep_origem,  rua_destino,  numero_destino,"
				+ "bairro_destino,  cidade_destino,"
				+ "estado_destino,  cep_destino,  dataInclusao,"
				+ "complemento_origem,  complemento_destino, ifnull(justificativa,'') as justificativa, convenio from chamado_cliente where cod_chamado = "
				+ item.getCodigo_chamado();

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado = new Chamado_ClienteTO(rs.getInt("cod_chamado"), rs
						.getInt("cod_status"), rs.getInt("cod_passageiro"), rs
						.getString("rua_origem"),
						rs.getString("numero_origem"), rs
								.getString("bairro_origem"), rs
								.getString("cidade_origem"), rs
								.getString("estado_origem"), rs
								.getString("cep_origem"), rs
								.getString("rua_destino"), rs
								.getString("numero_destino"), rs
								.getString("bairro_destino"), rs
								.getString("cidade_destino"), rs
								.getString("estado_destino"), rs
								.getString("cep_destino"), rs
								.getString("data_inclusao"), rs
								.getString("complemento_origem"), rs
								.getString("complemento_destino"),rs.getString("justificativa"),rs.getString("convenio"));
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
	public int inserir(Chamado_ClienteTO item) throws ClassesException {
		PegaDataAtual data = new PegaDataAtual();
		rs = null;
		int cod_chamado = 0;

		String sql = "insert into chamado_cliente (" + "cod_status ,"
				+ "cod_passageiro," + "rua_origem ," + "numero_origem ,"
				+ "bairro_origem ," + "cidade_origem ," + "estado_origem ,"
				+ "cep_origem ," + "rua_destino ," + "numero_destino,"
				+ "bairro_destino ," + "cidade_destino ," + "estado_destino ,"
				+ "cep_destino ,"
				+ "dataInclusao, complemento_origem,complemento_destino,convenio)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		String sql2 = "select last_insert_id() as cod_chamado";

		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, item.getCodigo_status());
			stmt.setInt(2, item.getCodigo_passageiro());
			stmt.setString(3, item.getRua_origem());
			stmt.setString(4, item.getNumero_origem());
			stmt.setString(5, item.getBairro_origem());
			stmt.setString(6, item.getCidade_origem());
			stmt.setString(7, item.getEstado_origem());
			stmt.setString(8, item.getCep_origem());
			stmt.setString(9, item.getRua_destino());
			stmt.setString(10, item.getNumero_destino());
			stmt.setString(11, item.getBairro_destino());
			stmt.setString(12, item.getCidade_destino());
			stmt.setString(13, item.getEstado_destino());
			stmt.setString(14, item.getCep_destino());
			stmt.setString(15, data.dataAtual());
			stmt.setString(16, item.getComplementoOrigem());
			stmt.setString(17, item.getComplementoDestino());
			stmt.setString(18, item.getConvenio());
	
			stmt.execute();

			stm = conn.prepareStatement(sql2);
			rs = stm.executeQuery();

			while (rs.next()) {

				cod_chamado = rs.getInt("cod_chamado");
			}

			return cod_chamado;

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



	private String montaClausulawWhere(Chamado_ClienteTO item, int tipoWhere) {
		String where = "";

		if (tipoWhere == 1) {
			where = "order by cod_chamado desc";

		}

		if (tipoWhere == 2) {
			where = "where cod_chamado = " + item.getCodigo_chamado();
		}

		if (tipoWhere == 4) {

			where = "where cod_passageiro = " + item.getCodigo_passageiro()
					+ " and cod_status in(1,2)";
		}
		
		if(tipoWhere == 5){
			where = "where cod_status = 6" ;
		}

		return where;

	}

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}

	@Override
	public void alterarStatus(Chamado_ClienteTO item)
			throws ClassesException {
		String sql = "update chamado_cliente set cod_status = ?"
		
		+ " where cod_chamado = " + item.getCodigo_chamado();

		Connection conn = null;
		stmt = null;
		try {
			conn = obtemConexao();
		
			stmt = conn.prepareStatement(sql);		
			stmt.setInt(1, item.getCodigo_status());
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

}
