package web.home.kor.user.award.festival2024.champion.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserAwardFestival2024ChampionSvc {

	public List<?> selectHomeKorUserAwardFestival2024ExhibitionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserAwardFestival2024ExhibitionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2024Exhibition(CommonVO vo) throws Exception;	
	
}
