package cms.site.account.access.svc;

import java.util.List;


import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSAccessMngSvc {

	public List<?> selectAccessDataList(CommonVO vo) throws Exception;
	
	public Integer selectAccessDataListCnt(CommonVO vo) throws Exception;
	
	public String selectIpStatus(CommonVO vo) throws Exception;
	
	public void insertAndUpdateIpAccessStatusData(CommonVO vo) throws Exception;

	public EgovMap selectAccessData(CommonVO vo) throws Exception;

	public List<?> selectAdminAccountDataList(CommonVO vo) throws Exception;

	public void insertAccessData(CommonVO vo) throws Exception;

	public void updateAccessData(CommonVO vo) throws Exception;

	public void deleteAccessDataList(CommonVO vo) throws Exception;
	
}
