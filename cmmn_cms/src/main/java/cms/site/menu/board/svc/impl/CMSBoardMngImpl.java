package cms.site.menu.board.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.menu.board.svc.CMSBoardMngSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSBoardMngSvc")
public class CMSBoardMngImpl extends CommonServiceImpl implements CMSBoardMngSvc {
	
	@Override
	public List<?> selectBoardDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsBoardMng.selectBoardDataList", vo);
	}

	@Override
	public int selectBoardListDataCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsBoardMng.selectBoardListDataCnt", vo);
	}

	@Override
	public EgovMap selectBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsBoardMng.selectBoardData", vo);
	}

	@Override
	public int selectCheckBoardKey(String board_code) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsBoardMng.selectCheckBoardKey", board_code);
	}

	@Override
	public void insertAndUpdateBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		Boolean check = (Boolean) commonMapper.executeQuery("CmsBoardMng.selectBoardDataAt", vo);
		
		if(check) commonMapper.executeQuery("CmsBoardMng.updateBoardData", vo);
		else commonMapper.executeQuery("CmsBoardMng.insertBoardData", vo);
	}

	@Override
	public List<?> selectBoardDataUseAtList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsBoardMng.selectBoardDataUseAtList", vo);
	}

	@Override
	public void deleteBoardData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsBoardMng.deleteBoardData", vo);
	}

	@Override
	public List<?> selectCategoryDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsBoardMng.selectCategoryDataList", vo);
	}

}
