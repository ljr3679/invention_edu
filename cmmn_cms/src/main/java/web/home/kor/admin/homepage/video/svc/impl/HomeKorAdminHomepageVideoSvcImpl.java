package web.home.kor.admin.homepage.video.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.video.svc.HomeKorAdminHomepageVideoSvc;

@Service("homeKorAdminHomepageVideoSvc")
public class HomeKorAdminHomepageVideoSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepageVideoSvc{
	
	/*@Override
	public List<?> selectHomeKorAdminHomepageVideoList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.selectHomeKorAdminHomepageVideoList", vo);
	}*/
	
	@Override
	public Integer selectHomeKorAdminHomepageVideoListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.selectHomeKorAdminHomepageVideoListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminHomepageVideo(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.selectHomeKorAdminHomepageVideo", vo);
	}
	
	@Override
	public void insertHomeKorAdminHomepageVideo(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.insertHomeKorAdminHomepageVideo", vo);
	}
	
	@Override
	public void updateHomeKorAdminHomepageVideo(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.updateHomeKorAdminHomepageVideo", vo);
	}
	
	/*@Override
	public void deleteHomeKorAdminHomepageVideo(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.deleteHomeKorAdminHomepageVideo", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepageVideoList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageVideo_SQL.deleteHomeKorAdminHomepageVideoList", vo);
	}*/
}