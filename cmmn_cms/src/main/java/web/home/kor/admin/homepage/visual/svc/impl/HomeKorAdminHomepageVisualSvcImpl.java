package web.home.kor.admin.homepage.visual.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.visual.svc.HomeKorAdminHomepageVisualSvc;

@Service("homeKorAdminHomepageVisualSvc")
public class HomeKorAdminHomepageVisualSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepageVisualSvc{
	
	@Override
	public List<?> selectHomeKorAdminHomepageVisualList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.selectHomeKorAdminHomepageVisualList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminHomepageVisualListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.selectHomeKorAdminHomepageVisualListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminHomepageVisual(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.selectHomeKorAdminHomepageVisual", vo);
	}
	
	@Override
	public void insertHomeKorAdminHomepageVisual(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.insertHomeKorAdminHomepageVisual", vo);
	}
	
	@Override
	public void updateHomeKorAdminHomepageVisual(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.updateHomeKorAdminHomepageVisual", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepageVisual(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.deleteHomeKorAdminHomepageVisual", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepageVisualList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVisual_SQL.deleteHomeKorAdminHomepageVisualList", vo);
	}
}