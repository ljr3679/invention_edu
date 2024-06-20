package web.home.kor.admin.homepage.window.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepageWindowSvc {

	public List<?> selectHomeKorAdminHomepageWindowList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminHomepageWindowListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminHomepageWindow(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminHomepageWindow(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminHomepageWindow(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageWindow(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageWindowList(CommonVO vo) throws Exception;
}
