package web.home.kor.user.inventor.meister.announce.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.inventor.meister.announce.svc.HomeKorUserInventorMeisterAnnounceSvc;
import web.home.kor.user.inventor.meister.contact.svc.HomeKorUserInventorMeisterContactSvc;

@Service("homeKorUserInventorMeisterAnnounceSvc")
public class HomeKorUserInventorMeisterAnnounceSvcImpl extends CommonServiceImpl implements HomeKorUserInventorMeisterAnnounceSvc{

	@Override
	public List<?> selectHomeKorUserInventorMeisterAnnounceList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounceList", vo);
	}

	@Override
	public Integer selectHomeKorUserInventorMeisterAnnounceListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounceListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorUserInventorMeisterAnnounce(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		int row = (Integer) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounceRow", vo);
		vo.setPos(String.valueOf(row));
		List<EgovMap> rowList = (List<EgovMap>) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnouncePrevNextList", vo);
		for(EgovMap map : rowList) {
			String no = String.valueOf(map.get("no"));
			String title = String.valueOf(map.get("title"));
			int pos = Integer.parseInt(String.valueOf(map.get("pos")));
			
			if(pos > row) {
				vo.setPrev(no);
				vo.setPrevTitle(title);
			} else if(pos < row) {
				vo.setNext(no);
				vo.setNextTitle(title);
			}
		}
		
		return (EgovMap) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounce", vo);
	}

	@Override
	public EgovMap selectHomeKorUserInventorMeisterAnnounceApply(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounceApply", vo);
	}

	@Override
	public void insertHomeKorUserInventorMeisterAnnounceApply(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.insertHomeKorUserInventorMeisterAnnounceApply", vo);
	}

	@Override
	public void updateHomeKorUserInventorMeisterAnnounceApply(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.updateHomeKorUserInventorMeisterAnnounceApply", vo);
	}

	@Override
	public EgovMap selectHomeKorUserInventorMeisterAnnounceApplyNumber(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounceApplyNumber", vo);
	}

	@Override
	public EgovMap selectHomeKorUserInventorMeisterAnnounceApplyNo(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.selectHomeKorUserInventorMeisterAnnounceApplyNo", map);
	}

	@Override
	public void updateHomeKorUserInventorMeisterAnnounceApplyUseAt(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserInventorMeisterAnnounceSQL.updateHomeKorUserInventorMeisterAnnounceApplyUseAt", map);
	}

}