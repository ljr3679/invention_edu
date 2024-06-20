package web.home.kor.admin.education.theme.story.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.theme.story.svc.HomeKorAdminEducationThemeStorySvc;

@Service("homeKorAdminEducationThemeStorySvc")
public class HomeKorAdminEducationThemeStorySvcImpl extends CommonServiceImpl implements HomeKorAdminEducationThemeStorySvc{
	
	@Override
	public List<?> selectHomeKorAdminEducationThemeStoryList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.selectHomeKorAdminEducationThemeStoryList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationThemeStoryListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.selectHomeKorAdminEducationThemeStoryListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.selectHomeKorAdminEducationThemeStory", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.insertHomeKorAdminEducationThemeStory", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.updateHomeKorAdminEducationThemeStory", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationThemeStory(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.deleteHomeKorAdminEducationThemeStory", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationThemeStoryList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeStory_SQL.deleteHomeKorAdminEducationThemeStoryList", vo);
	}
}