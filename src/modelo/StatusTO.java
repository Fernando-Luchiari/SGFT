package modelo;

import java.io.Serializable;


public class StatusTO implements Serializable
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2275400966948607014L;
	private int Codigo_status;
	private String Descricao;
	
	public StatusTO(int codigo_status, String descricao)
	{
		Codigo_status = codigo_status;
		Descricao = descricao;
	}
	public StatusTO()
	{
		
	}
	public void setCodigo_status(int codigo_status)
	{
		Codigo_status = codigo_status;
	}
	public int getCodigo_status()
	{
		return Codigo_status;
	}
	public void setDescricao(String descricao)
	{
		Descricao = descricao;
	}
	public String getDescricao()
	{
		return Descricao;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StatusTO [Codigo_status=");
		builder.append(Codigo_status);
		builder.append(", Descricao=");
		builder.append(Descricao);
		builder.append("]");
		return builder.toString();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Codigo_status;
		result = prime * result
				+ ((Descricao == null) ? 0 : Descricao.hashCode());
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
		StatusTO other = (StatusTO) obj;
		if (Codigo_status != other.Codigo_status)
			return false;
		if (Descricao == null) {
			if (other.Descricao != null)
				return false;
		} else if (!Descricao.equals(other.Descricao))
			return false;
		return true;
	}
	
}
