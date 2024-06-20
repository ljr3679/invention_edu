package web.home.kor.user.award.festival2021.exhibition.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserAwardFestival2021ExhibitionSvc {

public List<?> selectHomeKorUserAwardFestival2021ExhibitionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserAwardFestival2021ExhibitionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2021ExhibitionBasicData(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorUserAwardFestival2021Exhibition(CommonVO vo) throws Exception;
}
