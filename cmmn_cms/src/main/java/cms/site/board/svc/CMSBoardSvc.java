package cms.site.board.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSBoardSvc {
	
	public EgovMap selectCMSBoardConfigData(CommonVO vo) throws Exception;

	public List<?> selectCMSBoardDataList(CommonVO vo) throws Exception;
	
	public Integer selectCMSBoardDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectCMSBoardData(CommonVO vo) throws Exception;
	
	public void insertCMSBoardData(CommonVO vo) throws Exception;
	
	public void updateCMSBoardData(CommonVO vo) throws Exception;
	
	public void deleteCMSBoardData(CommonVO vo) throws Exception;
	
	public List<?> selectCategoryDataList(CommonVO vo) throws Exception;
	
	public Integer selectCMSBoardSecretCheck(CommonVO vo) throws Exception;
	
	public List<?> selectCMSNoticeBoardList(CommonVO vo) throws Exception;
}
