package web.home.kor.admin.homepage.serveyMng.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepageServeyMngSvc {

	public List<?> selectAdminSurveyDataList(CommonVO vo) throws Exception;
	
	public Integer selectAdminSurveyDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectAdminSurveyData(CommonVO vo) throws Exception;
	
	public List<?> selectAdminSurveySubDataList(CommonVO vo) throws Exception;
	
	public List<?> selectAdminSurveyEditSubTotalDataList(CommonVO vo) throws Exception;
	
	public void insertAdminSurveyData(CommonVO vo) throws Exception;
	
	public void updateAdminSurveyData(CommonVO vo) throws Exception;
	
	public void insertAdminSurveySubData(CommonVO vo) throws Exception;
	
	public void updateAdminSurveySubData(CommonVO vo) throws Exception;
	
	public void updateAdminSurveyDataDel(CommonVO vo) throws Exception;
	
	public void deleteAdminSurveySubData(CommonVO vo) throws Exception;
	
	public List<?> selectEducationParticipantSurveyDataList(CommonVO vo) throws Exception;
	
	public Integer selectEducationParticipantSurveyDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectAdminSurveyEditData(CommonVO vo) throws Exception;
	
	public List<?> selectAdminSurveyEditSubDataList(CommonVO vo) throws Exception;
	
	public List<?> selectAdminSurveyEditSubmitTextDataInfoList(EgovMap map) throws Exception;
	
}
