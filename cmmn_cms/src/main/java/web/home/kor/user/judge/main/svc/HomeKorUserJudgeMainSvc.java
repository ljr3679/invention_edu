package web.home.kor.user.judge.main.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserJudgeMainSvc {
		
	public List<?> selectHomeKorUserJudgeMainList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserJudgeMainListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserJudgeMain(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserJudgeMainLikeListCnt(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserJudgeMainIsLikeCnt(CommonVO vo) throws Exception;
	
	public void insertHomeKorUserJudgeMainLike(CommonVO vo) throws Exception;
	
	public void deleteHomeKorUserJudgeMainLike(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserJudgeMainLiked(CommonVO vo) throws Exception;
}
