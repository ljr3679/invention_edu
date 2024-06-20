package cms.site.menu.contents.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.menu.contents.svc.CMSContentsMngSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSContentsMngSvc")
public class CMSContentsMngImpl extends CommonServiceImpl implements CMSContentsMngSvc {
	
	@Override
	public List<?> selectContentsDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsContentsMng.selectContentsDataList", vo);
	}

	@Override
	public int selectContentsListDataCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsContentsMng.selectContentsListDataCnt", vo);
	}

	@Override
	public EgovMap selectContentsData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsContentsMng.selectContentsData", vo);
	}

	@Override
	public int selectCheckBoardKey(String board_code) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsContentsMng.selectCheckBoardKey", board_code);
	}

	@Override
	public void insertAndUpdateContentsData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsContentsMng.insertAndUpdateContentsData", vo);
	}
	
	@Override
	public void updateAndUpdateContentsData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsContentsMng.updateAndUpdateContentsData", vo);
	}

	@Override
	public List<?> selectContentsDataUseAtList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsContentsMng.selectContentsDataUseAtList", vo);
	}

	@Override
	public void deleteContentsData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsContentsMng.deleteContentsData", vo);
	}

}
