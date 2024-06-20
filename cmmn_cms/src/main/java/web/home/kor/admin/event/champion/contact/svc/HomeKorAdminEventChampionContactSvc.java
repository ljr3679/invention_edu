package web.home.kor.admin.event.champion.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEventChampionContactSvc {

	public List<?> selectHomeKorAdminEventChampionContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEventChampionContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEventChampionContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEventChampionContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEventChampionContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventChampionContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventChampionContactList(CommonVO vo) throws Exception;
}
