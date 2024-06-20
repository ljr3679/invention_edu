package web.home.kor.user.education.program.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.education.program.svc.HomeKorUserEducationProgramSvc;

@Service("homeKorUserEducationProgramSvc")
public class HomeKorUserEducationProgramSvcImpl extends CommonServiceImpl implements HomeKorUserEducationProgramSvc{

	@Override
	public List<?> selectHomeKorUserEducationProgramList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramList", vo);
	}
	
	@Override
	public List<?> selectHomeKorUserEducationProgramPromList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramPromList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationProgramListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorUserEducationProgram(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgram", vo);
	}
	
	/**			목차				*/
	
	@Override
	public List<?> selectHomeKorUserEducationProgramIndexList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramIndexList", vo);
	}
	
	/**			관련 자료 링크				*/
	
	@Override
	public List<?> selectHomeKorUserEducationProgramLinkList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramLinkList", vo);
	}
	
	/**			댓글				*/
	
	@Override
	public List<?> selectHomeKorUserEducationProgramCommentList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramCommentList", vo);
	}
	
	@Override
	public void insertHomeKorUserEducationProgramComment(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.insertHomeKorUserEducationProgramComment", map);
	}
	
	@Override
	public void updateHomeKorUserEducationProgramComment(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.updateHomeKorUserEducationProgramComment", map);
	}
	
	@Override
	public void deleteHomeKorUserEducationProgramComment(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.deleteHomeKorUserEducationProgramComment", vo);
	}
	
	@Override
	public void deleteHomeKorUserEducationProgramCommentList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.deleteHomeKorUserEducationProgramCommentList", vo);
	}
	
	@Override
	public void deleteHomeKorUserEducationProgramCommentMultipleList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.deleteHomeKorUserEducationProgramCommentMultipleList", vo);
	}
	
	/**			스크랩				*/
	
	@Override
	public Integer selectHomeKorUserEducationProgramScrapAtCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.selectHomeKorUserEducationProgramScrapAtCnt", vo);
	}
	
	@Override
	public void insertHomeKorUserEducationProgramScrap(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.insertHomeKorUserEducationProgramScrap", map);
	}
	
	@Override
	public void deleteHomeKorUserEducationProgramScrap(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.deleteHomeKorUserEducationProgramScrap", vo);
	}
	
	@Override
	public void deleteHomeKorUserEducationProgramScrapList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserEducationProgram_SQL.deleteHomeKorUserEducationProgramScrapList", vo);
	}
	
}
