package web.home.kor.user.inventor.patent.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.inventor.patent.contact.svc.HomeKorUserInventorPatentContactSvc;

@Service("homeKorUserInventorPatentContactSvc")
public class HomeKorUserInventorPatentContactSvcImpl extends CommonServiceImpl implements HomeKorUserInventorPatentContactSvc{
	@Override
	public void insertHomeKorUserInventorPatentContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}