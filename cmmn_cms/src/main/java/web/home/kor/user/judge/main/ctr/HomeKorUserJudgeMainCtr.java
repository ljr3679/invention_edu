package web.home.kor.user.judge.main.ctr;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.data.StaticData;
import cms.excel.ExcelContents;
import cms.excel.ExcelView;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.tld.CustomTldFunctions;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.inventor.meister.contact.svc.HomeKorUserInventorMeisterContactSvc;
import web.home.kor.user.judge.main.svc.HomeKorUserJudgeMainSvc;

@Controller
@RequestMapping(value="/judge/main/")
public class HomeKorUserJudgeMainCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserJudgeMainSvc")
	private HomeKorUserJudgeMainSvc homeKorUserJudgeMainSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getTabPos())) vo.setTabPos("A");
		if(stringUtil.isEmpty(vo.getSearchValue5())) vo.setSearchValue5("A");
		
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				vo.setPagingYn("Y");
				if(vo.getTabPos().equals("A"))
					vo.setSearchValue4("");
				if(vo.getTabPos().equals("B"))
					vo.setSearchValue4("85");
				if(vo.getTabPos().equals("C"))
					vo.setSearchValue4("86");
				if(vo.getTabPos().equals("D"))
					vo.setSearchValue4("87");
				if(vo.getTabPos().equals("E"))
					vo.setSearchValue4("88");
				if(vo.getTabPos().equals("F"))
					vo.setSearchValue4("143");
				vo.setIdentifier(FileConst.EVENT_INVENT_EXAM_DEPYU_THUMBNAIL);
				List<?> resultList = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMainList(vo);
				Integer totalCnt = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMainListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		if(vo.getUsr_idx() == "") {
			vo.setSystemMsg("로그인이 필요합니다.");
			vo.setRedirectPage("/home/kor/main.do");
		}else {
			vo.setIdx3(vo.getUsr_idx());
			EgovMap likedData = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMainLiked(vo);
			model.addAttribute("likedData", likedData);
			
			model.addAttribute("layout_option", "sub");
		}
		
	}
	
	@RequestMapping(value="detail.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject detail(
			@RequestParam(value="key", defaultValue="") String key,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(key)) {
			json.put("result", "400");
			json.put("msg", "키값이 누락되었습니다.");
			return json;
		}
		try {
			CommonVO vo = new CommonVO();
			vo.setIdentifier(FileConst.EVENT_INVENT_EXAM_THUMBNAIL);
			vo.setIdx(key);
			EgovMap resultData = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMain(vo);
			String content = CustomTldFunctions.removeTags((String) resultData.get("content"));
			resultData.put("content", content);
			/*Integer menuPos = CustomTldFunctions.arrIndexOf(menuIdxList, "menu"+map.get("menuNo"));*/
			/*Integer menuPos = CustomTldFunctions.arrIndexOf(menuIdxList, "menu"+map.get("menuNo"));*/
			json.put("resultData", resultData);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="like.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject like(
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="usrCode", defaultValue="") String usrCode,
			HttpServletRequest request
			) throws Exception { 
		JSONObject json = new JSONObject();
		
		/*if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		if(stringUtil.isEmpty(code)) {
			json.put("result", "400");
			json.put("msg", "키 값이 누락되었습니다.");
			return json;
		}*/
		try {
			CommonVO vo = new CommonVO();
			/*vo.setParamKey1(usrCode);*/
			vo.setIdx3(usrCode);
			vo.setIdx(code);
			
			Integer isLike = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMainIsLikeCnt(vo);
			if(isLike >= 1) {
				homeKorUserJudgeMainSvc.deleteHomeKorUserJudgeMainLike(vo);
				json.put("result", "201");
			} else if(isLike == 0) {
				homeKorUserJudgeMainSvc.deleteHomeKorUserJudgeMainLike(vo);
				homeKorUserJudgeMainSvc.insertHomeKorUserJudgeMainLike(vo);
				json.put("result", "200");
			}
			Integer likeCnt = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMainIsLikeCnt(vo);
			json.put("likeCnt", Integer.toString(likeCnt));
			
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		
		
		return json;
	}
	
	/*@RequestMapping(value="unlike.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject unlike(
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="usrCode", defaultValue="") String usrCode,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		if(stringUtil.isEmpty(code)) {
			json.put("result", "400");
			json.put("msg", "키 값이 누락되었습니다.");
			return json;
		}
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx(code);
			vo.setIdx2(usrCode);
			homeKorUserOperationMngEducationLectureSvc.deleteHomeKorUserOperationMngEducationLectureLike(vo);
			Integer likeCnt = homeKorUserOperationMngEducationLectureSvc.selectHomeKorUserOperationMngEducationLectureLikeCnt(vo);
			json.put("likeCnt", Integer.toString(likeCnt));
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}*/
	
	@RequestMapping(value="excelDownload.do", method=RequestMethod.POST)
	public void excelDownload(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletResponse response,
			HttpServletRequest request
			) throws Exception {
		
        String docName = URLEncoder.encode("공중심사 대상작 명단 엑셀리스트", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		//System.out.println("excel");
        vo.setPagingYn("N");
        /*vo.setSearchValue5("B");*/
		/*type*/
		vo.setIdentifier(FileConst.EVENT_INVENT_EXAM_DEPYU_THUMBNAIL); 
        final List<?> resultList = homeKorUserJudgeMainSvc.selectHomeKorUserJudgeMainList(vo);
        ExcelView excelView = new ExcelView(new ExcelContents() {
			
			@Override
			public void ExcelContentsSet(Sheet sheet, Row row, Cell cell, CellStyle headStyle, CellStyle bodyStyle)
					throws Exception {
				// TODO Auto-generated method stub
				int rowCnt = 1;
				int index = 0;
				/*List<?> categoryList = commonSvc.selectCategoryParentDataList("CkrH5290fT");*/
				for(EgovMap innerMap : (List<EgovMap>) resultList) {
					int cellCnt = 0;
					
					String yearName = String.valueOf(innerMap.get("yearName"));
					String regionName = String.valueOf(innerMap.get("regionName"));
					String typeName = String.valueOf(innerMap.get("typeName"));
					String regNo = String.valueOf(innerMap.get("regNo"));
					String title = String.valueOf(innerMap.get("title"));
					String invention = String.valueOf(innerMap.get("invention"));
					String inventionText = invention.replaceAll("\\<.*?\\>", "");
					String content = String.valueOf(innerMap.get("content"));
					String contentText = content.replaceAll("\\<.*?\\>", "");
					String regDate = String.valueOf(innerMap.get("regDate"));
					
					
					String[] values = 
						{
							yearName,
							regionName,
							typeName,
							regNo,
							title,
							inventionText,
							contentText,
							regDate
						};
					
					row = sheet.createRow(rowCnt++);
					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(resultList.size() - index++);
					
					for(String value : values) {
						cell = row.createCell(cellCnt++);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(!value.equals("") && !value.equals("null") ?value :"-");
					}
				}
			}
		});
        
        Map<String, Object> excelMap = new HashMap<String, Object>();
		excelMap.put("excel_th", Arrays.asList(new String[]{"No","년도","지역","구분","접수번호","발명명칭","발명동기","발명내용","등록일"}));
        excelView.render(excelMap, request, response);
	}
	
}