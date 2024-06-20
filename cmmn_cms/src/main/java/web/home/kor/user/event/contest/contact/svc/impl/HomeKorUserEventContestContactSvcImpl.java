package web.home.kor.user.event.contest.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.event.contest.contact.svc.HomeKorUserEventContestContactSvc;

@Service("homeKorUserEventContestContactSvc")
public class HomeKorUserEventContestContactSvcImpl extends CommonServiceImpl implements HomeKorUserEventContestContactSvc{
	@Override
	public void insertHomeKorUserEventContestContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}