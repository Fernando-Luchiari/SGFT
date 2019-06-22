package job;

import java.util.Iterator;
import java.util.List;

import modelo.Chamado_Cliente;
import modelo.Chamado_ClienteTO;
import modelo.ClassesException;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import dao.impl.DefineMotorista;

public class JobFila implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		Chamado_Cliente chamadoCli = new Chamado_Cliente();
		try {
			List<Chamado_ClienteTO> listaFila = chamadoCli.consultar(5);
			Iterator<Chamado_ClienteTO> iteratorFila = listaFila.iterator();
			DefineMotorista motoristaFila = new DefineMotorista();
			while (iteratorFila.hasNext()) {
				Chamado_ClienteTO  item = iteratorFila.next();
				motoristaFila.calculaMelhorMotorista(item.getCodigo_chamado());			
			}
		} catch (ClassesException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
