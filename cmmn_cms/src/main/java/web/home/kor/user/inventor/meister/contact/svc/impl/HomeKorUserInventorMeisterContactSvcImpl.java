package web.home.kor.user.inventor.meister.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.inventor.meister.contact.svc.HomeKorUserInventorMeisterContactSvc;

@Service("homeKorUserInventorMeisterContactSvc")
public class HomeKorUserInventorMeisterContactSvcImpl extends CommonServiceImpl implements HomeKorUserInventorMeisterContactSvc{
	@Override
	public void insertHomeKorUserInventorMeisterContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}