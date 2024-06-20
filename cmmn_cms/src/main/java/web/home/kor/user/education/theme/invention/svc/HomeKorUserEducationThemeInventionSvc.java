package web.home.kor.user.education.theme.invention.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserEducationThemeInventionSvc {

	public List<?> selectHomeKorUserEducationThemeInventionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationThemeInventionListCnt(CommonVO vo) throws Exception;
}
