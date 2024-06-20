package web.home.kor.user.center.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.center.find.svc.HomeKorAdminCenterFindSvc;
import web.home.kor.user.center.contact.svc.HomeKorUserCenterContactSvc;
import web.home.kor.user.center.find.svc.HomeKorUserCenterFindSvc;

@Service("homeKorUserCenterContactSvc")
public class HomeKorAdminUserContactSvcImpl extends CommonServiceImpl implements HomeKorUserCenterContactSvc{
	@Override
	public void insertHomeKorUserCentercontact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}