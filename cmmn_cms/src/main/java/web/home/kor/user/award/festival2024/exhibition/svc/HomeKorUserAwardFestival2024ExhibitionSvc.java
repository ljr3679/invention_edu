package web.home.kor.user.award.festival2024.exhibition.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserAwardFestival2024ExhibitionSvc {

	public List<?> selectHomeKorUserAwardFestival2024ExhibitionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserAwardFestival2024ExhibitionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2024ExhibitionBasicData(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2024Exhibition(CommonVO vo) throws Exception;	
	
}
