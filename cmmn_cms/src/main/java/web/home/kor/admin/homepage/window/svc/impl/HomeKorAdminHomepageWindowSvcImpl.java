package web.home.kor.admin.homepage.window.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.window.svc.HomeKorAdminHomepageWindowSvc;

@Service("homeKorAdminHomepageWindowSvc")
public class HomeKorAdminHomepageWindowSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepageWindowSvc{
	
	@Override
	public List<?> selectHomeKorAdminHomepageWindowList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.selectHomeKorAdminHomepageWindowList", vo);
	}

	@Override
	public Integer selectHomeKorAdminHomepageWindowListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.selectHomeKorAdminHomepageWindowListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminHomepageWindow(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.selectHomeKorAdminHomepageWindow", vo);
	}

	@Override
	public void insertHomeKorAdminHomepageWindow(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.insertHomeKorAdminHomepageWindow", vo);
	}

	@Override
	public void updateHomeKorAdminHomepageWindow(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.updateHomeKorAdminHomepageWindow", vo);
	}

	@Override
	public void deleteHomeKorAdminHomepageWindow(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.deleteHomeKorAdminHomepageWindow", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepageWindowList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageWindow_SQL.deleteHomeKorAdminHomepageWindowList", vo);
	}
}