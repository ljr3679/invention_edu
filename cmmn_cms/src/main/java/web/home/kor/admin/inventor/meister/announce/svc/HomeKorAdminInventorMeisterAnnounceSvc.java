package web.home.kor.admin.inventor.meister.announce.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminInventorMeisterAnnounceSvc {

	public List<?> selectHomeKorAdminInventorMeisterAnnounceList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorMeisterAnnounceListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorMeisterAnnounce(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminInventorMeisterAnnounceList(CommonVO vo) throws Exception;
	
											/*     접수현황           */
	
	public List<?> selectHomeKorAdminInventorMeisterAnnounceApplyList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminInventorMeisterAnnounceApplyListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminInventorMeisterAnnounceApply(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminInventorMeisterAnnounceApply(CommonVO vo) throws Exception;
}
