package modelo;

import java.io.Serializable;

public class ConvenioTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1844159457887211261L;
	private int Codigo_convenio;
	private String Razao_social;
	private String Nome_fantasia;
	private String Cnpj;
	private String Cidade;
	private String Estado;
	private String Rua;
	private String Bairro;
	private String Numero;
	private String Cep;
	private int Ativo;
	private String DataInclusao;
	private String complemento;
	private String ddd;
	private String telefone;
	private String valor_limite;
	private String Valor_gasto;

	public ConvenioTO(int cod_convenio, String ra_social,
			String nome_fantasia, String cnpj, String cidade, String estado,
			String rua, String bairro, String numero, String cep, int ativo,
			String dataInclusao, String complemento, String telefone, String ddd, String valor_limite, String Valor_gasto) {
		Codigo_convenio = cod_convenio;
		Razao_social = ra_social;
		Nome_fantasia = nome_fantasia;
		Cnpj = cnpj;
		Cidade = cidade;
		Estado = estado;
		Rua = rua;
		Bairro = bairro;
		Numero = numero;
		Cep = cep;
		Ativo = ativo;
		DataInclusao = dataInclusao;
		this.complemento = complemento;
		this.ddd = ddd;
		this.telefone = telefone;
		this.valor_limite = valor_limite;
		this.Valor_gasto = Valor_gasto;

	}

	public ConvenioTO() {

	}

	public void setCodigo_convenio(int cod_convenio) {
		Codigo_convenio = cod_convenio;
	}

	public int getCodigo_convenio() {
		return Codigo_convenio;
	}
	public void setRazao_social(String razao_social) {
		Razao_social = razao_social;
	}

	public String getRazao_social() {
		return Razao_social;
	}

	public void setNome_fantasia(String nome) {
		Nome_fantasia = nome;
	}

	public String getNome_fantasia() {
		return Nome_fantasia;
	}

	public void setCnpj(String cnpj) {
		Cnpj = cnpj;
	}

	public String getCnpj() {
		return Cnpj;
	}

	public void setCidade(String cidade) {
		Cidade = cidade;
	}

	public String getCidade() {
		return Cidade;
	}

	public void setEstado(String estado) {
		Estado = estado;
	}

	public String getEstado() {
		return Estado;
	}

	public void setRua(String rua) {
		Rua = rua;
	}

	public String getRua() {
		return Rua;
	}

	public void setBairro(String bairro) {
		Bairro = bairro;
	}

	public String getBairro() {
		return Bairro;
	}

	public void setNumero(String numero) {
		Numero = numero;
	}

	public String getNumero() {
		return Numero;
	}

	public void setCep(String cep) {
		Cep = cep;
	}

	public String getCep() {
		return Cep;
	}

	public void setAtivo(int ativo) {
		Ativo = ativo;
	}

	public int getAtivo() {
		return Ativo;
	}

	public void setDataInclusao(String dataInclusao) {
		DataInclusao = dataInclusao;
	}

	public String getDataInclusao() {
		return DataInclusao;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getComplemento() {
		return complemento;
	}
	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getDdd() {
		return ddd;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTelefone() {
		return telefone;
	}
	
	public void setValor_limite(String valor_limite) {
		this.valor_limite = valor_limite;
	}

	public String getValor_limite() {
		return valor_limite;
	}

	public void setValor_gasto(String Valor_gasto) {
		this.Valor_gasto = Valor_gasto;
	}

	public String getValor_gasto() {
		return Valor_gasto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Ativo;
		result = prime * result + ((Bairro == null) ? 0 : Bairro.hashCode());
		result = prime * result + ((Cep == null) ? 0 : Cep.hashCode());
		result = prime * result + ((Cidade == null) ? 0 : Cidade.hashCode());
		result = prime * result + ((Cnpj == null) ? 0 : Cnpj.hashCode());
		result = prime * result + Codigo_convenio;
		result = prime * result
				+ ((DataInclusao == null) ? 0 : DataInclusao.hashCode());
		result = prime * result + ((Estado == null) ? 0 : Estado.hashCode());
		result = prime * result
				+ ((Nome_fantasia == null) ? 0 : Nome_fantasia.hashCode());
		result = prime * result + ((Numero == null) ? 0 : Numero.hashCode());
		result = prime * result
				+ ((Razao_social == null) ? 0 : Razao_social.hashCode());
		result = prime * result + ((Rua == null) ? 0 : Rua.hashCode());
		result = prime * result
				+ ((complemento == null) ? 0 : complemento.hashCode());
		result = prime * result
		+ ((telefone == null) ? 0 : telefone.hashCode());
		result = prime * result + ((ddd == null) ? 0 : ddd.hashCode());
		result = prime * result + ((valor_limite == null) ? 0 : valor_limite.hashCode());
		result = prime * result + ((Valor_gasto == null) ? 0 : Valor_gasto.hashCode());
		


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
		ConvenioTO other = (ConvenioTO) obj;
		if (Ativo != other.Ativo)
			return false;
		if (Bairro == null) {
			if (other.Bairro != null)
				return false;
		} else if (!Bairro.equals(other.Bairro))
			return false;
		if (Cep == null) {
			if (other.Cep != null)
				return false;
		} else if (!Cep.equals(other.Cep))
			return false;
		if (Cidade == null) {
			if (other.Cidade != null)
				return false;
		} else if (!Cidade.equals(other.Cidade))
			return false;
		if (Cnpj == null) {
			if (other.Cnpj != null)
				return false;
		} else if (!Cnpj.equals(other.Cnpj))
			return false;
		if (Codigo_convenio != other.Codigo_convenio)
			return false;
		if (DataInclusao == null) {
			if (other.DataInclusao != null)
				return false;
		} else if (!DataInclusao.equals(other.DataInclusao))
			return false;
		if (Estado == null) {
			if (other.Estado != null)
				return false;
		} else if (!Estado.equals(other.Estado))
			return false;
		if (Nome_fantasia == null) {
			if (other.Nome_fantasia != null)
				return false;
		} else if (!Nome_fantasia.equals(other.Nome_fantasia))
			return false;
		if (Numero == null) {
			if (other.Numero != null)
				return false;
		} else if (!Numero.equals(other.Numero))
			return false;
		if (Razao_social == null) {
			if (other.Razao_social != null)
				return false;
		} else if (!Razao_social.equals(other.Razao_social))
			return false;
		if (Rua == null) {
			if (other.Rua != null)
				return false;
		} else if (!Rua.equals(other.Rua))
			return false;
		if (complemento == null) {
			if (other.complemento != null)
				return false;
		} else if (!complemento.equals(other.complemento))
			return false;
		if (telefone == null) {
			if (other.telefone != null)
				return false;
		} else if (!telefone.equals(other.telefone))
			return false;
		if (ddd == null) {
			if (other.ddd != null)
				return false;
		} else if (!ddd.equals(other.ddd))
			return false;
		if (valor_limite == null) {
			if (other.valor_limite != null)
				return false;
		} else if (!valor_limite.equals(other.valor_limite))
			return false;
		if (Valor_gasto == null) {
			if (other.Valor_gasto != null)
				return false;
		} else if (!Valor_gasto.equals(other.Valor_gasto))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ConvenioTO [Ativo=");
		builder.append(Ativo);
		builder.append(", Bairro=");
		builder.append(Bairro);
		builder.append(", Cep=");
		builder.append(Cep);
		builder.append(", Cidade=");
		builder.append(Cidade);
		builder.append(", Cnpj=");
		builder.append(Cnpj);
		builder.append(", Codigo_convenio=");
		builder.append(Codigo_convenio);
		builder.append(", DataInclusao=");
		builder.append(DataInclusao);
		builder.append(", Estado=");
		builder.append(Estado);
		builder.append(", Nome_fantasia=");
		builder.append(Nome_fantasia);
		builder.append(", Numero=");
		builder.append(Numero);
		builder.append(", Razao_social=");
		builder.append(Razao_social);
		builder.append(", Rua=");
		builder.append(Rua);
		builder.append(", complemento=");
		builder.append(complemento);
		builder.append(", telefone=");
		builder.append(telefone);
		builder.append(", ddd=");
		builder.append(ddd);
		builder.append(", valor_limite=");
		builder.append(valor_limite);
		builder.append(", Valor_gasto=");
		builder.append(Valor_gasto);
		builder.append("]");
		return builder.toString();
	}





}
