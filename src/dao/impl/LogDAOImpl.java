package dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.ClassesException;
import modelo.LogTO;
import dao.Conexao;
import dao.LogDAO;

public class LogDAOImpl implements LogDAO {

	private PreparedStatement stmt;
	private ResultSet rs;

	@Override
	public void alterar(LogTO item) throws ClassesException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<LogTO> consultar(int tipoWhere, String parametro,String dataDe,String dataAte)
			throws ClassesException {
		ArrayList<LogTO> resultado = new ArrayList<LogTO>();

		Connection con = null;
		stmt = null;
		rs = null;

		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select id_usuario, tipo_usuario, tipo_alteracao, descricao, "
				+ "data from log ";

		sql = sql + montaClausulawWhere(tipoWhere, parametro, dataDe, dataAte);

		try {
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			
			while (rs.next()) {
				resultado.add(new LogTO( rs.getString("id_usuario"),rs
						.getString("tipo_usuario"),rs.getString("tipo_alteracao"),rs.getString("descricao"),
						rs.getString("data")));
				
				
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
	public void excluir(LogTO item) throws ClassesException {
		// TODO Auto-generated method stub

	}


	@Override
	public void inserir(LogTO item) throws ClassesException {

		PegaDataAtual data = new PegaDataAtual();
		// proxPassageiro ();
		String sql = "insert into log (tipo_alteracao,tipo_usuario,id_usuario,data,descricao)";

		sql = sql + " values (?,?,?,?,?)";

		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = obtemConexao();

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, item.getTipo_alteracao());
			stmt.setString(2, item.getTipo_usuario());
			stmt.setString(3, item.getid_usuario());
			stmt.setString(4, data.dataAtual());
			stmt.setString(5, item.getDescricao());
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

	private String montaClausulawWhere(int tipoWhere,String parametro,String dataDe,String dataAte) {

		String where = "";

		if (tipoWhere == 1) {
			where = "where id_usuario = '" + parametro + "' and data between '"+dataDe+"' and '"+dataAte+"'";

		}
		
		if (tipoWhere == 2){
			
			where = "where tipo_alteracao = '"+ parametro+"' and data between '"+dataDe+"' and '"+dataAte+"'";
		}

		return where;

	}

	private Connection obtemConexao() throws Exception {
		Conexao clsConexao = new Conexao();
		return clsConexao.obtemConexao();

	}

}
