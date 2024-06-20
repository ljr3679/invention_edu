package web.home.kor.user.totalSearch.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserTotalSearchSvc {

	public List<?> selectHomeKorUserTotalSearchList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserTotalSearchListCnt(CommonVO vo) throws Exception;
}
