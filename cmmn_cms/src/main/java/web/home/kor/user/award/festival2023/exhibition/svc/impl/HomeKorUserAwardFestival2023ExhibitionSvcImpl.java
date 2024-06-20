package web.home.kor.user.award.festival2023.exhibition.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.award.festival2023.exhibition.svc.HomeKorUserAwardFestival2023ExhibitionSvc;

@Service("homeKorUserAwardFestival2023ExhibitionSvc")
public class HomeKorUserAwardFestival2023ExhibitionSvcImpl extends CommonServiceImpl implements HomeKorUserAwardFestival2023ExhibitionSvc {

	@Override
	public List<?> selectHomeKorUserAwardFestival2023ExhibitionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserAwardFestival2023Exhibition_SQL.selectHomeKorUserAwardFestival2023ExhibitionList", vo);
	}

	@Override
	public Integer selectHomeKorUserAwardFestival2023ExhibitionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserAwardFestival2023Exhibition_SQL.selectHomeKorUserAwardFestival2023ExhibitionListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorUserAwardFestival2023ExhibitionBasicData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2023Exhibition_SQL.selectHomeKorUserAwardFestival2023ExhibitionBasicData", vo);
	}

	@Override
	public EgovMap selectHomeKorUserAwardFestival2023Exhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2023Exhibition_SQL.selectHomeKorUserAwardFestival2023Exhibition", vo);
	}	
	
}
