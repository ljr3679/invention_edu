package web.home.kor.user.totalSearch.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.totalSearch.svc.HomeKorUserTotalSearchSvc;

@Service("homeKorUserTotalSearchSvc")
public class HomeKorUserTotalSearchSvcImpl extends CommonServiceImpl implements HomeKorUserTotalSearchSvc{
	
	@Override
	public List<?> selectHomeKorUserTotalSearchList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserTotalSearch_SQL.selectHomeKorUserTotalSearchList", vo);
	}

	@Override
	public Integer selectHomeKorUserTotalSearchListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserTotalSearch_SQL.selectHomeKorUserTotalSearchListCnt", vo);
	}
}