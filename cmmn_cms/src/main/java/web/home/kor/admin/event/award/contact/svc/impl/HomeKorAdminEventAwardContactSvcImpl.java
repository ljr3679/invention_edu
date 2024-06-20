package web.home.kor.admin.event.award.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.event.award.contact.svc.HomeKorAdminEventAwardContactSvc;

@Service("homeKorAdminEventAwardContactSvc")
public class HomeKorAdminEventAwardContactSvcImpl extends CommonServiceImpl implements HomeKorAdminEventAwardContactSvc{
	
	@Override
	public List<?> selectHomeKorAdminEventAwardContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEventAwardContactListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEventAwardContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void insertHomeKorAdminEventAwardContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.insertHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void updateHomeKorAdminEventAwardContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.updateHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventAwardContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventAwardContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContactList", vo);
	}
}