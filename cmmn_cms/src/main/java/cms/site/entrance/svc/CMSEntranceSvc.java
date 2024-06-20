package cms.site.entrance.svc;

import javax.servlet.http.HttpServletRequest;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSEntranceSvc {
	
	public String selectIpStatus(CommonVO vo, HttpServletRequest request) throws Exception;

	public EgovMap selectLoginAct(CommonVO vo, HttpServletRequest request) throws Exception;

}
