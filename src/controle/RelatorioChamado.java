package controle;

import java.io.File;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ChamadoRelatTO;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;


public class RelatorioChamado {

	public static void execute(ServletContext sc, List<ChamadoRelatTO> listChamado, HttpServletRequest request,
			HttpServletResponse response) {
		try {
		
			JRDataSource jrds = new JRBeanCollectionDataSource(listChamado);

			Map  parameters = new HashMap();
			
			File reportFile = null;
			try{
				reportFile = new File(sc.getRealPath("/WEB-INF/Relatórios/Chamado.jasper"));
				
			}catch(Exception e){
				System.out.println("erro " + e);
			}
			
			byte[] bytes = null;
			
			try {
				bytes = JasperRunManager.runReportToPdf(reportFile.getPath(),parameters, jrds);
				 
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}
		   
			if (bytes != null && bytes.length > 0) {
				response.setContentType("application/pdf");
				response.setContentLength(bytes.length);
				ServletOutputStream ouputStream = response.getOutputStream();
				ouputStream.write(bytes, 0, bytes.length);
				ouputStream.flush();
				ouputStream.close();
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}
