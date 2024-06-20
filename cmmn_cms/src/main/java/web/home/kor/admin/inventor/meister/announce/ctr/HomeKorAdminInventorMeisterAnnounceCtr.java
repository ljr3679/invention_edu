package web.home.kor.admin.inventor.meister.announce.ctr;

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
import web.home.kor.admin.inventor.meister.announce.svc.HomeKorAdminInventorMeisterAnnounceSvc;

@Controller
@RequestMapping(value="/inventor/meister/announce/")
public class HomeKorAdminInventorMeisterAnnounceCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminInventorMeisterAnnounceSvc")
	private HomeKorAdminInventorMeisterAnnounceSvc homeKorAdminInventorMeisterAnnounceSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounceList(vo);
				Integer totalCnt = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounceListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> type = commonSvc.selectCategoryParentDataList("C0D442890T");
		model.addAttribute("type", type);
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getTabPos())) vo.setTabPos("A");
		switch(vo.getTabPos()) {
		case "A":
			List<?> type = commonSvc.selectCategoryParentDataList("C0D442890T");
			model.addAttribute("type", type);
			List<?> year = commonSvc.selectCategoryParentDataList("C4EvWU5dHT");
			model.addAttribute("year", year);
			if(stringUtil.isNotEmpty(vo.getIdx())) {
				model.addAttribute("fileList1", selectFileData(FileConst.INVENTOR_MEISTER_ANNOUNCE_ATTACH,vo.getIdx()));
				EgovMap resultData = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounce(vo);
				model.addAttribute("resultData", resultData);
			}
			break;
		case "B":
			setPaging2(vo, model, new PagingDataInterface() {
				
				@Override
				public Object[] callData() throws Exception {
					// TODO Auto-generated method stub
					List<?> resultList2 = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounceApplyList(vo);
					Integer totalCnt2 = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounceApplyListCnt(vo);
					return new Object[] {resultList2, totalCnt2};
				}
			});
			break;
		default:
			break;
		}
	}
	
	@RequestMapping(value="edit2.do")
	public void edit2(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx2())) {
			EgovMap resultData2 = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounceApply(vo);
			model.addAttribute("resultData2", resultData2);
			model.addAttribute("fileList1", selectFileData(FileConst.MEISTER_ANNOUNCE_ATTACH1,vo.getIdx2()));
			model.addAttribute("fileList2", selectFileData(FileConst.MEISTER_ANNOUNCE_ATTACH2,vo.getIdx2()));
		}
	}
	
	@RequestMapping(value="edit2.act")
	public void editAct2(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setPagingYn("Y");
		homeKorAdminInventorMeisterAnnounceSvc.updateHomeKorAdminInventorMeisterAnnounceApply(vo);
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"edit.do?idx="+vo.getIdx()+"&tabPos="+vo.getTabPos());
	}
		
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				homeKorAdminInventorMeisterAnnounceSvc.insertHomeKorAdminInventorMeisterAnnounce(vo);
				/*Date startDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse("2020-08-11 09:11:03");
				Date endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse("2020-08-11 09:11:03");
				vo.setParamKey5(startDate);
				vo.setParamKey6(endDate);*/
				insertFileData(FileConst.INVENTOR_MEISTER_ANNOUNCE_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminInventorMeisterAnnounceSvc.updateHomeKorAdminInventorMeisterAnnounce(vo);
				removeFileData(vo);
				insertFileData(FileConst.INVENTOR_MEISTER_ANNOUNCE_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminInventorMeisterAnnounceSvc.deleteHomeKorAdminInventorMeisterAnnounce(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminInventorMeisterAnnounceSvc.deleteHomeKorAdminInventorMeisterAnnounceList(vo);
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
		
        String docName = URLEncoder.encode("대회공고 접수현황 엑셀리스트", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		
        vo.setPagingYn("N");
        final List<?> resultList = homeKorAdminInventorMeisterAnnounceSvc.selectHomeKorAdminInventorMeisterAnnounceApplyList(vo);
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
					
					String useAt = String.valueOf(innerMap.get("useAt"));
					String useAtText = "";
					switch (useAt) {
						case "A": useAtText = "접수완료"; break;
						case "B": useAtText = "접수취소"; break;
						default:
							break;
					}
					
					String title = String.valueOf(innerMap.get("title"));
					String startDate = String.valueOf(innerMap.get("startDate"));
					String endDate = String.valueOf(innerMap.get("endDate"));
					String applyNumber = String.valueOf(innerMap.get("applyNumber"));
					String ideaName = String.valueOf(innerMap.get("ideaName"));
					String teamName = String.valueOf(innerMap.get("teamName"));
					
					String ideaGubun = String.valueOf(innerMap.get("ideaGubun"));
					String ideaGubunText = "";
					switch (ideaGubun) {
						case "A": ideaGubunText = "자유과제"; break;
						case "B": ideaGubunText = "전문교과과제"; break;
						case "C": ideaGubunText = "협력기업과제"; break;
						case "D": ideaGubunText = "테마과제"; break;
						default:
							break;
					}
					String school = String.valueOf(innerMap.get("school"));
					
					String schoolType = String.valueOf(innerMap.get("schoolType"));
					String schoolTypeText = "";
					switch (schoolType) {
						case "A": schoolTypeText = "특성화고"; break;
						case "B": schoolTypeText = "마이스터고"; break;
						default:
							break;
					}
					
					String zipCode = String.valueOf(innerMap.get("zipCode"));
					String address = String.valueOf(innerMap.get("address"));
					String addressDetail = String.valueOf(innerMap.get("addressDetail"));
					
					/*팀원1*/
					String teamUserName1 = String.valueOf(innerMap.get("teamUserName1"));
					String teamUserBirthDay1 = String.valueOf(innerMap.get("teamUserBirthDay1"));
					String teamUserGrade1 = String.valueOf(innerMap.get("teamUserGrade1"));
					String teamUserSex1 = String.valueOf(innerMap.get("teamUserSex1"));
					String teamUserSex1Text = "";
					switch (teamUserSex1) {
						case "M": teamUserSex1Text = "남자"; break;
						case "F": teamUserSex1Text = "여자"; break;
						default:
							break;
					}
					String teamUserPhone1 = "-";
					if( !String.valueOf(innerMap.get("teamUserPhone1")).equals("") && !String.valueOf(innerMap.get("teamUserPhone1")).equals("null") ) {
						teamUserPhone1 = encryptModule.decryptAREA(String.valueOf(innerMap.get("teamUserPhone1")));
					}	
					
					String teamUserEmail1 = "-";
					if( !String.valueOf(innerMap.get("teamUserEmail1")).equals("") && !String.valueOf(innerMap.get("teamUserEmail1")).equals("null") ) {
						teamUserEmail1 = encryptModule.decryptAREA(String.valueOf(innerMap.get("teamUserEmail1")));
					}
					
					/*팀원2*/
					String teamUserName2 = String.valueOf(innerMap.get("teamUserName2"));
					String teamUserBirthDay2 = String.valueOf(innerMap.get("teamUserBirthDay2"));
					String teamUserGrade2 = String.valueOf(innerMap.get("teamUserGrade2"));
					String teamUserSex2 = String.valueOf(innerMap.get("teamUserSex2"));
					String teamUserSex2Text = "";
					switch (teamUserSex2) {
						case "M": teamUserSex2Text = "남자"; break;
						case "F": teamUserSex2Text = "여자"; break;
						default:
							break;
					}
					String teamUserPhone2 = "-";
					if( !String.valueOf(innerMap.get("teamUserPhone2")).equals("") && !String.valueOf(innerMap.get("teamUserPhone2")).equals("null") ) {
						teamUserPhone2 = encryptModule.decryptAREA(String.valueOf(innerMap.get("teamUserPhone2")));
					}	
					
					String teamUserEmail2 = "-";
					if( !String.valueOf(innerMap.get("teamUserEmail2")).equals("") && !String.valueOf(innerMap.get("teamUserEmail2")).equals("null") ) {
						teamUserEmail2 = encryptModule.decryptAREA(String.valueOf(innerMap.get("teamUserEmail2")));
					}
					
					/*팀원3*/
					String teamUserName3 = String.valueOf(innerMap.get("teamUserName3"));
					String teamUserBirthDay3 = String.valueOf(innerMap.get("teamUserBirthDay3"));
					String teamUserGrade3 = String.valueOf(innerMap.get("teamUserGrade3"));
					String teamUserSex3 = String.valueOf(innerMap.get("teamUserSex3"));
					String teamUserSex3Text = "";
					switch (teamUserSex3) {
						case "M": teamUserSex3Text = "남자"; break;
						case "F": teamUserSex3Text = "여자"; break;
						default:
							break;
					}
					
					String teamUserPhone3 = "-";
					if( !String.valueOf(innerMap.get("teamUserPhone3")).equals("") && !String.valueOf(innerMap.get("teamUserPhone3")).equals("null") ) {
						teamUserPhone3 = encryptModule.decryptAREA(String.valueOf(innerMap.get("teamUserPhone3")));
					}	
					
					String teamUserEmail3 = "-";
					if( !String.valueOf(innerMap.get("teamUserEmail3")).equals("") && !String.valueOf(innerMap.get("teamUserEmail3")).equals("null") ) {
						teamUserEmail3 = encryptModule.decryptAREA(String.valueOf(innerMap.get("teamUserEmail3")));
					}
					
					/*지도교사*/
					String teacherName = String.valueOf(innerMap.get("teacherName"));
					String teacherBirthDay = String.valueOf(innerMap.get("teacherBirthDay"));
					String teacherSubject = String.valueOf(innerMap.get("teacherSubject"));
					String teacherSex = String.valueOf(innerMap.get("teacherSex"));
					String teacherSexText = "";
					switch (teacherSex) {
						case "M": teacherSexText = "남자"; break;
						case "F": teacherSexText = "여자"; break;
						default:
							break;
					}
					
					String teacherPhone = "-";
					if( !String.valueOf(innerMap.get("teacherPhone")).equals("") && !String.valueOf(innerMap.get("teacherPhone")).equals("null") ) {
						teacherPhone = encryptModule.decryptAREA(String.valueOf(innerMap.get("teacherPhone")));
					}	
					
					String teacherEmail = "-";
					if( !String.valueOf(innerMap.get("teacherEmail")).equals("") && !String.valueOf(innerMap.get("teacherEmail")).equals("null") ) {
						teacherEmail = encryptModule.decryptAREA(String.valueOf(innerMap.get("teacherEmail")));
					}
					
					String[] values = 
						{
							useAtText,
							title,
							startDate + "~" + endDate,
							applyNumber,
							teamName,
							ideaName,
							ideaGubunText,
							school,
							schoolTypeText,
							zipCode,
							address,
							addressDetail,
							teamUserName1,
							teamUserBirthDay1,
							teamUserGrade1 + "학년",
							teamUserSex1Text,
							teamUserPhone1,
							teamUserEmail1,
							teamUserName2,
							teamUserBirthDay2,
							teamUserGrade2 + "학년",
							teamUserSex2Text,
							teamUserPhone2,
							teamUserEmail2,
							teamUserName3,
							teamUserBirthDay3,
							teamUserGrade3 + "학년",
							teamUserSex3Text,
							teamUserPhone3,
							teamUserEmail3,
							teacherName,
							teacherBirthDay,
							teacherSubject,
							teacherSexText,
							teacherPhone,
							teacherEmail
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
		excelMap.put("excel_th", Arrays.asList(new String[]{"No","접수상태","제목","모집기간","접수번호","아이디어 명칭","팀명","아이디어 구분","학교","학교유형","우편 번호","주소","상세 주소",
				"팀원1 성명","팀원1 법정 생년월일","팀원1 학년","팀원1 성별","팀원1 휴대전화","팀원1 이메일",
				"팀원2 성명","팀원2 법정 생년월일", "팀원2 학년","팀원2 성별","팀원2 휴대전화","팀원2 이메일",
				"팀원3 성명","팀원3 법정 생년월일", "팀원3 학년","팀원3 성별","팀원3 휴대전화","팀원3 이메일",
				"지도교사 성명","지도교사 법정 생년월일", "지도교사 담당교과","지도교사 성별","지도교사 휴대전화","지도교사 이메일"}));
        excelView.render(excelMap, request, response);
	}
}