package web.home.kor.admin.inventor.youth.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminInventorYouthContactSvc {

	public List<?> selectHomeKorAdminInventorYouthContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorYouthContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorYouthContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminInventorYouthContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorYouthContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorYouthContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorYouthContactList(CommonVO vo) throws Exception;
}
