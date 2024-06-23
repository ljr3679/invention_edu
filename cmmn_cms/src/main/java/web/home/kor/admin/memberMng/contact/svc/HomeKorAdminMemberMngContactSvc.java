package web.home.kor.admin.memberMng.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminMemberMngContactSvc {

	public List<?> selectContactDataList(CommonVO vo) throws Exception;
	
	public List<?> selectContactExlDataList(CommonVO vo) throws Exception;
	
	public Integer selectContactDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectContactData(CommonVO vo) throws Exception;	
	
	public List<?> selectContactSubEduInfoList(CommonVO vo) throws Exception;
	
	public List<?> selectContactSubCareerInfoList(CommonVO vo) throws Exception;	

	public void insertContactData(CommonVO vo) throws Exception;
	
	public void insertTbContactEduData(CommonVO vo) throws Exception;
	
	public void insertTbContactCareerData(CommonVO vo) throws Exception;	
	
	public void updateTbContactData(CommonVO vo) throws Exception;
	
	public void deleteContactData(CommonVO vo) throws Exception;
	
	public void deleteContactCareerData(CommonVO vo) throws Exception;

	public void deleteContactEduData(CommonVO vo) throws Exception;	
	
	public void downloadCMSRecord(CommonVO vo) throws Exception;
	
}
