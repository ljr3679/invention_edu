package web.home.kor.user.event.award.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.event.award.contact.svc.HomeKorUserEventAwardContactSvc;

@Service("homeKorUserEventAwardContactSvc")
public class HomeKorUserEventAwardContactSvcImpl extends CommonServiceImpl implements HomeKorUserEventAwardContactSvc{
	@Override
	public void insertHomeKorUserEventAwardContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}