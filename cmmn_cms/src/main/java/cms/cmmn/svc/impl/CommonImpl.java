package cms.cmmn.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.cmmn.svc.CommonSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("commonSvc")
public class CommonImpl extends CommonServiceImpl implements CommonSvc {
	
	@Override
	public List<?> selectCategoryAllDataList(String cate) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("Common.selectCategoryAllDataList", cate);
	}

	@Override
	public List<?> selectCategoryParentDataList(String cate) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("Common.selectCategoryParentDataList", cate);
	}

	@Override
	public List<?> selectCategoryChildrenDataList(EgovMap param) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("Common.selectCategoryChildrenDataList", param);
	}
	
	@Override
	public EgovMap selectCMSBoardContentData(String boardCode) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("Common.selectCMSBoardContentData", boardCode);
	}
	
	@Override
	public List<?> selectUserMainFooterList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("Common.selectUserMainFooterList", vo);
	}

	@Override
	public Integer selectUserDataCnt(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("Common.selectUserDataCnt", map);
	}

	@Override
	public void insertUserData(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("Common.insertUserData", map);
	}

	@Override
	public void insertMemberData(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("Common.insertMemberData", map);
	}	
	
	@Override
	public void updateUserData(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("Common.updateUserData", map);
	}

}
