package cms.schedule;

import org.springframework.scheduling.annotation.Scheduled;

public class MemorySchedule {

	@Scheduled(cron="0 0 0/1 * * *")
	public void memorySchedule() {
		try {
			//1 : B
			//1024 : KB
			//1024 * 1024 : MB
			//1024 * 1024 * 1024 : GB
			double unit = 1024 * 1024;
			String express = "MB";
			Runtime runtime = Runtime.getRuntime();
			
			//System.out.println("Used Memory :: "+String.format("%.2f", (runtime.totalMemory() - runtime.freeMemory()) / unit)+express);
			//System.out.println("Free Memory :: "+String.format("%.2f", runtime.freeMemory() / unit)+express);
			//System.out.println("Total Memory :: "+String.format("%.2f", runtime.totalMemory() / unit)+express);
			//System.out.println("Max Memory :: "+String.format("%.2f", runtime.maxMemory() / unit)+express);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
