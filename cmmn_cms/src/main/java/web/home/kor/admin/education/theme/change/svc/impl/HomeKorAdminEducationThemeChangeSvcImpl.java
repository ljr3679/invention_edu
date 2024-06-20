package web.home.kor.admin.education.theme.change.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.theme.change.svc.HomeKorAdminEducationThemeChangeSvc;


@Service("homeKorAdminEducationThemeChangeSvc")
public class HomeKorAdminEducationThemeChangeSvcImpl extends CommonServiceImpl implements HomeKorAdminEducationThemeChangeSvc {

	@Override
	public List<?> selectHomeKorAdminEducationThemeChangeList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.selectHomeKorAdminEducationThemeChangeList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationThemeChangeListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.selectHomeKorAdminEducationThemeChangeListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.selectHomeKorAdminEducationThemeChange", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.insertHomeKorAdminEducationThemeChange", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.updateHomeKorAdminEducationThemeChange", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationThemeChange(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.deleteHomeKorAdminEducationThemeChange", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationThemeChangeList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationThemeChange_SQL.deleteHomeKorAdminEducationThemeChangeList", vo);
	}	
	
}
