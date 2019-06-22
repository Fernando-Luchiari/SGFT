package modelo;

import java.io.Serializable;

public class LogTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1266269904969573567L;
	private int codigo_log;
	private String tipo_alteracao;
	private String id_usuario;
	private String data;
	private String descricao;
	private String tipo_usuario;

	public LogTO(int cod_log, String tipo_alteracao, String tipo_usuario,
			String id_usuario, String data, String descricao) {
		this.codigo_log = cod_log;
		this.tipo_alteracao = tipo_alteracao;
		this.id_usuario = id_usuario;
		this.data = data;
		this.descricao = descricao;
		this.tipo_usuario = tipo_usuario;
	}
	
	public LogTO (String id_usuario, String tipo_usuario, String tipo_alteracao, String descricao, String data){
		
		
		this.tipo_alteracao = tipo_alteracao;
		this.id_usuario = id_usuario;
		this.data = data;
		this.descricao = descricao;
		this.tipo_usuario = tipo_usuario;
		
		
	}

	public LogTO() {

	}

	public void setCodigo_log(int cod_log) {
		this.codigo_log = cod_log;
	}

	public int getCodigo_log() {
		return this.codigo_log;
	}

	public void setid_usuario(String id_usuario) {
		this.id_usuario = id_usuario;
	}

	public String getid_usuario() {
		return this.id_usuario;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getData() {
		return this.data;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setTipo_alteracao(String tipo_alteracao) {
		this.tipo_alteracao = tipo_alteracao;
	}

	public String getTipo_alteracao() {
		return this.tipo_alteracao;
	}

	public void setTipo_usuarioo(String tipo_usuario) {
		this.tipo_usuario = tipo_usuario;
	}

	public String getTipo_usuario() {
		return this.tipo_usuario;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LogTO tipo_alteracao=");
		builder.append(tipo_alteracao);
		builder.append(", id_usuario=");
		builder.append(id_usuario);
		builder.append(", Codigo_log=");
		builder.append(codigo_log);
		builder.append(", Data=");
		builder.append(data);
		builder.append(", Descricao=");
		builder.append(descricao);
		builder.append(", Tipo_usuario=");
		builder.append(tipo_usuario);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((tipo_alteracao == null) ? 0 : tipo_alteracao.hashCode());
		result = prime * result
				+ ((id_usuario == null) ? 0 : id_usuario.hashCode());
		result = prime * result + codigo_log;
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result
				+ ((tipo_usuario == null) ? 0 : tipo_usuario.hashCode());
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());

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
		LogTO other = (LogTO) obj;
		if (tipo_alteracao != other.tipo_alteracao)
			return false;
		if (id_usuario != other.id_usuario)
			return false;
		if (codigo_log != other.codigo_log)
			return false;
		if (data != other.data)
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (tipo_alteracao == null) {
			if (other.tipo_alteracao != null)
				return false;
		} else if (!tipo_alteracao.equals(other.tipo_alteracao))
			return false;
		if (tipo_usuario == null) {
			if (other.tipo_usuario != null)
				return false;
		} else if (!tipo_usuario.equals(other.tipo_usuario))
			return false;
		return true;
	}

}
