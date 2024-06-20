package cms.data.svc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.data.svc.StaticDataSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("staticDataSvc")
public class StaticDataImpl extends CommonServiceImpl implements StaticDataSvc {

	@Override
	public List<EgovMap> selectSiteCodeDataList() throws Exception {
		// TODO Auto-generated method stub
		return (List<EgovMap>) commonMapper.executeQuery("StaticData.selectSiteCodeDataList", null);
	}
	
	@Override
	public List<EgovMap> selectLangCodeDataList(List<String> lang) throws Exception {
		// TODO Auto-generated method stub
		Map<String, List<String>> param = new HashMap<String, List<String>>();
		param.put("lang", lang);
		return (List<EgovMap>) commonMapper.executeQuery("StaticData.selectLangCodeDataList", param);
	}
	
	@Override
	public Integer selectMaxMenuDepth(String gubun, String site, String lang) throws Exception {
		// TODO Auto-generated method stub
		EgovMap map = new EgovMap();
		map.put("gubun", gubun);
		map.put("site", site);
		map.put("lang", lang);
		return (Integer) commonMapper.executeQuery("StaticData.selectMaxMenuDepth", map);
	}

	@Override
	public List<EgovMap> selectSeparateMenuDataList(String gubun, String site, String lang, Integer depth) throws Exception {
		// TODO Auto-generated method stub
		EgovMap map = new EgovMap();
		map.put("gubun", gubun);
		map.put("site", site);
		map.put("lang", lang);
		map.put("depth", depth);
		
		List<Object> roof = new ArrayList<Object>(depth-1);
		for(int i=0; i<depth-1; i++) {
			int innerRoofCnt = depth-1-i;
			List<Object> innerRoof = new ArrayList<Object>(innerRoofCnt);
			for(int j=0; j<innerRoofCnt; j++) innerRoof.add(j);
			
			roof.add(innerRoof);
		}
		map.put("roof", roof);
		
		return (List<EgovMap>) commonMapper.executeQuery("StaticData.selectSeparateMenuDataList", map);
	}

}
