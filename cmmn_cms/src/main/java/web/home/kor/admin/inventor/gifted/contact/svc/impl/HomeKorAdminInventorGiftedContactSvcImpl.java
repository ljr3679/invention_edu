package web.home.kor.admin.inventor.gifted.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.inventor.gifted.contact.svc.HomeKorAdminInventorGiftedContactSvc;

@Service("homeKorAdminInventorGiftedContactSvc")
public class HomeKorAdminInventorGiftedContactSvcImpl extends CommonServiceImpl implements HomeKorAdminInventorGiftedContactSvc{
	
	@Override
	public List<?> selectHomeKorAdminInventorGiftedContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminInventorGiftedContactListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContactListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.selectHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void insertHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.insertHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void updateHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.updateHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminInventorGiftedContact(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContact", vo);
	}
	
	@Override
	public void deleteHomeKorAdminInventorGiftedContactList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminDirectionContact_SQL.deleteHomeKorAdminDirectionContactList", vo);
	}
}