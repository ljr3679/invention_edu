package web.home.kor.user.center.find.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserCenterFindSvc {

	public List<?> selectHomeKorUserCenterFindList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserCenterFindListCnt(CommonVO vo) throws Exception;
}
