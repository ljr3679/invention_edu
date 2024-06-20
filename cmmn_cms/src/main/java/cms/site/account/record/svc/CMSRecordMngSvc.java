package cms.site.account.record.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface CMSRecordMngSvc {

	public List<?> selectRecordDataList(CommonVO vo) throws Exception;
	
	public Integer selectRecordDataListCnt(CommonVO vo) throws Exception;
	
	public void downloadCMSRecord(CommonVO vo) throws Exception;
	
}
