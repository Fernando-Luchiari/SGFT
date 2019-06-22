package modelo;

import java.io.Serializable;

public class Chamado_ClienteTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2448231426608215803L;
	private int Codigo_chamado;
	private int Codigo_status;
	private int Codigo_passageiro;
	private String Rua_origem;
	private String Numero_origem;
	private String Bairro_origem;
	private String Cidade_origem;
	private String Estado_origem;
	private String Cep_origem;
	private String Rua_destino;
	private String Numero_destino;
	private String Bairro_destino;
	private String Cidade_destino;
	private String Estado_destino;
	private String Cep_destino;
	private String DataInclusao;
	private String complemento_origem;
	private String complemento_destino;
	private String justificativa;
	private String convenio;

	public Chamado_ClienteTO(int codigo_chamado, int codigo_status,
			int codigo_passageiro, String rua_origem, String numero_origem,
			String bairro_origem, String cidade_origem, String estado_origem,
			String cep_origem, String rua_destino, String numero_destino,
			String bairro_destino, String cidade_destino,
			String estado_destino, String cep_destino, String dataInclusao,
			String complemento_origem, String complemento_destino, String justificativa, String convenio) {

		Codigo_chamado = codigo_chamado;
		Codigo_status = codigo_status;
		Codigo_passageiro = codigo_passageiro;
		Rua_origem = rua_origem;
		Numero_origem = numero_origem;
		Bairro_origem = bairro_origem;
		Cidade_origem = cidade_origem;
		Estado_origem = estado_origem;
		Cep_origem = cep_origem;
		Rua_destino = rua_destino;
		Numero_destino = numero_destino;
		Bairro_destino = bairro_destino;
		Cidade_destino = cidade_destino;
		Estado_destino = estado_destino;
		Cep_destino = cep_destino;
		DataInclusao = dataInclusao;
		this.complemento_origem = complemento_origem;
		this.complemento_destino = complemento_destino;
		this.justificativa = justificativa;
		this.convenio = convenio;
	}

	public Chamado_ClienteTO(int codigo_chamado) {
		Codigo_chamado = codigo_chamado;
	}

	public Chamado_ClienteTO() {

	}

	public void setCodigo_chamado(int cod_chamado) {
		Codigo_chamado = cod_chamado;
	}

	public int getCodigo_chamado() {
		return Codigo_chamado;
	}

	public void setCodigo_status(int codigo_status) {
		Codigo_status = codigo_status;
	}

	public int getCodigo_status() {
		return Codigo_status;
	}

	public void setCodigo_passageiro(int cod_passageiro) {
		Codigo_passageiro = cod_passageiro;
	}

	public int getCodigo_passageiro() {
		return Codigo_passageiro;
	}

	public void setRua_origem(String rua_origem) {
		Rua_origem = rua_origem;
	}

	public String getRua_origem() {
		return Rua_origem;
	}

	public void setNumero_origem(String numero_origem) {
		Numero_origem = numero_origem;
	}

	public String getNumero_origem() {
		return Numero_origem;
	}

	public void setBairro_origem(String bairro_origem) {
		Bairro_origem = bairro_origem;
	}

	public String getBairro_origem() {
		return Bairro_origem;
	}

	public void setCidade_origem(String cidade_origem) {
		Cidade_origem = cidade_origem;
	}

	public String getCidade_origem() {
		return Cidade_origem;
	}

	public void setEstado_origem(String estado_origem) {
		Estado_origem = estado_origem;
	}

	public String getEstado_origem() {
		return Estado_origem;
	}

	public void setCep_origem(String cep_origem) {
		Cep_origem = cep_origem;
	}

	public String getCep_origem() {
		return Cep_origem;
	}

	public void setRua_destino(String rua_destino) {
		Rua_destino = rua_destino;
	}

	public String getRua_destino() {
		return Rua_destino;
	}

	public void setNumero_destino(String numero_destino) {
		Numero_destino = numero_destino;
	}

	public String getNumero_destino() {
		return Numero_destino;
	}

	public void setBairro_destino(String bairro_destino) {
		Bairro_destino = bairro_destino;
	}

	public String getBairro_destino() {
		return Bairro_destino;
	}

	public void setCidade_destino(String cidade_destino) {
		Cidade_destino = cidade_destino;
	}

	public String getCidade_destino() {
		return Cidade_destino;
	}

	public void setEstado_destino(String estado_destino) {
		Estado_destino = estado_destino;
	}

	public String getEstado_destino() {
		return Estado_destino;
	}

	public void setCep_destino(String cep_destino) {
		Cep_destino = cep_destino;
	}

	public String getCep_destino() {
		return Cep_destino;
	}

	public void setDataInclusao(String dataInclusao) {
		DataInclusao = dataInclusao;
	}

	public String getDataInclusao() {
		return DataInclusao;
	}

	public void setComplementoOrigem(String complemento_origem) {
		this.complemento_origem = complemento_origem;
	}

	public String getComplementoOrigem() {
		return complemento_origem;
	}

	public void setComplementoDestino(String complemento_destino) {
		this.complemento_destino = complemento_destino;
	}

	public String getComplementoDestino() {
		return complemento_destino;
	}
	public void setJustificativa(String justificativa) {
		this.justificativa = justificativa;
	}

	public String getJustificativa() {
		return justificativa;
	}
	
	public void setConvenio(String convenio) {
		this.convenio = convenio;
	}

	public String getConvenio() {
		return convenio;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Chamado_ClienteTO [Bairro_destino=");
		builder.append(Bairro_destino);
		builder.append(", Bairro_origem=");
		builder.append(Bairro_origem);
		builder.append(", Cep_destino=");
		builder.append(Cep_destino);
		builder.append(", Cep_origem=");
		builder.append(Cep_origem);
		builder.append(", Cidade_destino=");
		builder.append(Cidade_destino);
		builder.append(", Cidade_origem=");
		builder.append(Cidade_origem);
		builder.append(", Codigo_chamado=");
		builder.append(Codigo_chamado);
		builder.append(", Codigo_passageiro=");
		builder.append(Codigo_passageiro);
		builder.append(", Codigo_status=");
		builder.append(Codigo_status);
		builder.append(", DataInclusao=");
		builder.append(DataInclusao);
		builder.append(", Estado_destino=");
		builder.append(Estado_destino);
		builder.append(", Estado_origem=");
		builder.append(Estado_origem);
		builder.append(", Numero_destino=");
		builder.append(Numero_destino);
		builder.append(", Numero_origem=");
		builder.append(Numero_origem);
		builder.append(", Rua_destino=");
		builder.append(Rua_destino);
		builder.append(", Rua_origem=");
		builder.append(Rua_origem);
		builder.append(", complemento_origem=");
		builder.append(complemento_origem);
		builder.append(", complemento_destino=");
		builder.append(complemento_destino);
		builder.append(", justificativa=");
		builder.append(justificativa);
		builder.append(", convenio=");
		builder.append(convenio);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((Bairro_destino == null) ? 0 : Bairro_destino.hashCode());
		result = prime * result
				+ ((Bairro_origem == null) ? 0 : Bairro_origem.hashCode());
		result = prime * result
				+ ((Cep_destino == null) ? 0 : Cep_destino.hashCode());
		result = prime * result
				+ ((Cep_origem == null) ? 0 : Cep_origem.hashCode());
		result = prime * result
				+ ((Cidade_destino == null) ? 0 : Cidade_destino.hashCode());
		result = prime * result
				+ ((Cidade_origem == null) ? 0 : Cidade_origem.hashCode());
		result = prime * result + Codigo_chamado;
		result = prime * result + Codigo_passageiro;
		result = prime * result + Codigo_status;
		result = prime * result
				+ ((DataInclusao == null) ? 0 : DataInclusao.hashCode());
		result = prime * result
				+ ((Estado_destino == null) ? 0 : Estado_destino.hashCode());
		result = prime * result
				+ ((Estado_origem == null) ? 0 : Estado_origem.hashCode());
		result = prime * result
				+ ((Numero_destino == null) ? 0 : Numero_destino.hashCode());
		result = prime * result
				+ ((Numero_origem == null) ? 0 : Numero_origem.hashCode());
		result = prime * result
				+ ((Rua_destino == null) ? 0 : Rua_destino.hashCode());
		result = prime * result
				+ ((Rua_origem == null) ? 0 : Rua_origem.hashCode());
		result = prime
				* result
				+ ((complemento_origem == null) ? 0 : complemento_origem
						.hashCode());
		result = prime
				* result
				+ ((complemento_destino == null) ? 0 : complemento_destino
						.hashCode());
		result = prime
		* result
		+ ((justificativa == null) ? 0 : justificativa
				.hashCode());
		
		result = prime
		* result
		+ ((convenio == null) ? 0 : convenio
				.hashCode());

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
		Chamado_ClienteTO other = (Chamado_ClienteTO) obj;
		if (Bairro_destino == null) {
			if (other.Bairro_destino != null)
				return false;
		} else if (!Bairro_destino.equals(other.Bairro_destino))
			return false;
		if (Bairro_origem == null) {
			if (other.Bairro_origem != null)
				return false;
		} else if (!Bairro_origem.equals(other.Bairro_origem))
			return false;
		if (Cep_destino == null) {
			if (other.Cep_destino != null)
				return false;
		} else if (!Cep_destino.equals(other.Cep_destino))
			return false;
		if (Cep_origem == null) {
			if (other.Cep_origem != null)
				return false;
		} else if (!Cep_origem.equals(other.Cep_origem))
			return false;
		if (Cidade_destino == null) {
			if (other.Cidade_destino != null)
				return false;
		} else if (!Cidade_destino.equals(other.Cidade_destino))
			return false;
		if (Cidade_origem == null) {
			if (other.Cidade_origem != null)
				return false;
		} else if (!Cidade_origem.equals(other.Cidade_origem))
			return false;
		if (Codigo_chamado != other.Codigo_chamado)
			return false;
		if (Codigo_passageiro != other.Codigo_passageiro)
			return false;
		if (Codigo_status != other.Codigo_status)
			return false;
		if (DataInclusao == null) {
			if (other.DataInclusao != null)
				return false;
		} else if (!DataInclusao.equals(other.DataInclusao))
			return false;
		if (Estado_destino == null) {
			if (other.Estado_destino != null)
				return false;
		} else if (!Estado_destino.equals(other.Estado_destino))
			return false;
		if (Estado_origem == null) {
			if (other.Estado_origem != null)
				return false;
		} else if (!Estado_origem.equals(other.Estado_origem))
			return false;
		if (Numero_destino == null) {
			if (other.Numero_destino != null)
				return false;
		} else if (!Numero_destino.equals(other.Numero_destino))
			return false;
		if (Numero_origem == null) {
			if (other.Numero_origem != null)
				return false;
		} else if (!Numero_origem.equals(other.Numero_origem))
			return false;
		if (Rua_destino == null) {
			if (other.Rua_destino != null)
				return false;
		} else if (!Rua_destino.equals(other.Rua_destino))
			return false;
		if (Rua_origem == null) {
			if (other.Rua_origem != null)
				return false;
		} else if (!Rua_origem.equals(other.Rua_origem))
			return false;
		if (complemento_origem == null) {
			if (other.complemento_origem != null)
				return false;
		} else if (!complemento_origem.equals(other.complemento_origem))
			return false;
		if (complemento_destino == null) {
			if (other.complemento_destino != null)
				return false;
		} else if (!complemento_destino.equals(other.complemento_destino))
			return false;
		if (justificativa == null) {
			if (other.justificativa != null)
				return false;
		} else if (!justificativa.equals(other.justificativa))
			return false;
		
		if (convenio == null) {
			if (other.convenio != null)
				return false;
		} else if (!convenio.equals(other.convenio))
			return false;
		return true;
	}

	


}
