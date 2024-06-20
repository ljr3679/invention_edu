package web.home.kor.admin.url.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.url.svc.HomeKorAdminUrlSvc;

@Service("homeKorAdminUrlSvc")
public class HomeKorAdminUrlSvcImpl extends CommonServiceImpl implements HomeKorAdminUrlSvc {

	@Override
	public List<?> selectHomeKorAdminUrlList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminUrl_SQL.selectHomeKorAdminUrlList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminUrlListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminUrl_SQL.selectHomeKorAdminUrlListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminUrl(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminUrl_SQL.selectHomeKorAdminUrl", vo);
	}
	
	@Override
	public void insertHomeKorAdminUrl(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminUrl_SQL.insertHomeKorAdminUrl", vo);
	}
	
	@Override
	public void updateHomeKorAdminUrl(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminUrl_SQL.updateHomeKorAdminUrl", vo);
	}
	
	@Override
	public void deleteHomeKorAdminUrl(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminUrl_SQL.deleteHomeKorAdminUrl", vo);
	}
	
	@Override
	public void deleteHomeKorAdminUrlList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminUrl_SQL.deleteHomeKorAdminUrlList", vo);
	}	

	@Override
	public EgovMap selectUrlInfoCheckUrlNm(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminUrl_SQL.selectUrlInfoCheckUrlNm", vo);
	}	
	
	
}
