package modelo;

public class EnderecoTO {
	
	private String rua;
	private String numero;
	private String bairro;
	private String cidade;
	private String estado;
	private String complemento;
	private String cep;
	
	public EnderecoTO ( String rua, String numero,String bairro,String cidade,String estado,String complemento,String cep){
		
		this.rua=rua;
		this.numero=numero;
		this.bairro=bairro;
		this.cidade=cidade;
		this.estado=estado;
		this.complemento=complemento;
		this.cep=cep;
	}
	
	public EnderecoTO(){
		
		this.rua="";
		this.numero="";
		this.bairro="";
		this.cidade="";
		this.estado="";
		this.complemento="";
		this.cep="";
		
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getRua() {
		return rua;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getNumero() {
		return numero;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCidade() {
		return cidade;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getEstado() {
		return estado;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCep() {
		return cep;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getBairro() {
		return bairro;
	}

}
