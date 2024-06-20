package web.home.kor.user.education.theme.story.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserEducationThemeStorySvc {

	public List<?> selectHomeKorUserEducationThemeStoryList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationThemeStoryListCnt(CommonVO vo) throws Exception;
}
