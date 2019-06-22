package listener;

import java.text.ParseException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import job.JobFila;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.impl.StdSchedulerFactory;

public class ApplicationInitializer implements ServletContextListener {

	private Scheduler scheduler;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		try {
			scheduler.shutdown();
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		try {
			scheduler = StdSchedulerFactory.getDefaultScheduler();
			JobDetail jobDetail = new JobDetail("jobFila", "group", JobFila.class);
			CronTrigger trigger = new CronTrigger("trigger1", "group", "jobFila", "group", "0 0/5 * * * ?");
			scheduler.scheduleJob(jobDetail, trigger);
			scheduler.start();

		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
