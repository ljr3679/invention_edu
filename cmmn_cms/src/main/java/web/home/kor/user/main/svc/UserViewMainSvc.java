package web.home.kor.user.main.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface UserViewMainSvc {

	public List<?> selectUserMainVisualList(CommonVO vo) throws Exception;
	
	public EgovMap selectUserMainVideo(CommonVO vo) throws Exception;
	
	public List<?> selectUserMainPopupList(CommonVO vo) throws Exception;
	
	public EgovMap selectUserMainPopup(CommonVO vo) throws Exception;
	
	public List<?> selectUserMainPressList(CommonVO vo) throws Exception;
	
	public List<?> selectUserMainNoticeList(CommonVO vo) throws Exception;
	
	public List<?> selectUserMainNoticeAllList(CommonVO vo) throws Exception;
	
}
