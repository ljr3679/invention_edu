package cms.config;

import cms.util.Logs;
import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

public class EgovExcepHndlr implements ExceptionHandler {

	@Override
	public void occur(Exception ex, String packageName) {
		Logs.printError("EgovServiceExceptionHandler run...............");
		Logs.printError("##ERROR - "+ex.getMessage());
	}
	
}
