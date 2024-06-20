package web.home.kor.user.event.champion.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.event.champion.contact.svc.HomeKorUserEventChampionContactSvc;

@Service("homeKorUserEventChampionContactSvc")
public class HomeKorUserEventChampionContactSvcImpl extends CommonServiceImpl implements HomeKorUserEventChampionContactSvc{
	@Override
	public void insertHomeKorUserEventChampionContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}