package cms.cmmn.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CommonSvc {

	public List<?> selectCategoryAllDataList(String cate) throws Exception;
	
	public List<?> selectCategoryParentDataList(String cate) throws Exception;
	
	public List<?> selectCategoryChildrenDataList(EgovMap param) throws Exception;
	
	public EgovMap selectCMSBoardContentData(String boardCode) throws Exception;
	
	public List<?> selectUserMainFooterList(CommonVO vo) throws Exception;
	
	public Integer selectUserDataCnt(EgovMap map) throws Exception;
	
	public void insertUserData(EgovMap map) throws Exception;
	
	public void insertMemberData(EgovMap map) throws Exception;
	
	public void updateUserData(EgovMap map) throws Exception;
}
