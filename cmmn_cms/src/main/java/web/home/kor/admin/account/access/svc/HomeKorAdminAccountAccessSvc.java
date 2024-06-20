package web.home.kor.admin.account.access.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorAdminAccountAccessSvc {
	
	public List<?> selectLoginDataList(CommonVO vo) throws Exception;
	
	public Integer selectLoginDataListCnt(CommonVO vo) throws Exception;		
	
	public void downloadCMSRecord(CommonVO vo) throws Exception;

}
