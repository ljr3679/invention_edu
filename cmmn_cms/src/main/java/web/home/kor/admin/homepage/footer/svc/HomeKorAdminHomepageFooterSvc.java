package web.home.kor.admin.homepage.footer.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepageFooterSvc {

	public List<?> selectHomeKorAdminHomepageFooterList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminHomepageFooterListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminHomepageFooter(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminHomepageFooter(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminHomepageFooter(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageFooter(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageFooterList(CommonVO vo) throws Exception;
}
