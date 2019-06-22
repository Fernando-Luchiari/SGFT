package modelo;

import java.io.Serializable;


public class Chamado_AceiteTO implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 3291104934407126565L;
	private int Codigo_Aceite;	
	private String Id_dispositivo;
	private int Codigo_chamado;
	private String Data;
	private String Justificativa;
	
	public Chamado_AceiteTO( int codigo_aceite, String id_dispositivo,int codigo_chamado, String data, String justificativa)
	{
		Codigo_Aceite  = codigo_aceite;
		Id_dispositivo = id_dispositivo;
		Codigo_chamado = codigo_chamado;
		Data = data;
		Justificativa = justificativa;
	}
	
	public Chamado_AceiteTO( int codigo_chamado, String id_dispositivo, String data, String justificativa)
	{
		
		Id_dispositivo = id_dispositivo;
		Codigo_chamado = codigo_chamado;
		Data = data;
		Justificativa = justificativa;
	}
	
	public Chamado_AceiteTO( String id_dispositivo, 
			int codigo_chamado, String justificativa)
	{
		Id_dispositivo = id_dispositivo;
		Codigo_chamado = codigo_chamado;		
		Justificativa = justificativa;
	}
	
	public Chamado_AceiteTO( String id_dispositivo, 
			int codigo_chamado)
	{
		Id_dispositivo = id_dispositivo;
		Codigo_chamado = codigo_chamado;
	}	
	public Chamado_AceiteTO(){
		
		
	}
	public int getCodigo_Aceite() {
		return Codigo_Aceite;
	}
	public void setCodigo_Aceite(int codigoAceite) {
		Codigo_Aceite = codigoAceite;
	}	
	public void setId_dispositivo(String id_dispositivo)
	{
		Id_dispositivo = id_dispositivo;
	}
	public String getId_dispositivo()
	{
		return Id_dispositivo;
	}
	public void setCodigo_chamado(int codigo_chamado)
	{
		Codigo_chamado = codigo_chamado;
	}
	public int getCodigo_chamado()
	{
		return Codigo_chamado;
	}
	public void setData(String data)
	{
		Data = data;
	}
	public String getData()
	{
		return Data;
	}
	public void setJustificativa(String justificativa)
	{
		Justificativa = justificativa;
	}
	public String getJustificativa()
	{
		return Justificativa;
	}
	
	public String toString() 
	   {
			StringBuffer bf = new StringBuffer();
			bf.append("codigo aceite " + Codigo_Aceite + '\n');
			bf.append("id dispositivo " + Id_dispositivo + '\n');
			bf.append("codigo chamdo " + Codigo_chamado + '\n');
			bf.append("Data " + Data + '\n');
			bf.append("Justificativa" + Justificativa + '\n');
			return bf.toString();
			
			
		}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Codigo_Aceite;
		result = prime * result + Codigo_chamado;
		result = prime * result + ((Data == null) ? 0 : Data.hashCode());
		result = prime * result
				+ ((Id_dispositivo == null) ? 0 : Id_dispositivo.hashCode());
		result = prime * result
				+ ((Justificativa == null) ? 0 : Justificativa.hashCode());
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
		Chamado_AceiteTO other = (Chamado_AceiteTO) obj;
		if (Codigo_Aceite != other.Codigo_Aceite)
			return false;
		if (Codigo_chamado != other.Codigo_chamado)
			return false;
		if (Data == null) {
			if (other.Data != null)
				return false;
		} else if (!Data.equals(other.Data))
			return false;
		if (Id_dispositivo == null) {
			if (other.Id_dispositivo != null)
				return false;
		} else if (!Id_dispositivo.equals(other.Id_dispositivo))
			return false;
		if (Justificativa == null) {
			if (other.Justificativa != null)
				return false;
		} else if (!Justificativa.equals(other.Justificativa))
			return false;
		return true;
	}
}