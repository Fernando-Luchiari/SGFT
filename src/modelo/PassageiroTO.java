package modelo;

import java.io.Serializable;

public class PassageiroTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8925425689131154676L;
	private int Codigo_passageiro;
	private int Codigo_convenio;
	private String Nome;
	private String Cpf;
	private String Rua;
	private String Numero;
	private String Bairro;
	private String Cidade;
	private String Estado;
	private int Conveniado;
	private int Ativo;
	private String telefone;
	private String ddd;
	private String complemento;
	private String cep;

	public PassageiroTO(int codigo_passageiro, int codigo_convenio,
			String nome, String cpf, String rua, String numero, String bairro,
			String cidade, String estado, String cep, int conveniado,
			int ativo, String telefone, String ddd, String complemento) {

		this.Codigo_passageiro = codigo_passageiro;
		this.Codigo_convenio = codigo_convenio;
		this.Nome = nome;
		this.Cpf = cpf;
		this.Rua = rua;
		this.Numero = numero;
		this.Bairro = bairro;
		this.Cidade = cidade;
		this.Estado = estado;
		this.Conveniado = conveniado;
		this.Ativo = ativo;
		this.cep = cep;
		this.telefone = telefone;
		this.ddd = ddd;
		this.complemento = complemento;

	}

	public PassageiroTO() {

		this.Codigo_passageiro = 0;
		this.Codigo_convenio = 0;
		this.Nome = "";
		this.Cpf = "";
		this.Rua = "";
		this.Numero = "";
		this.Bairro = "";
		this.Cidade = "";
		this.Estado = "";
		this.Conveniado = 0;
		this.Ativo = 0;
		this.cep = "";

	}

	public void setCodigo_passageiro(int codigo_passageiro) {
		Codigo_passageiro = codigo_passageiro;
	}

	public int getCodigo_passageiro() {
		return Codigo_passageiro;
	}

	public void setCodigo_convenio(int codigo_convenio) {
		Codigo_convenio = codigo_convenio;
	}

	public int getCodigo_convenio() {
		return Codigo_convenio;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getNome() {
		return Nome;
	}

	public void setCpf(String cpf) {
		Cpf = cpf;
	}

	public String getCpf() {
		return Cpf;
	}

	public void setRua(String rua) {
		Rua = rua;
	}

	public String getRua() {
		return Rua;
	}

	public void setNumero(String numero) {
		Numero = numero;
	}

	public String getNumero() {
		return Numero;
	}

	public void setBairro(String bairro) {
		Bairro = bairro;
	}

	public String getBairro() {
		return Bairro;
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

	public void setConveniado(int conveniado) {
		Conveniado = conveniado;
	}

	public int getConveniado() {
		return Conveniado;
	}

	public void setAtivo(int ativo) {
		Ativo = ativo;
	}

	public int getAtivo() {
		return Ativo;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCep() {
		return cep;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getDdd() {
		return ddd;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getComplemento() {
		return complemento;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PassageiroTO [Ativo=");
		builder.append(Ativo);
		builder.append(", Bairro=");
		builder.append(Bairro);
		builder.append(", Cidade=");
		builder.append(Cidade);
		builder.append(", Codigo_convenio=");
		builder.append(Codigo_convenio);
		builder.append(", Codigo_passageiro=");
		builder.append(Codigo_passageiro);
		builder.append(", Convenio=");
		builder.append(Conveniado);
		builder.append(", Cpf=");
		builder.append(Cpf);
		builder.append(", Estado=");
		builder.append(Estado);
		builder.append(", Nome=");
		builder.append(Nome);
		builder.append(", Numero=");
		builder.append(Numero);
		builder.append(", Rua=");
		builder.append(Rua);
		builder.append(", cep=");
		builder.append(cep);
		builder.append(", telefone=");
		builder.append(telefone);
		builder.append(", ddd=");
		builder.append(ddd);
		builder.append(", complemento=");
		builder.append(complemento);
		builder.append(", dataInclusao=");
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Ativo;
		result = prime * result + ((Bairro == null) ? 0 : Bairro.hashCode());
		result = prime * result + ((Cidade == null) ? 0 : Cidade.hashCode());
		result = prime * result + Codigo_convenio;
		result = prime * result + Codigo_passageiro;
		result = prime * result + Conveniado;
		result = prime * result + ((Cpf == null) ? 0 : Cpf.hashCode());
		result = prime * result + ((Estado == null) ? 0 : Estado.hashCode());
		result = prime * result + ((Nome == null) ? 0 : Nome.hashCode());
		result = prime * result + ((Numero == null) ? 0 : Numero.hashCode());
		result = prime * result + ((Rua == null) ? 0 : Rua.hashCode());
		result = prime * result + ((cep == null) ? 0 : cep.hashCode());
		result = prime * result
				+ ((telefone == null) ? 0 : telefone.hashCode());
		result = prime * result + ((ddd == null) ? 0 : ddd.hashCode());
		result = prime * result
				+ ((complemento == null) ? 0 : complemento.hashCode());
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
		PassageiroTO other = (PassageiroTO) obj;
		if (Ativo != other.Ativo)
			return false;
		if (Bairro == null) {
			if (other.Bairro != null)
				return false;
		} else if (!Bairro.equals(other.Bairro))
			return false;
		if (Cidade == null) {
			if (other.Cidade != null)
				return false;
		} else if (!Cidade.equals(other.Cidade))
			return false;
		if (Codigo_convenio != other.Codigo_convenio)
			return false;
		if (Codigo_passageiro != other.Codigo_passageiro)
			return false;
		if (Conveniado != other.Conveniado)
			return false;
		if (Cpf == null) {
			if (other.Cpf != null)
				return false;
		} else if (!Cpf.equals(other.Cpf))
			return false;
		if (Estado == null) {
			if (other.Estado != null)
				return false;
		} else if (!Estado.equals(other.Estado))
			return false;
		if (Nome == null) {
			if (other.Nome != null)
				return false;
		} else if (!Nome.equals(other.Nome))
			return false;
		if (Numero == null) {
			if (other.Numero != null)
				return false;
		} else if (!Numero.equals(other.Numero))
			return false;
		if (Rua == null) {
			if (other.Rua != null)
				return false;
		} else if (!Rua.equals(other.Rua))
			return false;
		if (cep == null) {
			if (other.cep != null)
				return false;
		} else if (!cep.equals(other.cep))
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

		if (complemento == null) {
			if (other.complemento != null)
				return false;
		} else if (!complemento.equals(other.complemento))
			return false;

		return true;
	}

}
