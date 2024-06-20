package web.home.kor.admin.center.find.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.center.find.svc.HomeKorAdminCenterFindSvc;

@Service("homeKorAdminCenterFindSvc")
public class HomeKorAdminCenterFindSvcImpl extends CommonServiceImpl implements HomeKorAdminCenterFindSvc{
	
	@Override
	public List<?> selectHomeKorAdminCenterFindList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.selectHomeKorAdminCenterFindList", vo);
	}

	@Override
	public Integer selectHomeKorAdminCenterFindListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.selectHomeKorAdminCenterFindListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminCenterFind(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.selectHomeKorAdminCenterFind", vo);
	}

	@Override
	public void insertHomeKorAdminCenterFind(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.insertHomeKorAdminCenterFind", vo);
	}

	@Override
	public void updateHomeKorAdminCenterFind(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.updateHomeKorAdminCenterFind", vo);
	}

	@Override
	public void deleteHomeKorAdminCenterFind(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.deleteHomeKorAdminCenterFind", vo);
	}
	
	@Override
	public void deleteHomeKorAdminCenterFindList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterFind_SQL.deleteHomeKorAdminCenterFindList", vo);
	}


}