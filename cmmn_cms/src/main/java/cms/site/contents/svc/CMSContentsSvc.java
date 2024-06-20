package cms.site.contents.svc;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSContentsSvc {
	
	public EgovMap selectCMSContentsData(CommonVO vo) throws Exception;
	
	public void updateCMSContentsData(CommonVO vo) throws Exception;

}
