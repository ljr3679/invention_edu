package web.home.kor.admin.homepage.popup.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepagePopupSvc {

	public List<?> selectHomeKorAdminHomepagePopupList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminHomepagePopupListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminHomepagePopup(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminHomepagePopup(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminHomepagePopup(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepagePopup(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepagePopupList(CommonVO vo) throws Exception;
}
