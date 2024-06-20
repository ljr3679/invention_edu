package web.url.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface UrlInfoService {


	public EgovMap getUrlInfo(CommonVO vo) throws Exception;

	public EgovMap getUrlInfoByUrlNm(CommonVO vo) throws Exception;

	public EgovMap getUrlInfoCheckUrlNm(CommonVO vo) throws Exception;

	public Integer setUrlCnt(CommonVO vo) throws Exception;

	
	
}
