package cms.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cms.constant.Const;
import cms.data.StaticData;

public final class Logs {

	private static Logger Log = LoggerFactory.getLogger(Logs.class);
	
	public static void print(Object log) {
		StackTraceElement[] elements = new Exception().getStackTrace();
        String className = elements[1].getClassName();
        
        switch (StaticData.getInstance().getGlobalsProp().getProperty(Const.LOGGER_LEVEL)) {
			case "1":Log.debug(className.substring(className.lastIndexOf(".") + 1, className.length())+"_"+elements[1].getMethodName()+"("+elements[1].getLineNumber()+") - " + String.valueOf(log));break;
			case "2":Log.info(className.substring(className.lastIndexOf(".") + 1, className.length())+"_"+elements[1].getMethodName()+"("+elements[1].getLineNumber()+") - " + String.valueOf(log));break;
			case "3":Log.error(className.substring(className.lastIndexOf(".") + 1, className.length())+"_"+elements[1].getMethodName()+"("+elements[1].getLineNumber()+") - " + String.valueOf(log));break;
			default:break;
		}
    }
	
	public static void printError(Object log) {
		StackTraceElement[] elements = new Exception().getStackTrace();
        String className = elements[1].getClassName();
        Log.error(className.substring(className.lastIndexOf(".") + 1, className.length())+"_"+elements[1].getMethodName()+"("+elements[1].getLineNumber()+") - " + String.valueOf(log));
	}
	
}
