package web.home.kor.user.gclass.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserGclassSvc {

	
	public List<?> selectUserGclassList(CommonVO vo) throws Exception;
	
	public List<?> selectUserGclassMonthList(CommonVO vo) throws Exception;
	
}
