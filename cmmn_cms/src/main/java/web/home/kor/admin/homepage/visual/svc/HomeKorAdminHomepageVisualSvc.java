package web.home.kor.admin.homepage.visual.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepageVisualSvc {

	public List<?> selectHomeKorAdminHomepageVisualList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminHomepageVisualListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminHomepageVisual(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminHomepageVisual(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminHomepageVisual(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageVisual(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageVisualList(CommonVO vo) throws Exception;
}
