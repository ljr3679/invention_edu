package cms.file.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface FileDataSvc {
	
	public List<?> selectFileDataList(EgovMap map) throws Exception;
	
	public void insertFileData(EgovMap map) throws Exception;
	
	public void deleteFileData(CommonVO vo) throws Exception;
	
	public EgovMap selectFileDataInfo(String uniqueKey) throws Exception;
	
	public void updateFileDownloadCountDataInfo(String uniqueKey) throws Exception;


}
