package web.home.kor.admin.memberMng.member.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.memberMng.member.svc.HomeKorAdminMemberMngMemberSvc;

@Service("homeKorAdminMemberMngMemberSvc")
public class HomeKorAdminMemberMngMemberSvcImpl extends CommonServiceImpl implements HomeKorAdminMemberMngMemberSvc {
	
	@Override
	public List<?> selectMemberDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngMember_SQL.selectMemberDataList", vo);
	}

	@Override
	public Integer selectMemberDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorAdminMemberMngMember_SQL.selectMemberDataListCnt", vo);
	}

	@Override
	public EgovMap selectMemberData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminMemberMngMember_SQL.selectMemberData", vo);
	}

}