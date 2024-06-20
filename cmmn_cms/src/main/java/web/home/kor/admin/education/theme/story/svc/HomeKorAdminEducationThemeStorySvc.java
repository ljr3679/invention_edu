package web.home.kor.admin.education.theme.story.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationThemeStorySvc {

	public List<?> selectHomeKorAdminEducationThemeStoryList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationThemeStoryListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationThemeStoryList(CommonVO vo) throws Exception;
}
