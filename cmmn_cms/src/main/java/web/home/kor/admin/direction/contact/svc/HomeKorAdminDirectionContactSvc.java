package web.home.kor.admin.direction.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminDirectionContactSvc {
	
	public List<?> selectHomeKorAdminDirectionContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminDirectionContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminDirectionContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminDirectionContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminDirectionContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminDirectionContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminDirectionContactList(CommonVO vo) throws Exception;

}
