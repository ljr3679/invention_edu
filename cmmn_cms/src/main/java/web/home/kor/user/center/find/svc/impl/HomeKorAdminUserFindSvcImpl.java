package web.home.kor.user.center.find.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.center.find.svc.HomeKorAdminCenterFindSvc;
import web.home.kor.user.center.find.svc.HomeKorUserCenterFindSvc;

@Service("homeKorUserCenterFindSvc")
public class HomeKorAdminUserFindSvcImpl extends CommonServiceImpl implements HomeKorUserCenterFindSvc{
	
	@Override
	public List<?> selectHomeKorUserCenterFindList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserCenterFindSQL.selectHomeKorUserCenterFindList", vo);
	}

	@Override
	public Integer selectHomeKorUserCenterFindListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserCenterFindSQL.selectHomeKorUserCenterFindListCnt", vo);
	}

}