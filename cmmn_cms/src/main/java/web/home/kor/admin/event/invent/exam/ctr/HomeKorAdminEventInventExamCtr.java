package web.home.kor.admin.event.invent.exam.ctr;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.excel.ExcelContents;
import cms.excel.ExcelView;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.event.invent.exam.svc.HomeKorAdminEventInventExamSvc;

@Controller
@RequestMapping(value="/event/invent/exam/")
public class HomeKorAdminEventInventExamCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEventInventExamSvc")
	private HomeKorAdminEventInventExamSvc homeKorAdminEventInventExamSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getSearchValue5())) vo.setSearchValue5("A");
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				vo.setPagingYn("Y");
				List<?> resultList = homeKorAdminEventInventExamSvc.selectHomeKorAdminEventInventExamList(vo);
				Integer totalCnt = homeKorAdminEventInventExamSvc.selectHomeKorAdminEventInventExamListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> region = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("region", region);
		List<?> year = commonSvc.selectCategoryParentDataList("C4EvWU5dHT");
		model.addAttribute("year", year);
		List<?> type = commonSvc.selectCategoryParentDataList("CpF1M7T17T");
		model.addAttribute("type", type);
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> region = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("region", region);
		List<?> year = commonSvc.selectCategoryParentDataList("C4EvWU5dHT");
		model.addAttribute("year", year);
		List<?> type = commonSvc.selectCategoryParentDataList("CpF1M7T17T");
		model.addAttribute("type", type);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.EVENT_INVENT_EXAM_THUMBNAIL,vo.getIdx()));
			model.addAttribute("fileList2", selectFileData(FileConst.EVENT_INVENT_EXAM_DEPYU_THUMBNAIL,vo.getIdx()));
			EgovMap resultData = homeKorAdminEventInventExamSvc.selectHomeKorAdminEventInventExam(vo);
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				/*vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));*/
				homeKorAdminEventInventExamSvc.insertHomeKorAdminEventInventExam(vo);
				insertFileData(FileConst.EVENT_INVENT_EXAM_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EVENT_INVENT_EXAM_DEPYU_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEventInventExamSvc.updateHomeKorAdminEventInventExam(vo);
				removeFileData(vo);
				insertFileData(FileConst.EVENT_INVENT_EXAM_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EVENT_INVENT_EXAM_DEPYU_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEventInventExamSvc.deleteHomeKorAdminEventInventExam(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEventInventExamSvc.deleteHomeKorAdminEventInventExamList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
	@RequestMapping(value="excelDownload.do", method=RequestMethod.POST)
	public void excelDownload(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletResponse response,
			HttpServletRequest request
			) throws Exception {
		
        String docName = URLEncoder.encode("공중심사 엑셀리스트", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		//System.out.println("excel");
        vo.setPagingYn("N");
        vo.setSearchValue5("B");
        /*year*/
		vo.setIdentifier("Ce6WL4s6pT"); 
		/*region*/
		vo.setIdentifier2("C4EvWU5dHT"); 
		/*type*/
		vo.setIdentifier3("CpF1M7T17T"); 
        final List<?> resultList = homeKorAdminEventInventExamSvc.selectHomeKorAdminEventInventExamList(vo);
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
					String likeCnt = String.valueOf(innerMap.get("likeCnt"));
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
							likeCnt,
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
		excelMap.put("excel_th", Arrays.asList(new String[]{"No","년도","지역","구분","접수번호","발명명칭","발명동기","발명내용","좋아요 개수","등록일"}));
        excelView.render(excelMap, request, response);
	}
}