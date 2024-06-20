package web.home.kor.user.archive.serveyMng.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserArchiveServeyMngSvc {
	public List<?> selectHomeKorUserArchiveServeyMngList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserArchiveServeyMngListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserArchiveServeyMngData(CommonVO vo) throws Exception;
	
	public List<?> selectHomeKorUserArchiveServeyMngDataList(CommonVO vo) throws Exception;
	
	public void insertHomeKorUserArchiveServeyMngData(CommonVO vo) throws Exception;
	
	public void insertHomeKorUserArchiveServeyMngSubData(CommonVO vo) throws Exception;
	
}
