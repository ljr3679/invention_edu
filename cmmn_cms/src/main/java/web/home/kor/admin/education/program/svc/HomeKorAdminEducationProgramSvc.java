package web.home.kor.admin.education.program.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationProgramSvc {

	public List<?> selectHomeKorAdminEducationProgramList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationProgramListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationProgram(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationProgram(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationProgram(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgram(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramList(CommonVO vo) throws Exception;
	
	/**			목차				*/
	/**			목차				*/
	/**			목차				*/
	
	public List<?> selectHomeKorAdminEducationProgramIndexList(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationProgramIndex(EgovMap map) throws Exception;
	
	public void updateHomeKorAdminEducationProgramIndex(EgovMap map) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramIndex(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramIndexList(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramIndexMultipleList(CommonVO vo) throws Exception;
	
	/**			관련 자료 링크				*/
	/**			관련 자료 링크				*/
	/**			관련 자료 링크				*/
	
	public List<?> selectHomeKorAdminEducationProgramLinkList(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationProgramLink(EgovMap map) throws Exception;
	
	public void updateHomeKorAdminEducationProgramLink(EgovMap map) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramLink(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramLinkList(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramLinkMultipleList(CommonVO vo) throws Exception;
	
	/**			댓글				*/
	/**			댓글				*/
	/**			댓글				*/
	
	public List<?> selectHomeKorAdminEducationProgramCommentList(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationProgramComment(EgovMap map) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramComment(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramCommentList(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationProgramCommentMultipleList(CommonVO vo) throws Exception;
	
	
}
