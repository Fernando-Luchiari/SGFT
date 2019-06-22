
package modelo;

import java.io.Serializable;





public class UsuarioTO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2435969371595317897L;

	public UsuarioTO(int codfuncionario, String senha, String login,
			int supervisor, int ativo,String dataInclusao,String logado) {
		super();
		this.codfuncionario = codfuncionario;
		this.senha = senha;
		this.login = login;
		this.supervisor = supervisor;
		this.ativo = ativo;
		this.dataInclusao = dataInclusao;
		this.logado=logado;
		
	}
	public UsuarioTO(){
		
		this.codfuncionario=0;
		this.senha="";
		this.login="";
		this.supervisor=0;
		this.ativo=1;
		this.dataInclusao = "";
		this.logado="";
	}
	private int codfuncionario;
	private String senha;
	private String login;
	private int supervisor;
	private int ativo;
	private String dataInclusao;
	private String logado;
	
	public int getCodfuncionario() {
		return codfuncionario;
	}
	public void setCodfuncionario(int codfuncionario) {
		this.codfuncionario = codfuncionario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public int getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(int supervisor) {
		this.supervisor = supervisor;
	}
	public int getAtivo(){
		
		return ativo;
	}
	public void setAtivo(int ativo){
		
		this.ativo=ativo;
	}
	public String getDataInclusao(){
		
		return dataInclusao;
	}
	public void setDataInclusao(String dataInclusao){
		
		this.dataInclusao=dataInclusao;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UsuarioTO [ativo=");
		builder.append(ativo);
		builder.append(", codfuncionario=");
		builder.append(codfuncionario);
		builder.append(", dataInclusao=");
		builder.append(dataInclusao);
		builder.append(", login=");
		builder.append(login);
		builder.append(", senha=");
		builder.append(senha);
		builder.append(", supervisor=");
		builder.append(supervisor);
		builder.append("]");
		return builder.toString();
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ativo;
		result = prime * result + codfuncionario;
		result = prime * result
				+ ((dataInclusao == null) ? 0 : dataInclusao.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((senha == null) ? 0 : senha.hashCode());
		result = prime * result + supervisor;
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
		UsuarioTO other = (UsuarioTO) obj;
		if (ativo != other.ativo)
			return false;
		if (codfuncionario != other.codfuncionario)
			return false;
		if (dataInclusao == null) {
			if (other.dataInclusao != null)
				return false;
		} else if (!dataInclusao.equals(other.dataInclusao))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (senha == null) {
			if (other.senha != null)
				return false;
		} else if (!senha.equals(other.senha))
			return false;
		if (supervisor != other.supervisor)
			return false;
		return true;
	}
	public void setLogado(String logado) {
		this.logado = logado;
	}
	public String getLogado() {
		return logado;
	}
	
	
}
