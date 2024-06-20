package cms.data.svc;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface StaticDataSvc {
	
	public List<EgovMap> selectSiteCodeDataList() throws Exception;
	
	public List<EgovMap> selectLangCodeDataList(List<String> lang) throws Exception;
	
	public Integer selectMaxMenuDepth(String gubun, String site, String lang) throws Exception;
	
	public List<EgovMap> selectSeparateMenuDataList(String gubun, String site, String lang, Integer depth) throws Exception;
	
}
