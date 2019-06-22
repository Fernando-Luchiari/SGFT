package modelo;

import java.util.Calendar;


public class Motorista_LocalizacaoTO 
{
	private int Id_dispositivo;
	private double Latitude;
	private double Longitude;
	private Calendar DataAtualizacao;
	
	public Motorista_LocalizacaoTO()
	{
		
	}	
	
	public Motorista_LocalizacaoTO(int id_dispositivo)
	{
		Id_dispositivo = id_dispositivo;
	}	
	public Motorista_LocalizacaoTO(int id_dispositivo, double latitude, double longitude)
	{
		Id_dispositivo = id_dispositivo;
		Latitude = latitude;
		Longitude = longitude;
	}
	
	public void setId_dispositivo(int id_dispositivo)
	{
		Id_dispositivo = id_dispositivo;
	}
	public int getId_dispositivo()
	{
		return Id_dispositivo;
	}
	public void setLatitude(double latitude)
	{
		Latitude = latitude;
	}
	public double getLatitude()
	{
		return Latitude;
	}
	public void setLongitude(double longitude)
	{
		Longitude = longitude;
	}
	public double getLongitude()
	{
		return Longitude;
	}

	public void setDataAtualizacao(Calendar dataAtualizacao) {
		DataAtualizacao = dataAtualizacao;
	}

	public Calendar getDataAtualizacao() {
		return DataAtualizacao;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Motorista_LocalizacaoTO [DataAtualizacao=");
		builder.append(DataAtualizacao);
		builder.append(", Id_dispositivo=");
		builder.append(Id_dispositivo);
		builder.append(", Latitude=");
		builder.append(Latitude);
		builder.append(", Longitude=");
		builder.append(Longitude);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
