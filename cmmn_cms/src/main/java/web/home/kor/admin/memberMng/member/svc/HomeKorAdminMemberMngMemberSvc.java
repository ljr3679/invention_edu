package web.home.kor.admin.memberMng.member.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminMemberMngMemberSvc {

	public List<?> selectMemberDataList(CommonVO vo) throws Exception;
	
	public Integer selectMemberDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectMemberData(CommonVO vo) throws Exception;
}
