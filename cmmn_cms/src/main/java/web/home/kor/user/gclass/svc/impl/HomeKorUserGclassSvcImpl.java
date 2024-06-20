package web.home.kor.user.gclass.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.gclass.svc.HomeKorUserGclassSvc;
import web.home.kor.user.totalSearch.svc.HomeKorUserTotalSearchSvc;

@Service("homeKorUserGclassSvc")
public class HomeKorUserGclassSvcImpl extends CommonServiceImpl implements HomeKorUserGclassSvc {

	
	@Override
	public List<?> selectUserGclassList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserGclass_SQL.selectUserGclassList", vo);
	}	
	
	@Override
	public List<?> selectUserGclassMonthList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserGclass_SQL.selectUserGclassMonthList", vo);
	}		
	
}
