package web.home.kor.admin.inventor.student.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminInventorStudentContactSvc {

	public List<?> selectHomeKorAdminInventorStudentContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorStudentContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorStudentContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminInventorStudentContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorStudentContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorStudentContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorStudentContactList(CommonVO vo) throws Exception;
}
