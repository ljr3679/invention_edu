package cms.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("dateUtil")
public class DateUtil {
	
	/**
	 * @param format yyyy(년) / MM(월) / dd(일) / HH(시) / mm(분) / ss(초)
	 * @return
	 */
	public String getCurrentDate(String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf.format(new Date()); 
	}

}
