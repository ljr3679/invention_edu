package web.home.kor.admin.homepage.popup.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.popup.svc.HomeKorAdminHomepagePopupSvc;

@Service("homeKorAdminHomepagePopupSvc")
public class HomeKorAdminHomepagePopupSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepagePopupSvc{
	
	@Override
	public List<?> selectHomeKorAdminHomepagePopupList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.selectHomeKorAdminHomepagePopupList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminHomepagePopupListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.selectHomeKorAdminHomepagePopupListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminHomepagePopup(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.selectHomeKorAdminHomepagePopup", vo);
	}
	
	@Override
	public void insertHomeKorAdminHomepagePopup(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.insertHomeKorAdminHomepagePopup", vo);
	}
	
	@Override
	public void updateHomeKorAdminHomepagePopup(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.updateHomeKorAdminHomepagePopup", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepagePopup(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.deleteHomeKorAdminHomepagePopup", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepagePopupList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepagePopup_SQL.deleteHomeKorAdminHomepagePopupList", vo);
	}
}