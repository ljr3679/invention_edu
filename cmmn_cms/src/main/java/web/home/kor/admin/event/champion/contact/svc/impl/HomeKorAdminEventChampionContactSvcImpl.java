package web.home.kor.admin.event.champion.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.event.champion.contact.svc.HomeKorAdminEventChampionContactSvc;

@Service("homeKorAdminEventChampionContactSvc")
public class HomeKorAdminEventChampionContactSvcImpl extends CommonServiceImpl implements HomeKorAdminEventChampionContactSvc{
	
	@Override
	public List<?> selectHomeKorAdminEventChampionContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEventChampionContactListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEventChampionContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void insertHomeKorAdminEventChampionContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.insertHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void updateHomeKorAdminEventChampionContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.updateHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventChampionContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventChampionContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContactList", vo);
	}
}