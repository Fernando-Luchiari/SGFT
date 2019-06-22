package modelo;

public class ChamadoRelatTO {
	
	private int cod_chamado;
	private String status;
	private String passageiro;
	private String cpf;
	private String convenio;
	private String cnpj;
	private String dataInclusao;
	private String motorista;
	private String id_dispositivo;
	private String dataEnvio;
	private String dataAceite;
	private String justificativa_recusa;
	private String dataFinalizacao;
	private String justificativa_cancelamento;
	private float valor;
	private String convenioCheck;

	public ChamadoRelatTO(int cod_chamado,String status,String passageiro,
			String cpf, String convenio, String cnpj, String dataInclusao,String motorista,
			String id_disposistivo, String dataEnvio,String dataAceite,String justificativa_recusa,
			String justificativa_cancelamento,String dataFinalizacao, float valor,String convenioCheck ){
		
		this.setCod_chamado(cod_chamado);
		this.setStatus(status);
		this.setPassageiro(passageiro);
		this.setCpf(cpf);
		this.setConvenio(convenio);
		this.setCnpj(cnpj);
		this.setDataInclusao(dataInclusao);
		this.setMotorista(motorista);
		this.setId_dispositivo(id_disposistivo);
		this.setDataEnvio(dataEnvio);
		this.setDataAceite(dataAceite);
		this.setJustificativa_recusa(justificativa_recusa);
		this.setJustificativa_cancelamento(justificativa_cancelamento);
		this.setDataFinalizacao(dataFinalizacao);
		this.setValor(valor);
		this.setConvenioCheck(convenioCheck);
	
		
	}

	public void setCod_chamado(int cod_chamado) {
		this.cod_chamado = cod_chamado;
	}

	public int getCod_chamado() {
		return cod_chamado;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setDataInclusao(String dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public String getDataInclusao() {
		return dataInclusao;
	}

	public void setMotorista(String motorista) {
		this.motorista = motorista;
	}

	public String getMotorista() {
		return motorista;
	}

	public void setId_dispositivo(String id_dispositivo) {
		this.id_dispositivo = id_dispositivo;
	}

	public String getId_dispositivo() {
		return id_dispositivo;
	}

	public void setDataEnvio(String dataEnvio) {
		this.dataEnvio = dataEnvio;
	}

	public String getDataEnvio() {
		return dataEnvio;
	}

	public void setDataAceite(String dataAceite) {
		this.dataAceite = dataAceite;
	}

	public String getDataAceite() {
		return dataAceite;
	}

	public void setJustificativa_recusa(String justificativa_recusa) {
		this.justificativa_recusa = justificativa_recusa;
	}

	public String getJustificativa_recusa() {
		return justificativa_recusa;
	}

	public void setDataFinalizacao(String dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

	public String getDataFinalizacao() {
		return dataFinalizacao;
	}

	public void setJustificativa_cancelamento(String justificativa_cancelamento) {
		this.justificativa_cancelamento = justificativa_cancelamento;
	}

	public String getJustificativa_cancelamento() {
		return justificativa_cancelamento;
	}

	public void setValor(float valor) {
		this.valor = valor;
	}

	public float getValor() {
		return valor;
	}

	public void setPassageiro(String passageiro) {
		this.passageiro = passageiro;
	}

	public String getPassageiro() {
		return passageiro;
	}

	public void setConvenio(String convenio) {
		this.convenio = convenio;
	}

	public String getConvenio() {
		return convenio;
	}

	public void setConvenioCheck(String convenioCheck) {
		this.convenioCheck = convenioCheck;
	}

	public String getConvenioCheck() {
		return convenioCheck;
	}

}
