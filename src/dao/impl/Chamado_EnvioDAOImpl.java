package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Chamado_EnvioTO;
import modelo.ClassesException;
import dao.Chamado_EnvioDAO;
import dao.Conexao;

public class Chamado_EnvioDAOImpl implements Chamado_EnvioDAO {
	
	private PreparedStatement stmt;
	private ResultSet rs;
	
	@Override
	public void alterar(Chamado_EnvioTO item) throws ClassesException {
		String sql = "update chamado_motorista_envio set"
			+ "cod_chamado = ?," 
			+ "id_dispositivo = ?,"
			+ "data_envio = ? "
			+ "where cod_envio = ? ";

			Connection conn = null;
			PreparedStatement stm = null;
			try 
			{
				conn = obtemConexao();
				
				stm = conn.prepareStatement(sql);
				
				stm.setInt(1, item.getCodigo_chamado());
				stm.setInt(2, item.getId_dispositivo());
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
	public List<Chamado_EnvioTO> consultar(Chamado_EnvioTO item,int tipoWhere)
			throws ClassesException {
		ArrayList<Chamado_EnvioTO> resultado = new ArrayList<Chamado_EnvioTO>();

		Connection con = null;
		stmt = null;
		rs = null;
		
		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select " 
			+ "cod_chamado," 
			+ "id_dispositivo,"
			+ "cod_envio," 
			+ "data_envio"
			+ " from chamado_motorista_envio ";
			sql = sql + montaClausulawWhere(item, tipoWhere);
		
		try 
		{
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next())
			{
				resultado.add(new Chamado_EnvioTO(
						rs.getInt("cod_envio"),
						rs.getInt("cod_chamado"),
						rs.getInt("id_dispositivo"),
						rs.getString("data_envio")));
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

public List<Chamado_EnvioTO> consultarUtimoEnvio(Chamado_EnvioTO item,int tipoWhere)
	throws ClassesException {
ArrayList<Chamado_EnvioTO> resultado = new ArrayList<Chamado_EnvioTO>();

Connection con = null;
stmt = null;
rs = null;

// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
// informado no filtro.
String sql = "select  cod_envio,cod_chamado,id_dispositivo,data_envio from chamado_motorista_envio  ";
	sql = sql + montaClausulawWhere(item, tipoWhere);

try 
{
	con = obtemConexao();
	stmt = con.prepareStatement(sql);
	rs = stmt.executeQuery();
	while (rs.next())
	{
		resultado.add(new Chamado_EnvioTO(
				rs.getInt("cod_envio"),
				rs.getInt("cod_chamado"),
				rs.getInt("id_dispositivo"),
				rs.getString("data_envio")));
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
	public void excluir(Chamado_EnvioTO item) throws ClassesException {
		String sql = "delete from chamado_motorista_envio where cod_envio = ? ";
		
		Connection conn = null;
		 stmt = null;
		try 
		{
			// obtem conexao com o banco
			//
			conn = obtemConexao();
			
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, item.getCodigo_envio());
			
			stmt.execute();
			
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
			
			if(stmt != null) 
			{
				try 
				{
					stmt.close();
				} 
				catch (SQLException e) 
				{
					throw new ClassesException(e);
				}
			}
			
			if(conn != null) 
			{
				try 
				{
					conn.close();
				} 
				catch (SQLException e) 
				{
					throw new ClassesException(e);
				}
			}
		}

	}

	@Override
	public void inserir(Chamado_EnvioTO item) throws ClassesException {
		PegaDataAtual data = new PegaDataAtual();
		String sql = "insert into chamado_motorista_envio ("
			+ "cod_envio, " 
			+ "cod_chamado," 
			+ "id_dispositivo,"
			+ "data_envio )"
			+ "values (?,?,?,?)";

			Connection conn = null;
			PreparedStatement stm = null;
			try 
			{
				conn = obtemConexao();
				
				stm = conn.prepareStatement(sql);
				stm.setInt(1, item.getCodigo_envio());
				stm.setInt(2, item.getCodigo_chamado());
				stm.setInt(3, item.getId_dispositivo());
				stm.setString(4,data.dataAtual());
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
	
	private String montaClausulawWhere(Chamado_EnvioTO item, int tipoWhere) {
		String where = "";

		if (tipoWhere == 1) {
			where = "where id_dispositivo = '" + item.getId_dispositivo()+ "'";

		}
		
		if (tipoWhere == 2) {
			where = "where cod_chamado = " + item.getCodigo_chamado()+ " order by cod_envio desc ";

		}
		return where;
	}
	private Connection obtemConexao() throws Exception
	{
			Conexao clsConexao = new Conexao();
			return clsConexao.obtemConexao();
		
	}
	
}
