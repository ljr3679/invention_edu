package web.home.kor.user.award.festival2023.champion.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserAwardFestival2023ChampionSvc {

	public List<?> selectHomeKorUserAwardFestival2023ExhibitionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserAwardFestival2023ExhibitionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2023Exhibition(CommonVO vo) throws Exception;	
	
}
