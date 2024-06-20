package web.home.kor.user.event.invent.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.event.invent.contact.svc.HomeKorUserEventInventContactSvc;

@Service("homeKorUserEventInventContactSvc")
public class HomeKorUserEventInventContactSvcImpl extends CommonServiceImpl implements HomeKorUserEventInventContactSvc{
	@Override
	public void insertHomeKorUserEventInventContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}