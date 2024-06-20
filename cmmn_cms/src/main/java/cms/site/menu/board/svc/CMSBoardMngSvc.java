package cms.site.menu.board.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSBoardMngSvc {

	public List<?> selectBoardDataList(CommonVO vo) throws Exception;
	
	public int selectBoardListDataCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectBoardData(CommonVO vo) throws Exception;
	
	public int selectCheckBoardKey(String board_code) throws Exception;
	
	public void insertAndUpdateBoardData(CommonVO vo) throws Exception;
	
	public List<?> selectBoardDataUseAtList(CommonVO vo) throws Exception;
	
	public void deleteBoardData(CommonVO vo) throws Exception;
	
	public List<?> selectCategoryDataList(CommonVO vo) throws Exception;
	
}
