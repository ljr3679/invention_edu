package cms.site.account.account.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSAccountMngSvc {

	public List<?> selectAccountDataList(CommonVO vo) throws Exception;
	
	public Integer selectAccountDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectAccountData(CommonVO vo) throws Exception;
	
	public void insertAccountData(CommonVO vo) throws Exception;
	
	public void updateAccountData(CommonVO vo) throws Exception;
	
	public void deleteAccountDataList(CommonVO vo) throws Exception;

	public List<EgovMap> selectAuthorityNameList(CommonVO vo)throws Exception;

	public Integer selectAdminIdCheck(String id) throws Exception;
}
