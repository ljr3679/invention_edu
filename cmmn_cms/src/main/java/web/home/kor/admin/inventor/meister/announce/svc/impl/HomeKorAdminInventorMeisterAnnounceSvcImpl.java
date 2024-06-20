package web.home.kor.admin.inventor.meister.announce.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.inventor.meister.announce.svc.HomeKorAdminInventorMeisterAnnounceSvc;

@Service("homeKorAdminInventorMeisterAnnounceSvc")
public class HomeKorAdminInventorMeisterAnnounceSvcImpl extends CommonServiceImpl implements HomeKorAdminInventorMeisterAnnounceSvc{
	
	@Override
	public List<?> selectHomeKorAdminInventorMeisterAnnounceList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.selectHomeKorAdminInventorMeisterAnnounceList", vo);
	}

	@Override
	public Integer selectHomeKorAdminInventorMeisterAnnounceListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.selectHomeKorAdminInventorMeisterAnnounceListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.selectHomeKorAdminInventorMeisterAnnounce", vo);
	}

	@Override
	public void insertHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.insertHomeKorAdminInventorMeisterAnnounce", vo);
	}

	@Override
	public void updateHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.updateHomeKorAdminInventorMeisterAnnounce", vo);
	}

	@Override
	public void deleteHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.deleteHomeKorAdminInventorMeisterAnnounce", vo);
	}
	
	@Override
	public void deleteHomeKorAdminInventorMeisterAnnounceList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.deleteHomeKorAdminInventorMeisterAnnounceList", vo);
	}
	
	                    /*         접수현황                      */
						/*         접수현황                      */
						/*         접수현황                      */
	
	@Override
	public List<?> selectHomeKorAdminInventorMeisterAnnounceApplyList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.selectHomeKorAdminInventorMeisterAnnounceApplyList", vo);
	}

	@Override
	public Integer selectHomeKorAdminInventorMeisterAnnounceApplyListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.selectHomeKorAdminInventorMeisterAnnounceApplyListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminInventorMeisterAnnounceApply(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.selectHomeKorAdminInventorMeisterAnnounceApply", vo);
	}

	@Override
	public void updateHomeKorAdminInventorMeisterAnnounceApply(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminInventorMeisterAnnounce_SQL.updateHomeKorAdminInventorMeisterAnnounceApply", vo);
	}
}