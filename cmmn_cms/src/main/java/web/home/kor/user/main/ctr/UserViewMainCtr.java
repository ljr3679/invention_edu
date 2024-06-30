package web.home.kor.user.main.ctr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.data.StaticData;
import cms.enc.TextEncryptionService;
import cms.mapping.CMSMappingHandler;
import cms.tld.CustomTldFunctions;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.main.svc.UserViewMainSvc;

@Controller
public class UserViewMainCtr extends CMSMappingHandler {
	
	@Resource(name="userViewMainSvc")
	private UserViewMainSvc userViewMainSvc;
	

	@RequestMapping(value="/main.do")
	public void main(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		mainPopupSet(vo,model,request);
		mainVisualSet(vo,model,request);
		mainVideoSet(vo,model,request);
		selectUserMainPress(vo,model,request);
		selectUserMainNoticeAllList(vo,model,request);
		
		model.addAttribute("layout_option", "main");
	}
	
	private void mainVisualSet(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.HOMEPAGE_VISUAL_THUMBNAIL);
		List<?> visualList = userViewMainSvc.selectUserMainVisualList(vo);
		model.addAttribute("visualList", visualList);
	}
	
	private void mainVideoSet(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		model.addAttribute("fileList1", selectFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL1,"1"));
		model.addAttribute("fileList2", selectFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL2,"1"));
		model.addAttribute("fileList3", selectFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL3,"1"));
		EgovMap videoData = userViewMainSvc.selectUserMainVideo(vo);
		model.addAttribute("videoData", videoData);
	}
	
	private void mainPopupSet(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.HOMEPAGE_POPUP_THUMBNAIL);
		List<?> popupList = userViewMainSvc.selectUserMainPopupList(vo);
		model.addAttribute("popupList", popupList);
		vo.setSearchValue1("A");
		EgovMap popupAData = userViewMainSvc.selectUserMainPopup(vo);
		model.addAttribute("popupAData", popupAData);
		vo.setSearchValue1("B");
		EgovMap popupBData = userViewMainSvc.selectUserMainPopup(vo);
		model.addAttribute("popupBData", popupBData);
		
	}
	
	private void selectUserMainPress(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		List<?> pressList = userViewMainSvc.selectUserMainPressList(vo);
		model.addAttribute("pressList", pressList);
	}
	
	private void selectUserMainNoticeAllList(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		List<?> noticeAllList = userViewMainSvc.selectUserMainNoticeAllList(vo);
		model.addAttribute("noticeAllList", noticeAllList);
	}
	
	@RequestMapping(value="/notice_init.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject notice_init(
			@RequestParam(value="board_code", defaultValue="") String board_code,
			HttpServletRequest request
			) throws Exception {
		
		List<String> menuIdxList = StaticData.getInstance().getAllUserMenuIdxList("home_kor");
		
		JSONObject json = new JSONObject();
		try {
			CommonVO vo = new CommonVO();
			
			if(board_code.equals("0")) /*천제*/
				vo.setSearchValue1("");
			else if(board_code.equals("1")) /*[창의발명인재양성] - [직업계고 발명특허교육]*/	
				vo.setSearchValue1("584go9P5");
			/*[대회/전시/행사] - [학생창의력챔피언대회]*/
			else if(board_code.equals("2")) 
				vo.setSearchValue1("55ahFyCx");
			else if(board_code.equals("3")) /*[차세대영재기업인선발]*/ 
				vo.setSearchValue1("x26S2qpI");
			else if(board_code.equals("4")) /*[창의발명인재양성] - [IP-MeisterProgram]*/ 
				vo.setSearchValue1("87T63739");
			else if(board_code.equals("5")) /*[창의발명인재양성] - [YIP(청소년발명가프로그램)]*/
				vo.setSearchValue1("0Hoa86By");
			else if(board_code.equals("6")) /*[대회/전시/행사] - [발명교육대상]*/ 
				vo.setSearchValue1("OuOM32UM");
			else if(board_code.equals("7")) /*[대회/전시/행사] - [전국교원발명교육연구대회]*/ 
				vo.setSearchValue1("I61GX6jC");
			else if(board_code.equals("8")) /*[대회/전시/행사] - [대한민국 학생발명전시회]*/ 
				vo.setSearchValue1("12655iR5");
			else if(board_code.equals("9")) /*[지식재산기반 차세대영재기업인]*/ 
				vo.setSearchValue1("x26S2qpI");
			
			List<?> noticeList = userViewMainSvc.selectUserMainNoticeList(vo);
			
			List<EgovMap> menuList = null;
			for (int i = 0; i < noticeList.size(); i++) {
				EgovMap map = (EgovMap) noticeList.get(i);
	            Integer menuPos = CustomTldFunctions.arrIndexOf(menuIdxList, "menu"+map.get("menuNo"));
	            map.put("menuPos", menuPos);
	        }
			
			json.put("noticeList", noticeList);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	
}
