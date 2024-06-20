package cms.site.menu.menu.svc.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.menu.menu.svc.CMSMenuMngSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSMenuMngSvc")
public class CMSMenuMngImpl extends CommonServiceImpl implements CMSMenuMngSvc {

	@Override
	public Integer selectMenuURICheck(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsMenuMng.selectMenuURICheck", map);
	}

	@Override
	public EgovMap insertChildMenuData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuMng.insertChildMenuData", vo);
		
		return (EgovMap) commonMapper.executeQuery("CmsMenuMng.selectInsertMenuData", vo.getIdx());
	}

	@Override
	public EgovMap selectMenuMaxSort(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsMenuMng.selectMenuMaxSort", vo);
	}

	@Override
	public void updateMenuListDeleteData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuMng.updateMenuListDeleteData", vo);
		if(vo.getParamKeyList1() != null && vo.getParamKeyList1().size() > 0) {
			String idx = (String) vo.getParamKeyList1().get(0);
			
			List<String> keyList = new ArrayList<>();
			List<EgovMap> dataList = (List<EgovMap>) commonMapper.executeQuery("CmsMenuMng.selectUpdateMenuDeleteSortDataInfoList", idx);
			for(EgovMap data : dataList) {
			    String key = String.valueOf(data.get("no"));
			    
			    keyList.add(key);
			}
			
			EgovMap map = new EgovMap();
			map.put("idx", idx);
			map.put("keyList", keyList);
			
			if(keyList.size() > 0) commonMapper.executeQuery("CmsMenuMng.updateMenuDeleteSortData", map);
		}
	}

	@Override
	public void updateMenuData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuMng.updateMenuData", vo);
	}

	@Override
	public void updateDragMenuMove(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuMng.updateDragMenuMove", vo);
	}
	
	@Override
	public void updateDragMenuChildrenDepth(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuMng.updateDragMenuChildrenDepth", vo);
	}

	@Override
	public void updateDragMenuSortOrder(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuMng.updateDragMenuSortOrder", vo);
	}

	@Override
	public List<?> selectBoardMngDataList() throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsMenuMng.selectBoardMngDataList", null);
	}

	@Override
	public List<?> selectContentsMngDataList() throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsMenuMng.selectContentsMngDataList", null);
	}
	
}
