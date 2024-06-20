package web.home.kor.admin.homepage.message.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepageMessageSvc {

	public List<?> selectHomeKorAdminHomepageMessageList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminHomepageMessageListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminHomepageMessage(CommonVO vo) throws Exception;
	
	public List<?> selectMemberDataList(CommonVO vo) throws Exception;
	
	public Integer selectMemberDataListCnt(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminHomepageMessage(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminHomepageMessage(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageMessage(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageMessageList(CommonVO vo) throws Exception;

	public void insertHomeKorAdminHomepageMessageLog(CommonVO vo) throws Exception;	
	
	public List<?> selectHomeKorAdminHomepageMessageLogList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminHomepageMessageLogListCnt(CommonVO vo) throws Exception;	
	
}
