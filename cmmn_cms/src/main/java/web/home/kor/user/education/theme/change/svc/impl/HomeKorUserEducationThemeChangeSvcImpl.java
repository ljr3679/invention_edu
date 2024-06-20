package web.home.kor.user.education.theme.change.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.education.theme.change.svc.HomeKorUserEducationThemeChangeSvc;

@Service("homeKorUserEducationThemeChangeSvc")
public class HomeKorUserEducationThemeChangeSvcImpl extends CommonServiceImpl implements HomeKorUserEducationThemeChangeSvc{

	@Override
	public List<?> selectHomeKorUserEducationThemeChangeList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationThemeChange_SQL.selectHomeKorUserEducationThemeChangeList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationThemeChangeListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationThemeChange_SQL.selectHomeKorUserEducationThemeChangeListCnt", vo);
	}	
	
}
