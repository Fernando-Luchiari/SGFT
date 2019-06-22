package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Chamado_AceiteTO;
import modelo.ClassesException;
import dao.Chamado_AceiteDAO;
import dao.Conexao;

public class Chamado_AceiteDAOImpl implements Chamado_AceiteDAO {
	
	private PreparedStatement stmt;
	private ResultSet rs;
	
	@Override
	public void alterar(Chamado_AceiteTO item) throws ClassesException {
		String sql = "update chamado_motorista_aceite set"
			+ "cod_chamado = ?," 
			+ "id_dispositivo = ?,"
			+ "data_aceite = ?,"
			+ "justificativa = ?"
			+ "where cod_aceite = ? ";

			Connection conn = null;
			PreparedStatement stm = null;
			try 
			{
				conn = obtemConexao();
				
				stm = conn.prepareStatement(sql);
				
				stm.setInt(1, item.getCodigo_chamado());
				stm.setString(2, item.getId_dispositivo());
				stm.setString(3, item.getData());
				stm.setString(4, item.getJustificativa());
				stm.setInt(5, item.getCodigo_Aceite());
				stm.execute();
			}
			catch (SQLException e){
				throw new ClassesException(e);
			}
			catch (Exception e){
				throw new ClassesException(e);
			} 
			finally{
				if (stm != null){
					try{
						stm.close();
					} catch (SQLException e)
					{
						throw new ClassesException(e);
					}
				}if (conn != null){
					try{
						conn.close();
					}catch (SQLException e){
						throw new ClassesException(e);
					}
				}
			
			}

	}

	@Override
	public List<Chamado_AceiteTO> consultar(Chamado_AceiteTO item,int tipoWhere)
			throws ClassesException {
		ArrayList<Chamado_AceiteTO> resultado = new ArrayList<Chamado_AceiteTO>();

		Connection con = null;
		stmt = null;
		rs = null;
		
		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select " 
			+ "cod_chamado," 
			+ "id_dispositivo ,"
			+ "data_aceite  ,"
			+ "justificativa  "
			+ " from chamado_motorista_aceite ";
			sql = sql + montaClausulawWhere(item, tipoWhere);
		
		try 
		{
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next())
			{
				resultado.add(new Chamado_AceiteTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)));
			}
			return resultado;
		} 
		catch (SQLException e) 
		{
			throw new ClassesException(e);
		} 
		catch (Exception e) 
		{
			throw new ClassesException(e);
		} 
		
		finally 
		{
			if (rs != null) 
			{
				try 
				{
					rs.close();
				}
				catch(SQLException sqle)
				{
					throw new ClassesException(sqle);
				}
			}
			if (stmt != null)
			{
				try 
				{
					stmt.close();
				
				}catch(SQLException sqle)
				{
					throw new ClassesException(sqle);
				}
			}
			if (con != null) 
			{
				try 
				{
					con.close();
				}
				catch(SQLException sqle)
				{
					throw new ClassesException(sqle);
				}
			}			
		}
	}

	@Override
	public void excluir(Chamado_AceiteTO item) throws ClassesException {
		// TODO Auto-generated method stub

	}

	@Override
	public void inserir(Chamado_AceiteTO item) throws ClassesException {

		PegaDataAtual data = new PegaDataAtual();
		String sql = "insert into chamado_motorista_aceite (" 
			+ "cod_chamado," 
			+ "id_dispositivo,"
			+ "justificativa,"
			+ "data_aceite )"
			+ "values (?,?,?,?)";

			Connection conn = null;
			PreparedStatement stm = null;
			try 
			{
				conn = obtemConexao();
				
				stm = conn.prepareStatement(sql);
				stm.setInt(1, item.getCodigo_chamado());
				stm.setString(2, item.getId_dispositivo());
				stm.setString(3, item.getJustificativa());
				stm.setString(4, data.dataAtual());
				// executa inserção do registro no banco
				stm.execute();
			}
			catch (SQLException e){
				throw new ClassesException(e);
			}
			catch (Exception e){
				throw new ClassesException(e);
			} 
			finally{
				if (stm != null){
					try{
						stm.close();
					} catch (SQLException e)
					{
						throw new ClassesException(e);
					}
				}if (conn != null){
					try{
						conn.close();
					}catch (SQLException e){
						throw new ClassesException(e);
					}
				}
			
			}


	}
	
	private String montaClausulawWhere(Chamado_AceiteTO item, int tipoWhere) {
		String where = "";

		if (tipoWhere == 1) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()+ "'"  
			+ " and cod_chamado = " + item.getCodigo_chamado()
			+" and justificativa is not null";

		}
		
		if (tipoWhere == 2) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()+ "'"  
			+ " and cod_chamado = " + item.getCodigo_chamado()
			+" and justificativa is null";

		}
		return where;
	}
	
	private Connection obtemConexao() throws Exception
	{
			Conexao clsConexao = new Conexao();
			return clsConexao.obtemConexao();
		
	}
	
}
