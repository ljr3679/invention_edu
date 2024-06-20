package cms.site.menu.contents.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSContentsMngSvc {
	
	public List<?> selectContentsDataList(CommonVO vo) throws Exception;
	
	public int selectContentsListDataCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectContentsData(CommonVO vo) throws Exception;
	
	public int selectCheckBoardKey(String board_code) throws Exception;
	
	public void insertAndUpdateContentsData(CommonVO vo) throws Exception;
	
	public void updateAndUpdateContentsData(CommonVO vo) throws Exception;
	
	public List<?> selectContentsDataUseAtList(CommonVO vo) throws Exception;
	
	public void deleteContentsData(CommonVO vo) throws Exception;
	
}
