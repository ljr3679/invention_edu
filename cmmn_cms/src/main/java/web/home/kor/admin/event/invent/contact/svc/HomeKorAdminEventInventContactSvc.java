package web.home.kor.admin.event.invent.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEventInventContactSvc {

	public List<?> selectHomeKorAdminEventInventContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEventInventContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEventInventContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEventInventContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEventInventContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventInventContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventInventContactList(CommonVO vo) throws Exception;
}
