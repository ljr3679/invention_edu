package web.home.kor.admin.education.theme.change.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationThemeChangeSvc {

	public List<?> selectHomeKorAdminEducationThemeChangeList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationThemeChangeListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationThemeChangeList(CommonVO vo) throws Exception;	
	
}
