package web.home.kor.admin.homepage.footer.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.footer.svc.HomeKorAdminHomepageFooterSvc;

@Service("homeKorAdminHomepageFooterSvc")
public class HomeKorAdminHomepageFooterSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepageFooterSvc{
	
	@Override
	public List<?> selectHomeKorAdminHomepageFooterList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.selectHomeKorAdminHomepageFooterList", vo);
	}

	@Override
	public Integer selectHomeKorAdminHomepageFooterListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.selectHomeKorAdminHomepageFooterListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminHomepageFooter(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.selectHomeKorAdminHomepageFooter", vo);
	}

	@Override
	public void insertHomeKorAdminHomepageFooter(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.insertHomeKorAdminHomepageFooter", vo);
	}

	@Override
	public void updateHomeKorAdminHomepageFooter(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.updateHomeKorAdminHomepageFooter", vo);
	}

	@Override
	public void deleteHomeKorAdminHomepageFooter(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.deleteHomeKorAdminHomepageFooter", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepageFooterList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageFooter_SQL.deleteHomeKorAdminHomepageFooterList", vo);
	}
}