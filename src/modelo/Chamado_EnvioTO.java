package modelo;

import java.io.Serializable;


public class Chamado_EnvioTO implements Serializable
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8892958677590107909L;
	private int Codigo_envio;
	
	public Chamado_EnvioTO(int codigoEnvio, int codigoChamado,
			int idDispositivo, String data) {
		
		Codigo_envio = codigoEnvio;
		Codigo_chamado = codigoChamado;
		Id_dispositivo = idDispositivo;
		Data = data;
	}
	private int Codigo_chamado;
	private int Id_dispositivo;
	private String Data;
	
	public Chamado_EnvioTO( int cod_chamado, 
						   int id_dispositivo)
	{
		
		Codigo_chamado = cod_chamado;
		Id_dispositivo = id_dispositivo;
		
	}
	public Chamado_EnvioTO()
	{
		
	}
	
	public void setCodigo_chamado(int cod_chamado)
	{
		Codigo_chamado = cod_chamado;
	}
	public int getCodigo_chamado()
	{
		return Codigo_chamado;
	}
	public void setId_dispositivo(int id_dispositivo)
	{
		Id_dispositivo = id_dispositivo;
	}
	public int getId_dispositivo()
	{
		return Id_dispositivo;
	}
	public void setData(String data) {
		Data = data;
	}
	public String getData() {
		return Data;
	}
	public void setCodigo_envio(int codigo_envio) {
		Codigo_envio = codigo_envio;
	}
	public int getCodigo_envio() {
		return Codigo_envio;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Chamado_EnvioTO [Codigo_chamado=");
		builder.append(Codigo_chamado);
		builder.append(", Codigo_envio=");
		builder.append(Codigo_envio);
		builder.append(", Data=");
		builder.append(Data);
		builder.append(", Id_dispositivo=");
		builder.append(Id_dispositivo);
		builder.append("]");
		return builder.toString();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Codigo_chamado;
		result = prime * result + Codigo_envio;
		result = prime * result + ((Data == null) ? 0 : Data.hashCode());
		result = prime * result + Id_dispositivo;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Chamado_EnvioTO other = (Chamado_EnvioTO) obj;
		if (Codigo_chamado != other.Codigo_chamado)
			return false;
		if (Codigo_envio != other.Codigo_envio)
			return false;
		if (Data == null) {
			if (other.Data != null)
				return false;
		} else if (!Data.equals(other.Data))
			return false;
		if (Id_dispositivo != other.Id_dispositivo)
			return false;
		return true;
	}
	
}

