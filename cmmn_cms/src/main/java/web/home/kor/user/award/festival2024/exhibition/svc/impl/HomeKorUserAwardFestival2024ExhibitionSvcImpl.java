package web.home.kor.user.award.festival2024.exhibition.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.award.festival2024.exhibition.svc.HomeKorUserAwardFestival2024ExhibitionSvc;

@Service("homeKorUserAwardFestival2024ExhibitionSvc")
public class HomeKorUserAwardFestival2024ExhibitionSvcImpl extends CommonServiceImpl implements HomeKorUserAwardFestival2024ExhibitionSvc {

	@Override
	public List<?> selectHomeKorUserAwardFestival2024ExhibitionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserAwardFestival2024Exhibition_SQL.selectHomeKorUserAwardFestival2024ExhibitionList", vo);
	}

	@Override
	public Integer selectHomeKorUserAwardFestival2024ExhibitionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserAwardFestival2024Exhibition_SQL.selectHomeKorUserAwardFestival2024ExhibitionListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorUserAwardFestival2024ExhibitionBasicData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2024Exhibition_SQL.selectHomeKorUserAwardFestival2024ExhibitionBasicData", vo);
	}

	@Override
	public EgovMap selectHomeKorUserAwardFestival2024Exhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2024Exhibition_SQL.selectHomeKorUserAwardFestival2024Exhibition", vo);
	}	
	
}
