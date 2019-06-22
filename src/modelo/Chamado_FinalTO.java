package modelo;

import java.io.Serializable;


public class Chamado_FinalTO implements Serializable
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7066503552204788183L;
	
	private int Codigo_fechamento;
	private int Codigo_chamado;
	private String Id_dispositivo;
	private String Data_fechamento;
	private float Valor;
	
	
	
	public Chamado_FinalTO( String idDispositivo,int codigoChamado, float valor) {
		super();
		Codigo_chamado = codigoChamado;
		Id_dispositivo = idDispositivo;
		Valor = valor;
	}

	public Chamado_FinalTO(int codigo_fechamento, int codigo_chamado, 
						   String id_dispositivo, String data_fechamento, 
						   float valor)
	{
		Codigo_fechamento = codigo_fechamento;
		Codigo_chamado = codigo_chamado;
		Id_dispositivo = id_dispositivo;
		Data_fechamento = data_fechamento;
		Valor = valor;
	}
	
	public Chamado_FinalTO(){
		
		
	}
	
	public void setCodigo_fechamento(int codigo_fechamento)
	{
		Codigo_fechamento = codigo_fechamento;
	}
	public int getCodigo_fechamento()
	{
		return Codigo_fechamento;
	}
	public void setCodigo_chamado(int codigo_chamado)
	{
		Codigo_chamado = codigo_chamado;
	}
	public int getCodigo_chamado()
	{
		return Codigo_chamado;
	}
	public void setId_dispositivel(String id_dispositivo)
	{
		Id_dispositivo = id_dispositivo;
	}
	public String getId_dispositivo()
	{
		return Id_dispositivo; 
	}
	public void setData_fechamento(String data_fechamento)
	{
		Data_fechamento = data_fechamento;
	}
	public String getData_fechamento()
	{
		return Data_fechamento;
	}
	public void setValor(float valor)
	{
		Valor = valor;
	}
	public float getValor()
	{
		return Valor;
	}
}
