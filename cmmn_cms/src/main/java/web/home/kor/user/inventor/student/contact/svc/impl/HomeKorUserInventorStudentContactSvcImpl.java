package web.home.kor.user.inventor.student.contact.svc.impl;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.inventor.student.contact.svc.HomeKorUserInventorStudentContactSvc;

@Service("homeKorUserInventorStudentContactSvc")
public class HomeKorUserInventorStudentContactSvcImpl extends CommonServiceImpl implements HomeKorUserInventorStudentContactSvc{
	@Override
	public void insertHomeKorUserInventorStudentContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserCenterContactSQL.insertHomeKorUserCenterContact", vo);
	}
}