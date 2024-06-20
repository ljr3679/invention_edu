package web.home.kor.user.education.theme.story.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.education.theme.story.svc.HomeKorUserEducationThemeStorySvc;

@Service("homeKorUserEducationThemeStorySvc")
public class HomeKorUserEducationThemeStorySvcImpl extends CommonServiceImpl implements HomeKorUserEducationThemeStorySvc{

	@Override
	public List<?> selectHomeKorUserEducationThemeStoryList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationThemeStory_SQL.selectHomeKorUserEducationThemeStoryList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationThemeStoryListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationThemeStory_SQL.selectHomeKorUserEducationThemeStoryListCnt", vo);
	}
}
