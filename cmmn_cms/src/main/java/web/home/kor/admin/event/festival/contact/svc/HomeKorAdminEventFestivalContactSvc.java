package web.home.kor.admin.event.festival.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEventFestivalContactSvc {

	public List<?> selectHomeKorAdminEventFestivalContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEventFestivalContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventFestivalContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventFestivalContactList(CommonVO vo) throws Exception;
}
