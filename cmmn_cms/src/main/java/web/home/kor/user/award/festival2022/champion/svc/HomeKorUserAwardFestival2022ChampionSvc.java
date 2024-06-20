package web.home.kor.user.award.festival2022.champion.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserAwardFestival2022ChampionSvc {
	
	public List<?> selectHomeKorUserAwardFestival2022ExhibitionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserAwardFestival2022ExhibitionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2022Exhibition(CommonVO vo) throws Exception;
}
