package cms.site.board.ctr;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.board.svc.CMSBoardSvc;
import cms.util.Logs;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CMSBoardCtr extends CMSMappingHandler {
	
	@Resource(name="CMSBoardSvc")
	private CMSBoardSvc CMSBoardSvc;

	@RequestMapping(value="/{depth1}/{depth2}/board.do")
	public String board(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		String uri = request.getRequestURI();
		String pathAuthority = "";
		EgovMap menu = null;
		
		if(uri.contains("/cmsManager/")) {
			EgovMap admSession = (EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			menu = (EgovMap) admSession.get("menu");
			vo.setAccess("A");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			pathAuthority = "admin";
		} else {
			EgovMap menuSession = (EgovMap) request.getSession().getAttribute(Const.USER_MENU_SET);
			menu = (EgovMap) menuSession.get("menu");
			vo.setAccess("U");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			pathAuthority = "user";
		}
		
		EgovMap boardData = this.boardListDataSet(vo, model);
		
		return String.format("cms/board/%s/%s/%s", pathAuthority, String.valueOf(boardData.get("boardSkin")), String.valueOf(menu.get("skin")));
	}
	
	@RequestMapping(value="/{depth1}/{depth2}/board.do", params="act")
	public String boardEdit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		String uri = request.getRequestURI();
		String pathAuthority = "";
		EgovMap menu = null;
		
		if(uri.contains("/cmsManager/")) {
			EgovMap admSession = (EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			menu = (EgovMap) admSession.get("menu");
			vo.setAccess("A");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			pathAuthority = "admin";
		} else {
			EgovMap menuSession = (EgovMap) request.getSession().getAttribute(Const.USER_MENU_SET);
			menu = (EgovMap) menuSession.get("menu");
			vo.setAccess("U");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			pathAuthority = "user";
		}
		
		List<?> noticeBoardList = CMSBoardSvc.selectCMSNoticeBoardList(vo);
		model.addAttribute("noticeBoardList", noticeBoardList);		
		
		EgovMap boardData = null;
		switch (vo.getAct()) {
		case "regist":
		case "modify":
			boardData = this.boardEditDataSet(vo, model);
			break;
		case "detail":
			boardData = this.boardDetailDataSet(vo, model);
			break;
		default:
			break;
		}
		
		return String.format("cms/board/%s/%s/%s", pathAuthority, String.valueOf(boardData.get("boardSkin")), String.valueOf(menu.get("skin")+(vo.getAct().equals("detail") ?"_detail" :"_edit")));
	}
	
	@RequestMapping(value="/{depth1}/{depth2}/board_edit.act")
	public void boardAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		String uri = request.getRequestURI();
		JSONObject params = searchDataToJson(vo);
		String returnURL = "";
		
		EgovMap menu = null;
		
		if(uri.contains("/cmsManager/")) {
			EgovMap admSession = (EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			menu = (EgovMap) admSession.get("menu");
			vo.setAccess("A");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			returnURL = "/cmsManager/cms/board.do";
		} else {
			EgovMap menuSession = (EgovMap) request.getSession().getAttribute(Const.USER_MENU_SET);
			menu = (EgovMap) menuSession.get("menu");
			vo.setAccess("U");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			returnURL = String.format("/%s/%s/%s", vo.getSiteCode(), vo.getLangCode(), "board.do");
		}
		
		switch (vo.getAct()) {
			case "regist":
				if(stringUtil.isNotEmpty(vo.getParamKey34())) vo.setParamKey34(encryptModule.encryptSHA256(vo.getParamKey34()));
				CMSBoardSvc.insertCMSBoardData(vo);
				vo.setTitle("");
				insertFileData(FileConst.CMS_BOARD_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.CMS_BOARD_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "0");
				break;
			case "modify":
				if(stringUtil.isNotEmpty(vo.getParamKey34())) vo.setParamKey34(encryptModule.encryptSHA256(vo.getParamKey34()));
				CMSBoardSvc.updateCMSBoardData(vo);
				vo.setTitle("");
				removeFileData(vo);
				insertFileData(FileConst.CMS_BOARD_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.CMS_BOARD_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "1");
				
				if(vo.getAct2().equals("detail")) {
					params.put("idx", vo.getIdx());
					params.put("act", "detail");
				}
				break;
			case "delete":
				removeFileData(vo);
				CMSBoardSvc.deleteCMSBoardData(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		Optional.of(uri).filter(param -> !param.contains("/cmsManager/")).ifPresent(param -> model.addAttribute("method", "get"));
		model.addAttribute("params", params);
		model.addAttribute("returnURL", returnURL);
	}
	
	public EgovMap boardListDataSet(CommonVO vo, ModelMap model) throws Exception {
		vo.setIdentifier(FileConst.CMS_BOARD_ATTACH);
		vo.setIdentifier2(FileConst.CMS_BOARD_THUMBNAIL);
		EgovMap boardData = CMSBoardSvc.selectCMSBoardConfigData(vo);
		String categoryField1 = String.valueOf(boardData.get("categoryField1"));
		String categoryField2 = String.valueOf(boardData.get("categoryField2"));
		String categoryField3 = String.valueOf(boardData.get("categoryField3"));
		String categoryField4 = String.valueOf(boardData.get("categoryField4"));
		
		String categoryField1Option = String.valueOf(boardData.get("categoryField1Option"));
		String categoryField2Option = String.valueOf(boardData.get("categoryField2Option"));
		String categoryField3Option = String.valueOf(boardData.get("categoryField3Option"));
		String categoryField4Option = String.valueOf(boardData.get("categoryField4Option"));
		
		if(stringUtil.isNotEmpty(categoryField1)) {
			vo.setIdx3(categoryField1);
			List<?> categoryList1 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList1", categoryList1);
		}
		if(stringUtil.isNotEmpty(categoryField2)) {
			vo.setIdx3(categoryField2);
			List<?> categoryList2 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList2", categoryList2);
		}
		if(stringUtil.isNotEmpty(categoryField3)) {
			vo.setIdx3(categoryField3);
			List<?> categoryList3 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList3", categoryList3);
		}
		if(stringUtil.isNotEmpty(categoryField4)) {
			vo.setIdx3(categoryField4);
			List<?> categoryList4 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList4", categoryList4);
		}
		
		String searchAt = Optional.ofNullable(boardData.get("searchAt")).map(String::valueOf).orElse("N");
		if(searchAt.equals("Y")) {
			List<String> listSearchField = stringUtil.stringToArr(String.valueOf(boardData.get("listSearchField")), Const.SITE_SEPERATOR);
			List<String> listSearchTitle = stringUtil.stringToArr(String.valueOf(boardData.get("listSearchTitle")), Const.SITE_SEPERATOR);
			
			List<String> listSearchFieldOption = new ArrayList<>();
			listSearchFieldOption.add(categoryField1Option);
			listSearchFieldOption.add(categoryField2Option);
			listSearchFieldOption.add(categoryField3Option);
			listSearchFieldOption.add(categoryField4Option);
			
			List<Map> textSearch = new ArrayList<Map>();
			List<Map> dateSearch = new ArrayList<Map>();
			List<Map> categorySearch = new ArrayList<Map>();
			EgovMap innerMap = null;
			for(int i=0; i<listSearchField.size(); i++) {
				String searchField = listSearchField.get(i);
				String searchTitle = listSearchTitle.get(i);
				innerMap = new EgovMap();
				innerMap.put("field", searchField);
				innerMap.put("title", searchTitle);
				
				if(searchField.indexOf("title") != -1 || searchField.indexOf("register") != -1 || searchField.indexOf("textField") != -1 || searchField.indexOf("textareaField") != -1) textSearch.add(innerMap);
				else if(searchField.indexOf("dateField") != -1 || searchField.indexOf("dateArrayField") != -1) dateSearch.add(innerMap);
				else if(searchField.indexOf("categoryField") != -1) {
					String num = searchField.substring(13, searchField.length());
					innerMap.put("option", listSearchFieldOption.get(Integer.parseInt(num)-1));

					categorySearch.add(innerMap);
				}
				else if(searchField.equals("useAt")) model.addAttribute("searchUseAt", "Y");
			}
			
			vo.setSearchValueList1(textSearch);
			model.addAttribute("textSearch", textSearch);
			model.addAttribute("dateSearch", dateSearch);
			model.addAttribute("categorySearch", categorySearch);
		}
		
		List<String> listViewFields = stringUtil.stringToArr(String.valueOf(boardData.get("listViewField")), Const.SITE_SEPERATOR);
		boardData.put("listViewFields", listViewFields);
		boardData.put("listViewTitles", stringUtil.stringToArr(String.valueOf(boardData.get("listViewTitle")), Const.SITE_SEPERATOR));
		boardData.put("listViewPercents", stringUtil.stringToArr(String.valueOf(boardData.get("listViewPercent")), Const.SITE_SEPERATOR));
		boardData.put("listViewClasses", stringUtil.stringToArr(String.valueOf(boardData.get("listViewClass")), Const.SITE_SEPERATOR));
		
		String pagingAt = Optional.ofNullable(boardData.get("pagingAt")).map(String::valueOf).orElse("N");
		vo.setPagingAt(pagingAt);
		
		switch (pagingAt) {
			case "Y":
				int pagingCnt = Optional.ofNullable(boardData.get("pagingCnt")).map(String::valueOf).map(Integer::parseInt).orElse(20); 
				setPaging(vo, model, new PagingDataInterface() {
					
					@Override
					public Object[] callData() throws Exception {
						// TODO Auto-generated method stub
						List<EgovMap> resultList = (List<EgovMap>) CMSBoardSvc.selectCMSBoardDataList(vo);
						for(EgovMap map : resultList) {
							for(String field : listViewFields) {
								if(field.indexOf("textareaField") != -1) map.put(field, stringUtil.removeHttpTag(String.valueOf(map.get(field))));
							}
						}
						Integer totalCnt = CMSBoardSvc.selectCMSBoardDataListCnt(vo);
						return new Object[]{resultList, totalCnt};
					}
				}, pagingCnt, 10);		
				break;
			case "N":
				List<EgovMap> resultList = (List<EgovMap>) CMSBoardSvc.selectCMSBoardDataList(vo);
				for(EgovMap map : resultList) {
					for(String field : listViewFields) {
						if(field.indexOf("textareaField") != -1) map.put(field, stringUtil.removeHttpTag(String.valueOf(map.get(field))));
					}
				}
				model.addAttribute("resultList", resultList);
				break;
			default:
				break;
		}
		
		model.addAttribute("boardData", boardData);
		
		return boardData;
	}
	
	public EgovMap boardEditDataSet(CommonVO vo, ModelMap model) throws Exception {
		EgovMap boardData = CMSBoardSvc.selectCMSBoardConfigData(vo);
		String categoryField1 = String.valueOf(boardData.get("categoryField1"));
		String categoryField2 = String.valueOf(boardData.get("categoryField2"));
		String categoryField3 = String.valueOf(boardData.get("categoryField3"));
		String categoryField4 = String.valueOf(boardData.get("categoryField4"));
		
		if(stringUtil.isNotEmpty(categoryField1)) {
			vo.setIdx3(categoryField1);
			List<?> categoryList1 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList1", categoryList1);
		}
		if(stringUtil.isNotEmpty(categoryField2)) {
			vo.setIdx3(categoryField2);
			List<?> categoryList2 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList2", categoryList2);
		}
		if(stringUtil.isNotEmpty(categoryField3)) {
			vo.setIdx3(categoryField3);
			List<?> categoryList3 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList3", categoryList3);
		}
		if(stringUtil.isNotEmpty(categoryField4)) {
			vo.setIdx3(categoryField4);
			List<?> categoryList4 = CMSBoardSvc.selectCategoryDataList(vo);
			model.addAttribute("categoryList4", categoryList4);
		}
		
		boardData.put("listFields", stringUtil.stringToArr(String.valueOf(boardData.get("listField")), Const.SITE_SEPERATOR));
		boardData.put("listTitles", stringUtil.stringToArr(String.valueOf(boardData.get("listTitle")), Const.SITE_SEPERATOR));
		boardData.put("listValis", stringUtil.stringToArr(String.valueOf(boardData.get("listVali")), Const.SITE_SEPERATOR));
		
		if(vo.getAct().equals("modify")) {
			List<String> listSearchField = stringUtil.stringToArr(String.valueOf(boardData.get("listSearchField")), Const.SITE_SEPERATOR);
			List<Map> textSearch = new ArrayList<Map>();
			EgovMap innerMap = null;
			for(int i=0; i<listSearchField.size(); i++) {
				String searchField = listSearchField.get(i);
				innerMap = new EgovMap();
				innerMap.put("field", searchField);
				
				if(searchField.indexOf("title") != -1 || searchField.indexOf("register") != -1 || searchField.indexOf("textField") != -1 || searchField.indexOf("textareaField") != -1) textSearch.add(innerMap);
			}
			vo.setSearchValueList1(textSearch);
			
			EgovMap resultData = CMSBoardSvc.selectCMSBoardData(vo);
			model.addAttribute("fileList", selectFileData(FileConst.CMS_BOARD_ATTACH, String.valueOf(resultData.get("no"))));
			model.addAttribute("fileThumbnailList", selectFileData(FileConst.CMS_BOARD_THUMBNAIL, String.valueOf(resultData.get("no"))));
			model.addAttribute("resultData", resultData);
		}
		
		model.addAttribute("boardData", boardData);
		
		return boardData;
	}
	
	public EgovMap boardDetailDataSet(CommonVO vo, ModelMap model) throws Exception {
		EgovMap boardData = CMSBoardSvc.selectCMSBoardConfigData(vo);
		
		List<String> listFields = stringUtil.stringToArr(String.valueOf(boardData.get("listField")), Const.SITE_SEPERATOR);
		List<String> listTitles = stringUtil.stringToArr(String.valueOf(boardData.get("listTitle")), Const.SITE_SEPERATOR);
		List<Map> topFields = new ArrayList<Map>();
		List<Map> bottomFields = new ArrayList<Map>();
		
		EgovMap innerMap = null;
		for(int i=0; i<listFields.size(); i++) {
			String listField = listFields.get(i);
			String listTitle = listTitles.get(i);
			innerMap = new EgovMap();
			innerMap.put("field", listField);
			innerMap.put("title", listTitle);
			
			if(listField.indexOf("textField") != -1 || listField.indexOf("dateField") != -1 || listField.indexOf("dateArrayField") != -1 || listField.indexOf("categoryField") != -1) topFields.add(innerMap);
			else if(listField.indexOf("textareaField") != -1) bottomFields.add(innerMap);
		}
		model.addAttribute("topFields", topFields);
		model.addAttribute("bottomFields", bottomFields);
		
		List<String> listSearchField = stringUtil.stringToArr(String.valueOf(boardData.get("listSearchField")), Const.SITE_SEPERATOR);
		List<Map> textSearch = new ArrayList<Map>();
		innerMap = null;
		for(int i=0; i<listSearchField.size(); i++) {
			String searchField = listSearchField.get(i);
			innerMap = new EgovMap();
			innerMap.put("field", searchField);
			
			if(searchField.indexOf("title") != -1 || searchField.indexOf("register") != -1 || searchField.indexOf("textField") != -1 || searchField.indexOf("textareaField") != -1) textSearch.add(innerMap);
		}
		vo.setSearchValueList1(textSearch);
		
		EgovMap resultData = CMSBoardSvc.selectCMSBoardData(vo);
		model.addAttribute("fileList", selectFileData(FileConst.CMS_BOARD_ATTACH, String.valueOf(resultData.get("no"))));
		model.addAttribute("fileThumbnailList", selectFileData(FileConst.CMS_BOARD_THUMBNAIL, String.valueOf(resultData.get("no"))));
		model.addAttribute("resultData", resultData);
		
		model.addAttribute("boardData", boardData);
		
		return boardData;
	}
	
}
