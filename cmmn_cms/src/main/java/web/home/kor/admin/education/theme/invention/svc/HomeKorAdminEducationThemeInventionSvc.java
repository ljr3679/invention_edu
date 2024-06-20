package web.home.kor.admin.education.theme.invention.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationThemeInventionSvc {

	public List<?> selectHomeKorAdminEducationThemeInventionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationThemeInventionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationThemeInventionList(CommonVO vo) throws Exception;
}
