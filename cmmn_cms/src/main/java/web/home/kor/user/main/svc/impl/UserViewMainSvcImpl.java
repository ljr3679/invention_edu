package web.home.kor.user.main.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.main.svc.UserViewMainSvc;

@Service("userViewMainSvc")
public class UserViewMainSvcImpl extends CommonServiceImpl implements UserViewMainSvc {
	
	@Override
	public List<?> selectUserMainVisualList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainVisualList", vo);
	}
	
	@Override
	public EgovMap selectUserMainVideo(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainVideo", vo);
	}
	
	@Override
	public List<?> selectUserMainPopupList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainPopupList", vo);
	}
	
	@Override
	public EgovMap selectUserMainPopup(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainPopup", vo);
	}
	
	@Override
	public List<?> selectUserMainPressList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainPressList", vo);
	}
	
	@Override
	public List<?> selectUserMainNoticeList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainNoticeList", vo);
	}
	
	@Override
	public List<?> selectUserMainNoticeAllList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserMain_SQL.selectUserMainNoticeAllList", vo);
	}
	
}
