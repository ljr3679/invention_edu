package web.home.kor.user.education.theme.invention.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.education.theme.invention.svc.HomeKorUserEducationThemeInventionSvc;

@Service("homeKorUserEducationThemeInventionSvc")
public class HomeKorUserEducationThemeInventionSvcImpl extends CommonServiceImpl implements HomeKorUserEducationThemeInventionSvc{

	@Override
	public List<?> selectHomeKorUserEducationThemeInventionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationThemeInvention_SQL.selectHomeKorUserEducationThemeInventionList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationThemeInventionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationThemeInvention_SQL.selectHomeKorUserEducationThemeInventionListCnt", vo);
	}
}
