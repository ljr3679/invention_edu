package web.home.kor.user.inventor.meister.announce.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserInventorMeisterAnnounceSvc {
	public List<?> selectHomeKorUserInventorMeisterAnnounceList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserInventorMeisterAnnounceListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserInventorMeisterAnnounce(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserInventorMeisterAnnounceApply(CommonVO vo) throws Exception;
	
	public void insertHomeKorUserInventorMeisterAnnounceApply(CommonVO vo) throws Exception;
	
	public void updateHomeKorUserInventorMeisterAnnounceApply(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserInventorMeisterAnnounceApplyNumber(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserInventorMeisterAnnounceApplyNo(EgovMap map) throws Exception;
	
	public void updateHomeKorUserInventorMeisterAnnounceApplyUseAt(EgovMap map) throws Exception;
	
}
