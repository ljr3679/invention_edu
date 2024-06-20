package cms.site.menu.menu.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSMenuMngSvc {

	public Integer selectMenuURICheck(EgovMap map) throws Exception;
	
	public EgovMap insertChildMenuData(CommonVO vo) throws Exception;
	
	public EgovMap selectMenuMaxSort(CommonVO vo) throws Exception;
	
	public void updateMenuListDeleteData(CommonVO vo) throws Exception;
	
	public void updateMenuData(CommonVO vo) throws Exception;
	
	public void updateDragMenuMove(CommonVO vo) throws Exception;
	
	public void updateDragMenuChildrenDepth(CommonVO vo) throws Exception;
	
	public void updateDragMenuSortOrder(CommonVO vo) throws Exception;
	
	public List<?> selectBoardMngDataList() throws Exception;
	
	public List<?> selectContentsMngDataList() throws Exception;
	
}
