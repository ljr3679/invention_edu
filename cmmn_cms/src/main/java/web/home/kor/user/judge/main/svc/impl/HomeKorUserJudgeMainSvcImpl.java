package web.home.kor.user.judge.main.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.judge.main.svc.HomeKorUserJudgeMainSvc;

@Service("homeKorUserJudgeMainSvc")
public class HomeKorUserJudgeMainSvcImpl extends CommonServiceImpl implements HomeKorUserJudgeMainSvc{
	
	@Override
	public List<?> selectHomeKorUserJudgeMainList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.selectHomeKorUserJudgeMainList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserJudgeMainListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.selectHomeKorUserJudgeMainListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorUserJudgeMain(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.selectHomeKorUserJudgeMain", vo);
	}

	@Override
	public Integer selectHomeKorUserJudgeMainLikeListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.selectHomeKorUserJudgeMainLikeListCnt", vo);
	}

	@Override
	public Integer selectHomeKorUserJudgeMainIsLikeCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.selectHomeKorUserJudgeMainIsLikeCnt", vo);
	}

	@Override
	public void insertHomeKorUserJudgeMainLike(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.insertHomeKorUserJudgeMainLike", vo);
	}

	@Override
	public void deleteHomeKorUserJudgeMainLike(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.deleteHomeKorUserJudgeMainLike", vo);
	}
	@Override
	public EgovMap selectHomeKorUserJudgeMainLiked(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserJudgeMain_SQL.selectHomeKorUserJudgeMainLiked", vo);
	}
	
}