package cms.file.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.file.svc.FileDataSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("fileDataSvc")
public class FileDataImpl extends CommonServiceImpl implements FileDataSvc {
	
	@Override
	public List<?> selectFileDataList(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("FileData.selectFileDataList", map);
	}

	@Override
	public void insertFileData(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("FileData.insertFileData", map);
	}

	@Override
	public void deleteFileData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("FileData.deleteFileData", vo);
	}
	
	@Override
	public EgovMap selectFileDataInfo(String uniqueKey) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("FileData.selectFileDataInfo", uniqueKey);
	}

	@Override
	public void updateFileDownloadCountDataInfo(String uniqueKey) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("FileData.updateFileDownloadCountDataInfo", uniqueKey);
	}
	
}
