package web.home.kor.admin.inventor.patent.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminInventorPatentContactSvc {

	public List<?> selectHomeKorAdminInventorPatentContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorPatentContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorPatentContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminInventorPatentContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorPatentContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorPatentContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorPatentContactList(CommonVO vo) throws Exception;
}
