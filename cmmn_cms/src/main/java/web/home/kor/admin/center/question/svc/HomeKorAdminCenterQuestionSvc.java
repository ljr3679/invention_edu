package web.home.kor.admin.center.question.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminCenterQuestionSvc {
	
	public List<?> selectHomeKorAdminCenterQuestionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminCenterQuestionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminCenterQuestion(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminCenterQuestion(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminCenterQuestion(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminCenterQuestion(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminCenterQuestionList(CommonVO vo) throws Exception;

}
