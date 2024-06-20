package web.home.kor.user.education.theme.change.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserEducationThemeChangeSvc {

	public List<?> selectHomeKorUserEducationThemeChangeList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationThemeChangeListCnt(CommonVO vo) throws Exception;
	
}
