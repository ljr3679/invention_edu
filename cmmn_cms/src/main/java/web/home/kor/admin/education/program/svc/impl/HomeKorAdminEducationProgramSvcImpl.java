package web.home.kor.admin.education.program.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.program.svc.HomeKorAdminEducationProgramSvc;

@Service("homeKorAdminEducationProgramSvc")
public class HomeKorAdminEducationProgramSvcImpl extends CommonServiceImpl implements HomeKorAdminEducationProgramSvc{
	
	@Override
	public List<?> selectHomeKorAdminEducationProgramList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.selectHomeKorAdminEducationProgramList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationProgramListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.selectHomeKorAdminEducationProgramListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationProgram(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.selectHomeKorAdminEducationProgram", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationProgram(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.insertHomeKorAdminEducationProgram", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationProgram(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.updateHomeKorAdminEducationProgram", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgram(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgram", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramList", vo);
	}
	
	/**			목차				*/
	/**			목차				*/
	/**			목차				*/
	
	@Override
	public List<?> selectHomeKorAdminEducationProgramIndexList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.selectHomeKorAdminEducationProgramIndexList", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationProgramIndex(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.insertHomeKorAdminEducationProgramIndex", map);
	}
	
	@Override
	public void updateHomeKorAdminEducationProgramIndex(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.updateHomeKorAdminEducationProgramIndex", map);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramIndex(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramIndex", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramIndexList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramIndexList", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramIndexMultipleList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramIndexMultipleList", vo);
	}
	/**			관련 자료 링크				*/
	/**			관련 자료 링크				*/
	/**			관련 자료 링크				*/
	
	@Override
	public List<?> selectHomeKorAdminEducationProgramLinkList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.selectHomeKorAdminEducationProgramLinkList", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationProgramLink(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.insertHomeKorAdminEducationProgramLink", map);
	}
	
	@Override
	public void updateHomeKorAdminEducationProgramLink(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.updateHomeKorAdminEducationProgramLink", map);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramLink(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramLink", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramLinkList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramLinkList", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramLinkMultipleList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramLinkMultipleList", vo);
	}
	
	/**			댓글				*/
	/**			댓글				*/
	/**			댓글				*/
	
	@Override
	public List<?> selectHomeKorAdminEducationProgramCommentList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.selectHomeKorAdminEducationProgramCommentList", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationProgramComment(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.insertHomeKorAdminEducationProgramComment", map);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramComment(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramComment", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramCommentList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramCommentList", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationProgramCommentMultipleList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationProgram_SQL.deleteHomeKorAdminEducationProgramCommentMultipleList", vo);
	}
}