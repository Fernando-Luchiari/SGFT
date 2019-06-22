package modelo;

import java.io.Serializable;

public class FuncionarioTO implements Serializable
{


	/**
	 * 
	 */
	private static final long serialVersionUID = -2465367724179717769L;
	private int codfuncionario;
    private String cpf;
	private String rg;
	private String telefone;
	private String ddd;
	private String nome;
	
	public FuncionarioTO(){
		
		codfuncionario=0;
		cpf="";
		rg="";
		telefone="";
		nome="";
		ddd="";
		
	}
	
	public FuncionarioTO(int codfuncionario, String cpf, String rg, String telefone,String nome,String ddd) {
		super();
		this.codfuncionario = codfuncionario;
		this.cpf = cpf;
		this.rg = rg;
		this.telefone = telefone;
		this.nome = nome;
		this.setDdd(ddd);
	}
	public int getCodfuncionario() {
		return codfuncionario;
	}
	public void setCodfuncionario(int codfuncionario) {
		this.codfuncionario = codfuncionario;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getRg() {
		return rg;
	}
	public void setRg(String rg) {
		this.rg = rg;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

	
	public void setDdd(String ddd) {
		this.ddd = ddd;
	}

	public String getDdd() {
		return ddd;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + codfuncionario;
		result = prime * result + ((cpf == null) ? 0 : cpf.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((rg == null) ? 0 : rg.hashCode());
		result = prime * result
				+ ((telefone == null) ? 0 : telefone.hashCode());
		result = prime * result
		+ ((ddd == null) ? 0 : ddd.hashCode());
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
		FuncionarioTO other = (FuncionarioTO) obj;
		if (codfuncionario != other.codfuncionario)
			return false;
		if (cpf == null) {
			if (other.cpf != null)
				return false;
		} else if (!cpf.equals(other.cpf))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (rg == null) {
			if (other.rg != null)
				return false;
		} else if (!rg.equals(other.rg))
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

		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FuncionarioTO [codfuncionario=");
		builder.append(codfuncionario);
		builder.append(", cpf=");
		builder.append(cpf);
		builder.append(", nome=");
		builder.append(nome);
		builder.append(", rg=");
		builder.append(rg);
		builder.append(", telefone=");
		builder.append(telefone);
		builder.append(", ddd=");
		builder.append(ddd);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	

}

	
	
	
	