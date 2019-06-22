package dao.impl;


import java.util.Calendar;
import java.util.GregorianCalendar;

public class PegaDataAtual {
	public String dataAtual()
	{
		String dia = null;
		String mes = null;
		Calendar calendar = new GregorianCalendar();
		if (calendar.get(GregorianCalendar.DATE) < 10){
        	int nummes = calendar.get(GregorianCalendar.DATE) ;
        	dia = "0" + nummes;
        }else{
        	dia = ""+(calendar.get(GregorianCalendar.DATE));
        }
        if (calendar.get(GregorianCalendar.MONTH) < 10){
        	int nummes = calendar.get(GregorianCalendar.MONTH) + 1;
        	mes = "0" + nummes;
        }else{
        	int nummes = calendar.get(GregorianCalendar.MONTH) + 1;
        	mes = ""+ nummes;
        }
		String data = calendar.get(GregorianCalendar.YEAR) + "-" + mes + "-" + dia ;
		data = data + " " + calendar.get(GregorianCalendar.HOUR_OF_DAY) + ":"+ calendar.get(GregorianCalendar.MINUTE);
		data=data+ ":" + + calendar.get(GregorianCalendar.SECOND);
        return data;
	}
	
	public String dataAtualSemHora()
	{
		String dia = null;
		String mes = null;
		Calendar calendar = new GregorianCalendar();
		if (calendar.get(GregorianCalendar.DATE) < 10){
        	int nummes = calendar.get(GregorianCalendar.DATE) ;
        	dia = "0" + nummes;
        }else{
        	dia = ""+(calendar.get(GregorianCalendar.DATE));
        }
        if (calendar.get(GregorianCalendar.MONTH) < 10){
        	int nummes = calendar.get(GregorianCalendar.MONTH) + 1;
        	if (nummes < 10) {
        		mes = "0" + nummes;
        	}else{
        		mes= ""+nummes;
        	}
        }else{
        	int nummes = calendar.get(GregorianCalendar.MONTH) + 1;
        	mes = ""+ nummes;
        }
		String data = calendar.get(GregorianCalendar.YEAR) + "-" + mes + "-" + dia ;
        return data;
	}
	
}
