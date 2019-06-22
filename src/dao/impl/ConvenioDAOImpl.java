package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.ClassesException;
import modelo.ConvenioTO;
import modelo.EnderecoTO;
import dao.Conexao;
import dao.ConvenioDAO;

public class ConvenioDAOImpl implements ConvenioDAO {
	
	private PreparedStatement stmt;
	private ResultSet rs;
	
	@Override
	public ConvenioTO pegarCodConvenio(ConvenioTO item) throws ClassesException {
		ConvenioTO resultado = new ConvenioTO();
		Connection con = null;
		stmt = null;
		rs = null;

		String sql = "select cod_convenio from convenio where cnpj = "
				+ item.getCnpj();

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if (rs.next()) {
				resultado.setCodigo_convenio(rs.getInt(1));
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
	public void alterar(ConvenioTO item) throws ClassesException {
		String sql = "update convenio set razao_social = ?, nome_fantasia = ?,"
			     +"cidade = ?,estado = ?,rua = ?,bairro = ?,numero = ?,"
				+ "cep = ?, complemento = ?, telefone=?,"
				+"ddd=?, valor_limite=?, valor_gasto=?"
				+ " where cod_convenio =  " + item.getCodigo_convenio();

		Connection conn = null;
		stmt = null;
		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, item.getRazao_social());
			stmt.setString(2, item.getNome_fantasia());
			stmt.setString(3, item.getCidade());
			stmt.setString(4, item.getEstado());
			stmt.setString(5, item.getRua());
			stmt.setString(6, item.getBairro());
			stmt.setString(7, item.getNumero());
			stmt.setString(8, item.getCep());
			stmt.setString(9, item.getComplemento());
			stmt.setString(10, item.getTelefone());
			stmt.setString(11, item.getDdd());
			stmt.setString(12, item.getValor_limite());
			stmt.setString(13, item.getValor_gasto());
				
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
	public List<ConvenioTO> consultar(ConvenioTO item, int tipoWhere)
			throws ClassesException {
		ArrayList<ConvenioTO> resultado = new ArrayList<ConvenioTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		String sql = " select  cod_convenio,  razao_social,"
				+ "nome_fantasia,  cnpj,  cidade,  estado,"
				+ "rua,  bairro,  numero,  cep,  ativo,"
				+ "dataInclusao,  complemento, ifnull(telefone,'') as telefone, ifnull(ddd,'') as ddd, valor_limite, valor_gasto from convenio ";

		sql = sql + montaClausulawWhere(item, tipoWhere);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				resultado.add(new ConvenioTO(rs.getInt("cod_convenio"), rs.getString("razao_social"),
						rs.getString("nome_fantasia"), rs.getString("cnpj"), rs
								.getString("cidade"), rs.getString("estado"),
						rs.getString("rua"), rs.getString("bairro"), rs
								.getString("numero"), rs.getString("cep"), rs
								.getInt("ativo"), rs.getString("dataInclusao"),
						rs.getString("complemento"),rs.getString("telefone"),rs.getString("ddd"),rs.getString("valor_limite"),rs.getString("valor_gasto")));
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
	public void excluir(ConvenioTO item,int valor) throws ClassesException {
		String sql = "update convenio set ativo = " + valor + " where cod_convenio ="
				+ item.getCodigo_convenio();

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
	public void zerarValorGasto(ConvenioTO item) throws ClassesException {
		String sql = "update convenio set valor_gasto = " + 0 + " where cod_convenio ="
				+ item.getCodigo_convenio();

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
	public void inserir(ConvenioTO item) throws ClassesException {
		PegaDataAtual data = new PegaDataAtual();
		String sql = "insert into convenio (razao_social,"
				+ "nome_fantasia, cnpj,cidade,estado,rua,"
				+ "bairro,numero,cep," 
				+ "dataInclusao, complemento, telefone,ddd, valor_limite, valor_gasto)"
				+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement stm = null;
		try {
			conn = obtemConexao();

			stm = conn.prepareStatement(sql);
			stm.setString(1, item.getRazao_social());
			stm.setString(2, item.getNome_fantasia());
			stm.setString(3, item.getCnpj());
			stm.setString(4, item.getCidade());
			stm.setString(5, item.getEstado());
			stm.setString(6, item.getRua());
			stm.setString(7, item.getBairro());
			stm.setString(8, item.getNumero());
			stm.setString(9, item.getCep());
			stm.setString(10, data.dataAtual());
			stm.setString(11, item.getComplemento());
			stm.setString(12, item.getTelefone());
			stm.setString(13, item.getDdd());
			stm.setString(14, item.getValor_limite());
			stm.setString(15, item.getValor_gasto());

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
	
	public void alteraValorGasto(ConvenioTO item, float valor_chamado) throws ClassesException {
		
		Connection con = null;
		stmt = null;
		rs = null;
		float valor_gasto=0;
		String sql = "SELECT VALOR_GASTO FROM CONVENIO WHERE COD_CONVENIO = " + item.getCodigo_convenio();

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				valor_gasto=Float.parseFloat(rs.getString("valor_gasto"));		
				}
			
		} catch (SQLException e) {
			throw new ClassesException(e);
		} catch (Exception e) {
			throw new ClassesException(e);
		}
		
		Connection conn = null;
		PreparedStatement stm = null;
		
		valor_gasto= valor_gasto+valor_chamado;
		
		String sql2 = "update convenio set valor_gasto = " + valor_gasto + " where cod_convenio ="
		+ item.getCodigo_convenio();
		try {
			conn = obtemConexao();
			stm = conn.prepareStatement(sql2);
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


	private String montaClausulawWhere(ConvenioTO item, int tipoWhere) {

		String where = "";

		if (tipoWhere == 2) {
			where = "where cnpj = " + item.getCnpj();

		}

		if (tipoWhere == 1) {
			where = "where razao_social like '%" + item.getRazao_social()
					+ "%'";
		}
		if (tipoWhere == 3) {
			where = "where cod_convenio = " + item.getCodigo_convenio();
		}
		
		if (tipoWhere == 5) {
			where = "order by razao_social";
		}
		return where;

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


	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}

}
