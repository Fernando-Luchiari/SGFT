package dao.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

public class DistanciaMotorista {

	public int retornaDistancia (String origem,String destino){
		int metros = 0;
		boolean orinum=false;
		boolean destnum=false;
		try{
			float ori = Float.parseFloat(origem);
			System.out.println(ori);
			orinum=true;
		}catch(Exception e){
			orinum = false;
		}
		try{
			float dest = Float.parseFloat(destino);
			System.out.println(dest);
			destnum=true;
		}catch(Exception e){
			destnum = false;
		}
		
		if (!destnum){
			destino = destino.replaceAll(" ", "%20");
			destino = destino.replaceAll("é", "e");
			destino = destino.replaceAll("ã", "a");
			destino = destino.replaceAll("õ", "o");
		}
		if (!orinum){
			origem = origem.replaceAll(" ", "%20");
			origem = origem.replaceAll("é", "e");
			origem = origem.replaceAll("ã", "a");
			origem = origem.replaceAll("õ", "o");
		}
		
		
		//http://maps.google.com/maps/api/directions/xml?origin=-16.8013400,-49.2506800&destination=-23.5498500,-46.5844300&sensor=false
		
		try{
			URL url = new URL("http://maps.google.com/maps/api/directions/xml?origin="+ origem + "&destination="+destino+"&sensor=false");
			BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream()));
			//String linha = null;
			//while ((linha= in.readLine())!= null ){
				//System.out.println(linha);
			//}
			SAXBuilder sb = new SAXBuilder();  
			Document d = sb.build(in);
			Element caminho = d.getRootElement();			
			Element rota =  caminho.getChild("route");
			Element leg =  rota.getChild("leg");
			Element distance =  leg.getChild("distance");
			Element distancia = distance.getChild("value");
			metros=Integer.parseInt(distancia.getText());					
		}catch (Exception e ){
			System.out.println(e);
		}
		return metros;
	}
	/*public static void main(String[] args) {
		DistanciaMotorista a = new DistanciaMotorista();
		int metros = a.retornaDistancia("rua taguari,sp", "rua serra de jaire,sp");
		System.out.println(metros);
	}*/

}
