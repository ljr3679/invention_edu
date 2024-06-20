package web.home.kor.admin.inventor.meister.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminInventorMeisterContactSvc {

	public List<?> selectHomeKorAdminInventorMeisterContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorMeisterContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorMeisterContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorMeisterContactList(CommonVO vo) throws Exception;
}
