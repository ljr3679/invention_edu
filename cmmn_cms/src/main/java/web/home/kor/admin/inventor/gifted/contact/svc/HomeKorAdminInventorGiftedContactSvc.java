package web.home.kor.admin.inventor.gifted.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminInventorGiftedContactSvc {

	public List<?> selectHomeKorAdminInventorGiftedContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorGiftedContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorGiftedContactList(CommonVO vo) throws Exception;
}
