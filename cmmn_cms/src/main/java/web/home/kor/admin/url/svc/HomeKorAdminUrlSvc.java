package web.home.kor.admin.url.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminUrlSvc {

	public List<?> selectHomeKorAdminUrlList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminUrlListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminUrl(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminUrl(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminUrl(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminUrl(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminUrlList(CommonVO vo) throws Exception;	
	
	public EgovMap selectUrlInfoCheckUrlNm(CommonVO vo) throws Exception;
	
}
