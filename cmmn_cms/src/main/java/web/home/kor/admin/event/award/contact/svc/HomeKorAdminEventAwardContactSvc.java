package web.home.kor.admin.event.award.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEventAwardContactSvc {

	public List<?> selectHomeKorAdminEventAwardContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEventAwardContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEventAwardContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEventAwardContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEventAwardContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventAwardContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventAwardContactList(CommonVO vo) throws Exception;
}
