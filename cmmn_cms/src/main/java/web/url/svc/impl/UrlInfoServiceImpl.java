package web.url.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.url.svc.UrlInfoService;

@Service("urlSvc")
public class UrlInfoServiceImpl extends CommonServiceImpl implements UrlInfoService  {

	@Override
	public EgovMap getUrlInfo(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("UrlInfo_SQL.selectUrlInfo", vo);
	}

	@Override
	public EgovMap getUrlInfoByUrlNm(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("UrlInfo_SQL.selectUrlInfoByUrlNm", vo);
	}

	@Override
	public EgovMap getUrlInfoCheckUrlNm(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("UrlInfo_SQL.selectUrlInfoCheckUrlNm", vo);
	}

	@Override
	public Integer setUrlCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("UrlInfo_SQL.updateUrlCnt", vo);
	}
	
	
}
