package cms.site.account.menu.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSMenuAuthorityMngSvc {
	
	public List<?> selectMenuAuthorityDataList(CommonVO vo) throws Exception;
	
	public Integer selectMenuAuthorityDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectMenuAuthorityData(CommonVO vo) throws Exception;
	
	public void insertMenuAuthorityData(CommonVO vo) throws Exception;
	
	public void updateMenuAuthorityData(CommonVO vo) throws Exception;
	
	public void deleteMenuAuthorityDataList(CommonVO vo) throws Exception;
	
	public EgovMap selectMenuAuthoritySessionInit(CommonVO vo) throws Exception;
	
	public List<EgovMap> selectAuthorityDataUseAtList(CommonVO vo) throws Exception;

}
