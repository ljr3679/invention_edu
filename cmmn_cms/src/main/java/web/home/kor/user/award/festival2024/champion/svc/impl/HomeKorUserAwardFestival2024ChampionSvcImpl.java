package web.home.kor.user.award.festival2024.champion.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.award.festival2024.champion.svc.HomeKorUserAwardFestival2024ChampionSvc;

@Service("homeKorUserAwardFestival2024ChampionSvc")
public class HomeKorUserAwardFestival2024ChampionSvcImpl extends CommonServiceImpl implements HomeKorUserAwardFestival2024ChampionSvc {

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
	public EgovMap selectHomeKorUserAwardFestival2024Exhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2024Exhibition_SQL.selectHomeKorUserAwardFestival2024Exhibition", vo);
	}	
	
}
