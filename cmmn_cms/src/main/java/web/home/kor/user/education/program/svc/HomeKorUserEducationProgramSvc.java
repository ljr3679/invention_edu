package web.home.kor.user.education.program.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserEducationProgramSvc {

	public List<?> selectHomeKorUserEducationProgramList(CommonVO vo) throws Exception;
	
	public List<?> selectHomeKorUserEducationProgramPromList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationProgramListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserEducationProgram(CommonVO vo) throws Exception;
	
	/**			목차				*/
	
	public List<?> selectHomeKorUserEducationProgramIndexList(CommonVO vo) throws Exception;
	
	/**			관련 자료 링크				*/
	
	public List<?> selectHomeKorUserEducationProgramLinkList(CommonVO vo) throws Exception;
	
	/**			댓글				*/
	
	public List<?> selectHomeKorUserEducationProgramCommentList(CommonVO vo) throws Exception;
	
	public void insertHomeKorUserEducationProgramComment(EgovMap map) throws Exception;
	
	public void updateHomeKorUserEducationProgramComment(EgovMap map) throws Exception;
	
	public void deleteHomeKorUserEducationProgramComment(CommonVO vo) throws Exception;
	
	public void deleteHomeKorUserEducationProgramCommentList(CommonVO vo) throws Exception;
	
	public void deleteHomeKorUserEducationProgramCommentMultipleList(CommonVO vo) throws Exception;
	
	/**			스크랩				*/
	
	public Integer selectHomeKorUserEducationProgramScrapAtCnt(CommonVO vo) throws Exception;
	
	public void insertHomeKorUserEducationProgramScrap(EgovMap map) throws Exception;
	
	public void deleteHomeKorUserEducationProgramScrap(CommonVO vo) throws Exception;
	
	public void deleteHomeKorUserEducationProgramScrapList(CommonVO vo) throws Exception;
}
