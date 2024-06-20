package web.home.kor.user.inventor.gifted.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.inventor.gifted.contact.svc.HomeKorUserInventorGiftedContactSvc;

@Service("homeKorUserInventorGiftedContactSvc")
public class HomeKorUserInventorGiftedContactSvcImpl extends CommonServiceImpl implements HomeKorUserInventorGiftedContactSvc{
	@Override
	public void insertHomeKorUserInventorGiftedContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}