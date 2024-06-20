package web.home.kor.admin.event.contest.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEventContestContactSvc {

	public List<?> selectHomeKorAdminEventContestContactList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEventContestContactListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEventContestContact(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEventContestContact(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEventContestContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventContestContact(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventContestContactList(CommonVO vo) throws Exception;
}
