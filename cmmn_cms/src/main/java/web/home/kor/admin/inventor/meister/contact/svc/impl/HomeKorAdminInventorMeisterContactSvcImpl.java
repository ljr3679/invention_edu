package web.home.kor.admin.inventor.meister.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.inventor.meister.contact.svc.HomeKorAdminInventorMeisterContactSvc;

@Service("homeKorAdminInventorMeisterContactSvc")
public class HomeKorAdminInventorMeisterContactSvcImpl extends CommonServiceImpl implements HomeKorAdminInventorMeisterContactSvc{
	
	@Override
	public List<?> selectHomeKorAdminInventorMeisterContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminInventorMeisterContactListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void insertHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.insertHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void updateHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.updateHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminInventorMeisterContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContactList", vo);
	}
}