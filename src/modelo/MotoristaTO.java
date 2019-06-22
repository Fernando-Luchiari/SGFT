package modelo;

import java.io.Serializable;

public class MotoristaTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1420936570202849672L;
	private int codfuncionario;
	private int ano_veiculo;
	private int id_dispositivo;
	private String modelo_veiculo;
	private String placa;
	private int proprietario;
	private int ativo;
	private String senha;
	private String dataInclusao;
	private int status;
	
	public MotoristaTO(int codfuncionario, int anoVeiculo, int idDispositivo,
			String modeloVeiculo, String placa, int proprietario,
			int ativo, String senha,String dataInclusao,int status) {
		super();
		this.codfuncionario = codfuncionario;
		this.ano_veiculo = anoVeiculo;
		this.id_dispositivo = idDispositivo;
		this.modelo_veiculo = modeloVeiculo;
		this.placa = placa;
		this.proprietario = proprietario;
		this.ativo = ativo;
		this.senha = senha;
		this.dataInclusao=dataInclusao;
		this.status=status;
	}
	
	public MotoristaTO(int codfuncionario, int anoVeiculo, int idDispositivo,
			String modeloVeiculo, String placa, int proprietario,
			int ativo, String senha,String dataInclusao) {
		super();
		this.codfuncionario = codfuncionario;
		this.ano_veiculo = anoVeiculo;
		this.id_dispositivo = idDispositivo;
		this.modelo_veiculo = modeloVeiculo;
		this.placa = placa;
		this.proprietario = proprietario;
		this.ativo = ativo;
		this.senha = senha;
		this.dataInclusao=dataInclusao;
		
	}
	
	public MotoristaTO(int idDispositivo, int status) {
		super();
		this.id_dispositivo = idDispositivo;
		this.setStatus(status);
		
	}
	
	public MotoristaTO (){
		super();
		this.codfuncionario = 0;
		this.ano_veiculo=0;
		this.id_dispositivo=0;
		this.modelo_veiculo="";
		this.placa="";
		this.proprietario=0;
		this.ativo=1;
		this.senha="";
	}
	
	
	public int getCodfuncionario() {
		return codfuncionario;
	}
	public void setCodfuncionario(int codfuncionario) {
		this.codfuncionario = codfuncionario;
	}
	public int getAno_veiculo() {
		return ano_veiculo;
	}
	public void setAno_veiculo(int anoVeiculo) {
		ano_veiculo = anoVeiculo;
	}
	public int getId_dispositivo() {
		return id_dispositivo;
	}
	public void setId_dispositivo(int idDispositivo) {
		id_dispositivo = idDispositivo;
	}
	public String getModelo_veiculo() {
		return modelo_veiculo;
	}
	public void setModelo_veiculo(String modeloVeiculo) {
		modelo_veiculo = modeloVeiculo;
	}
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	public int getProprietario() {
		return proprietario;
	}
	public void setProprietario(int proprietario) {
		this.proprietario = proprietario;
	}
	public int getAtivo() {
		return ativo;
	}
	public void setAtivo(int ativo) {
		this.ativo = ativo;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getDataInclusao() {
		return dataInclusao;
	}
	public void setDataInclusao(String dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MotoristaTO [ano_veiculo=");
		builder.append(ano_veiculo);
		builder.append(", ativo=");
		builder.append(ativo);
		builder.append(", codfuncionario=");
		builder.append(codfuncionario);
		builder.append(", dataInclusao=");
		builder.append(dataInclusao);
		builder.append(", id_dispositivo=");
		builder.append(id_dispositivo);
		builder.append(", modelo_veiculo=");
		builder.append(modelo_veiculo);
		builder.append(", placa=");
		builder.append(placa);
		builder.append(", proprietario=");
		builder.append(proprietario);
		builder.append(", senha=");
		builder.append(senha);
		builder.append(", status=");
		builder.append(status);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ano_veiculo;
		result = prime * result + ativo;
		result = prime * result + codfuncionario;
		result = prime * result
				+ ((dataInclusao == null) ? 0 : dataInclusao.hashCode());
		result = prime * result + id_dispositivo;
		result = prime * result
				+ ((modelo_veiculo == null) ? 0 : modelo_veiculo.hashCode());
		result = prime * result + ((placa == null) ? 0 : placa.hashCode());
		result = prime * result + proprietario;
		result = prime * result + ((senha == null) ? 0 : senha.hashCode());
		result = prime * result + status;
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
		MotoristaTO other = (MotoristaTO) obj;
		if (ano_veiculo != other.ano_veiculo)
			return false;
		if (ativo != other.ativo)
			return false;
		if (codfuncionario != other.codfuncionario)
			return false;
		if (dataInclusao == null) {
			if (other.dataInclusao != null)
				return false;
		} else if (!dataInclusao.equals(other.dataInclusao))
			return false;
		if (id_dispositivo != other.id_dispositivo)
			return false;
		if (modelo_veiculo == null) {
			if (other.modelo_veiculo != null)
				return false;
		} else if (!modelo_veiculo.equals(other.modelo_veiculo))
			return false;
		if (placa == null) {
			if (other.placa != null)
				return false;
		} else if (!placa.equals(other.placa))
			return false;
		if (proprietario != other.proprietario)
			return false;
		if (senha == null) {
			if (other.senha != null)
				return false;
		} else if (!senha.equals(other.senha))
			return false;
		if (status != other.status)
			return false;
		return true;
	}
	
}
