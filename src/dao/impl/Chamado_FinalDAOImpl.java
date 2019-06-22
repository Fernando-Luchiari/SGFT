package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Chamado_EnvioTO;
import modelo.Chamado_FinalTO;
import modelo.ClassesException;
import dao.Chamado_FinalDAO;
import dao.Conexao;

public class Chamado_FinalDAOImpl implements Chamado_FinalDAO {
	
	private PreparedStatement stmt;
	private ResultSet rs;
	
	@Override
	public void alterar(Chamado_FinalTO item) throws ClassesException {
		

	}

	@Override
	public List<Chamado_FinalTO> consultar(Chamado_FinalTO item,int tipoWhere) throws ClassesException {
		ArrayList<Chamado_FinalTO> resultado = new ArrayList<Chamado_FinalTO>();

		Connection con = null;
		stmt = null;
		rs = null;
		
		// Monta SQL com Where dinâmico, ou seja, de acordo com o parâmetro
		// informado no filtro.
		String sql = "select "
			+ "cod_fechamento," 
			+ "cod_chamado," 
			+ "id_dispositivo,"
			+ "data_fechamento,"
			+ "valor"
			+ " from chamado_final "
			+ montaClausulawWhere(item, tipoWhere);
		
		try 
		{
			con = obtemConexao();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next())
			{
	
				resultado.add(new Chamado_FinalTO(
						rs.getInt("cod_fechamento"),
						rs.getInt("cod_chamado"),
						rs.getString("id_dispositivo"),
						rs.getString("data_fechamento"),
						rs.getFloat("valor")));
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
	public void excluir(Chamado_FinalTO item) throws ClassesException {
		String sql = "delete from chamado_final where id_fechamento = ? ";
		
		Connection conn = null;
		 stmt = null;
		try 
		{
			// obtem conexao com o banco
			//
			conn = obtemConexao();
			
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, item.getCodigo_fechamento());
			
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
	public void inserir(Chamado_FinalTO item) throws ClassesException {
		PegaDataAtual data = new PegaDataAtual();
		String sql = "insert into chamado_final (" 
			+ "cod_chamado," 
			+ "id_dispositivo,"
			+ "data_fechamento,"
			+ "valor)"
			+ "values (?,?,?,?)";

			Connection conn = null;
			PreparedStatement stm = null;
			try 
			{
				conn = obtemConexao();
				
				stm = conn.prepareStatement(sql);
				stm.setInt(1, item.getCodigo_chamado());
				stm.setString(2, item.getId_dispositivo());
				stm.setString(3, data.dataAtual());
				stm.setFloat(4, item.getValor());
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
	
	private String montaClausulawWhere(Chamado_FinalTO item, int tipoWhere) {
		String where = "";

		
		if (tipoWhere == 1) {
			where = "where cod_chamado = " + item.getCodigo_chamado();

		}
		return where;
	}

	
	private Connection obtemConexao() throws Exception
	{
			Conexao clsConexao = new Conexao();
			return clsConexao.obtemConexao();
		
	}

	

}
