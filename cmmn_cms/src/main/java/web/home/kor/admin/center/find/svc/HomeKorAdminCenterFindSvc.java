package web.home.kor.admin.center.find.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminCenterFindSvc {

	public List<?> selectHomeKorAdminCenterFindList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminCenterFindListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminCenterFind(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminCenterFind(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminCenterFind(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminCenterFind(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminCenterFindList(CommonVO vo) throws Exception;
}
