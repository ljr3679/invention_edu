package cms.site.board.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.board.svc.CMSBoardSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSBoardSvc")
public class CMSBoardImpl extends CommonServiceImpl implements CMSBoardSvc {
	
	@Override
	public EgovMap selectCMSBoardConfigData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsBoard.selectCMSBoardConfigData", vo);
	}

	@Override
	public List<?> selectCMSBoardDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsBoard.selectCMSBoardDataList", vo);
	}

	@Override
	public Integer selectCMSBoardDataListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsBoard.selectCMSBoardDataListCnt", vo);
	}

	@Override
	public EgovMap selectCMSBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		int row = (Integer) commonMapper.executeQuery("CmsBoard.selectCMSBoardDataRow", vo);
		vo.setPos(String.valueOf(row));
		List<EgovMap> rowList = (List<EgovMap>) commonMapper.executeQuery("CmsBoard.selectCMSBoardDataPrevNextList", vo);
		for(EgovMap map : rowList) {
			String no = String.valueOf(map.get("no"));
			int pos = Integer.parseInt(String.valueOf(map.get("pos")));
			
			if(pos > row) vo.setPrev(no);
			else if(pos < row) vo.setNext(no);
		}
		commonMapper.executeQuery("CmsBoard.updateCMSBoardDataViewCnt", vo);
		
		return (EgovMap) commonMapper.executeQuery("CmsBoard.selectCMSBoardData", vo);
	}

	@Override
	public void insertCMSBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsBoard.insertCMSBoardData", vo);
	}

	@Override
	public void updateCMSBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsBoard.updateCMSBoardData", vo);
	}

	@Override
	public void deleteCMSBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsBoard.deleteCMSBoardData", vo);
	}

	@Override
	public List<?> selectCategoryDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsBoard.selectCategoryDataList", vo);
	}

	@Override
	public Integer selectCMSBoardSecretCheck(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsBoard.selectCMSBoardSecretCheck", vo);
	}

	@Override
	public List<?> selectCMSNoticeBoardList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsBoard.selectCMSNoticeBoardList", vo);
	}	
	
}
