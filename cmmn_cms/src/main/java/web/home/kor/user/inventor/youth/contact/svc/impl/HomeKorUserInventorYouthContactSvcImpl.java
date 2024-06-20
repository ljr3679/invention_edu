package web.home.kor.user.inventor.youth.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.inventor.youth.contact.svc.HomeKorUserInventorYouthContactSvc;

@Service("homeKorUserInventorYouthContactSvc")
public class HomeKorUserInventorYouthContactSvcImpl extends CommonServiceImpl implements HomeKorUserInventorYouthContactSvc{
	@Override
	public void insertHomeKorUserInventorYouthContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}