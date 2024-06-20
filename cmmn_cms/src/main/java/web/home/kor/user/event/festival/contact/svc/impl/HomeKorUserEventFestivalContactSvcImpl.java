package web.home.kor.user.event.festival.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.event.festival.contact.svc.HomeKorUserEventFestivalContactSvc;

@Service("homeKorUserEventFestivalContactSvc")
public class HomeKorUserEventFestivalContactSvcImpl extends CommonServiceImpl implements HomeKorUserEventFestivalContactSvc{
	@Override
	public void insertHomeKorUserEventFestivalContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}