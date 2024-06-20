package web.home.kor.admin.account.access.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.admin.account.access.svc.HomeKorAdminAccountAccessSvc;

@Service("homeKorAdminAccountAccessSvc")
public class HomeKorAdminAccountAccessSvcImpl extends CommonServiceImpl implements HomeKorAdminAccountAccessSvc {
	
	@Override
	public List<?> selectLoginDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminAccountAccess_SQL.selectLoginDataList", vo);
	}
	
	@Override
	public Integer selectLoginDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorAdminAccountAccess_SQL.selectLoginDataListCnt", vo);
	}	

	@Override
	public void downloadCMSRecord(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminAccountAccess_SQL.downloadCMSRecord", vo);
	}	
	
}
