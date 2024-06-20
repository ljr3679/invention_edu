package web.home.kor.admin.education.theme.invention.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.theme.invention.svc.HomeKorAdminEducationThemeInventionSvc;

@Service("homeKorAdminEducationThemeInventionSvc")
public class HomeKorAdminEducationThemeInventionSvcImpl extends CommonServiceImpl implements HomeKorAdminEducationThemeInventionSvc{
	
	@Override
	public List<?> selectHomeKorAdminEducationThemeInventionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.selectHomeKorAdminEducationThemeInventionList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationThemeInventionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.selectHomeKorAdminEducationThemeInventionListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.selectHomeKorAdminEducationThemeInvention", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.insertHomeKorAdminEducationThemeInvention", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.updateHomeKorAdminEducationThemeInvention", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationThemeInvention(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.deleteHomeKorAdminEducationThemeInvention", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationThemeInventionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeInvention_SQL.deleteHomeKorAdminEducationThemeInventionList", vo);
	}
}