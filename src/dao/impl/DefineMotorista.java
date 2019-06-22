package dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import modelo.Chamado_Aceite;
import modelo.Chamado_AceiteTO;
import modelo.Chamado_Cliente;
import modelo.Chamado_ClienteTO;
import modelo.Chamado_Envio;
import modelo.Chamado_EnvioTO;
import modelo.ClassesException;
import modelo.Motorista;
import modelo.MotoristaTO;
import modelo.Motorista_Localizacao;
import modelo.Motorista_LocalizacaoTO;
import dao.MotoristaDAO;

public class DefineMotorista {
	int indicemotorista = 0;
	int distanciamenor = 0;

	public void calculaMelhorMotorista(int chamado) throws ClassesException {
		List<MotoristaTO> listaMotoristalivre = null;
		try {
			MotoristaDAO selMotoristaLivre = new MotoristaDAOImpl();
			// monta a lista de motoristas livres
			listaMotoristalivre = selMotoristaLivre.consultarMotoristaLivre();
			Iterator<MotoristaTO> iterator = listaMotoristalivre.iterator();
			List<Motorista_LocalizacaoTO> listaMotoristaloc = new ArrayList<Motorista_LocalizacaoTO>();
			while (iterator.hasNext()) {
				MotoristaTO item = iterator.next();
				// consulta os motoristas q ja recusaram o chamado que está
				// sendo direcionado
				String id = "" + item.getId_dispositivo();
				Chamado_AceiteTO dadoschamadoaceite = new Chamado_AceiteTO(id,
						chamado);
				Chamado_Aceite chamadoaceite = new Chamado_Aceite(
						dadoschamadoaceite);
				List<Chamado_AceiteTO> listablock = chamadoaceite.consultar(1);
				Iterator<Chamado_AceiteTO> iteratorBlock = listablock
						.iterator();
				// caso encontre o motorista em questão
				if (iteratorBlock.hasNext()) {
					Chamado_AceiteTO itemblock = iteratorBlock.next();
				} else {
					//
					Motorista_LocalizacaoTO dadosMotoristaLoc = new Motorista_LocalizacaoTO(
							item.getId_dispositivo());
					Motorista_Localizacao motolocaliza = new Motorista_Localizacao(
							dadosMotoristaLoc);
					// consulta coordenadas de cada motorista livre
					Motorista_LocalizacaoTO resultado = motolocaliza
							.consultar();
					if (resultado != null) {
						listaMotoristaloc.add(resultado);
					}
				}
			}
			if(!listaMotoristaloc.isEmpty()){
				Iterator<Motorista_LocalizacaoTO> itlatlong = listaMotoristaloc
						.iterator();
				int menorDistancia = 0;
				int melhorMotorista = 0;
				DistanciaMotorista dist = new DistanciaMotorista();
				Chamado_ClienteTO dadoschamado = new Chamado_ClienteTO(chamado);
				Chamado_Cliente chamadocli = new Chamado_Cliente(dadoschamado);
				Chamado_ClienteTO resultado = chamadocli.consultarChamado();
				String destino = resultado.getRua_origem() + ","
						+ resultado.getNumero_origem() + ",";
				destino = destino + resultado.getCidade_origem() + ","
						+ resultado.getEstado_origem();
				while (itlatlong.hasNext()) {
					Motorista_LocalizacaoTO item = itlatlong.next();
					String origem = item.getLatitude() + "," + item.getLongitude();
					int distancia = dist.retornaDistancia(origem, destino);
	
					if (menorDistancia == 0) {
						melhorMotorista = item.getId_dispositivo();
						menorDistancia = distancia;
					}
					if (menorDistancia > distancia) {
						melhorMotorista = item.getId_dispositivo();
						menorDistancia = distancia;
					}
				}
				Chamado_EnvioTO dadosenvio = new Chamado_EnvioTO(chamado,
						melhorMotorista);
				Chamado_Envio chamadoenvio = new Chamado_Envio(dadosenvio);
				chamadoenvio.inserir();
				//
				MotoristaTO dadosmotorista = new MotoristaTO();
				dadosmotorista.setId_dispositivo(melhorMotorista);
				dadosmotorista.setStatus(2);
				Motorista motorista = new Motorista(dadosmotorista,null);
				motorista.alterarStatus();
				//
				// alterando o status do chamado para 3 (aguardando aceite)
				Chamado_ClienteTO chamadoCli = new Chamado_ClienteTO();
				chamadoCli.setCodigo_chamado(chamado);
				chamadoCli.setCodigo_status(3);
				Chamado_Cliente chamadoStatus = new Chamado_Cliente(chamadoCli);
				chamadoStatus.alterarStatus();
				
			}else{
				Chamado_ClienteTO chamadoCli = new Chamado_ClienteTO();
				chamadoCli.setCodigo_chamado(chamado);
				chamadoCli.setCodigo_status(6);
				Chamado_Cliente chamadoStatus = new Chamado_Cliente(chamadoCli);
				chamadoStatus.alterarStatus();
			}
			
		} catch (Exception e) {
			throw new ClassesException(e);
		}

	}

}
