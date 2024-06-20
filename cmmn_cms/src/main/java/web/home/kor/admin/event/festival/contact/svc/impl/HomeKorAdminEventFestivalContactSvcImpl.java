package web.home.kor.admin.event.festival.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.event.festival.contact.svc.HomeKorAdminEventFestivalContactSvc;

@Service("homeKorAdminEventFestivalContactSvc")
public class HomeKorAdminEventFestivalContactSvcImpl extends CommonServiceImpl implements HomeKorAdminEventFestivalContactSvc{
	
	@Override
	public List<?> selectHomeKorAdminEventFestivalContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEventFestivalContactListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void insertHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.insertHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void updateHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.updateHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventFestivalContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContactList", vo);
	}
}