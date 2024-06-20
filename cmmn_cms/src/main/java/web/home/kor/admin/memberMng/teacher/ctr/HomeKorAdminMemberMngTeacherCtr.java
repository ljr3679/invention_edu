package web.home.kor.admin.memberMng.teacher.ctr;

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

import cms.cmmn.CommonVO;
import cms.excel.ExcelContents;
import cms.excel.ExcelView;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.memberMng.teacher.svc.HomeKorAdminMemberMngTeacherSvc;


@Controller
@RequestMapping(value="/memberMng/teacher/")
public class HomeKorAdminMemberMngTeacherCtr extends CMSMappingHandler {

	
	
	@Resource(name="homeKorAdminMemberMngTeacherSvc")
	private HomeKorAdminMemberMngTeacherSvc homeKorAdminMemberMngTeacherSvc;
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				vo.setPagingYn("Y");
				List<?> resultList = homeKorAdminMemberMngTeacherSvc.selectTeacherDataList(vo);
				int totalCnt = homeKorAdminMemberMngTeacherSvc.selectTeacherDataListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		EgovMap resultData = homeKorAdminMemberMngTeacherSvc.selectTeacherData(vo);
		if(resultData != null) {
			
			String name = String.valueOf(resultData.get("memberName"));
			String birth = String.valueOf(resultData.get("birth"));
			String gender = String.valueOf(resultData.get("gender"));
			model.addAttribute("code", name+""+birth+""+gender);		

			if(resultData.get("email") != null && !String.valueOf(resultData.get("email")).equals("")) {
				String [] sp_email = String.valueOf(resultData.get("email")).split("@");
				if(sp_email.length > 1) {
					resultData.put("email1", sp_email[0]);
					resultData.put("email2", sp_email[1]);
				}
			}			
			
			List<?> subEdu = homeKorAdminMemberMngTeacherSvc.selectTeacherSubEduInfoList(vo);
			List<?> subCareer = homeKorAdminMemberMngTeacherSvc.selectTeacherSubCareerInfoList(vo);

			model.addAttribute("subEdu", subEdu);
			model.addAttribute("subCareer", subCareer);
			

//			if(resultData.get("acq_auth_num") != null && !String.valueOf(resultData.get("acq_auth_num")).equals("")) {
//				String [] sp_auth = String.valueOf(resultData.get("acq_auth_num")).split("-");
//				if(sp_auth.length > 1) {
//					resultData.put("acqAuthNum1", sp_auth[0]);
//					resultData.put("acqAuthNum2", sp_auth[1]);
//					if(sp_auth.length > 2) {
//						resultData.put("acqAuthNum3", sp_auth[2]);
//					}
//				}
//			}
			

		}
		model.addAttribute("resultData", resultData);

	}	

	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {

		case "modify":
			homeKorAdminMemberMngTeacherSvc.updateTbTeacherData(vo);
			homeKorAdminMemberMngTeacherSvc.deleteTeacherCareerData(vo);
			homeKorAdminMemberMngTeacherSvc.deleteTeacherEduData(vo);

			if(vo.getParamKeyList2()!=null) {
				for(int i = 0; i < vo.getParamKeyList2().size(); i++) {
					vo.setParamKey32(vo.getParamKeyList2().get(i).toString());
					vo.setParamKey33(vo.getParamKeyList3().get(i).toString());
					vo.setParamKey34(vo.getParamKeyList4().get(i).toString());
					vo.setParamKey41(Integer.toString(i+1));
					homeKorAdminMemberMngTeacherSvc.insertTbTeacherEduData(vo);
				}
			}
			
			if(vo.getParamKeyList5()!=null) {
				for(int i = 0; i < vo.getParamKeyList5().size(); i++) {
					vo.setParamKey35(vo.getParamKeyList5().get(i).toString());
					vo.setParamKey36(vo.getParamKeyList6().get(i).toString());
					vo.setParamKey37(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey42(Integer.toString(i+1
							));
					homeKorAdminMemberMngTeacherSvc.insertTbTeacherCareerData(vo);
				}
			}			
			
			break;
		case "delete":
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
		
		vo.setTitle("관리자 협력교원관리 다운로드");
		homeKorAdminMemberMngTeacherSvc.downloadCMSRecord(vo);
		
		String title = "CMS-관리자 [협력 교원 관리]";
		
        String docName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		
        List<EgovMap> resultList = (List<EgovMap>) homeKorAdminMemberMngTeacherSvc.selectTeacherExlDataList(vo);
		
		//System.out.println(resultList);
        ExcelView excelView = new ExcelView(new ExcelContents() {
			
			@Override
			public void ExcelContentsSet(Sheet sheet, Row row, Cell cell, CellStyle headStyle, CellStyle bodyStyle)
					throws Exception {
				// TODO Auto-generated method stub
				int rowCnt = 1;
				int index = 0;
				for(EgovMap innerMap : resultList) {
					int cellCnt = 0;

					String code = String.valueOf(innerMap.get("memberName")) + String.valueOf(innerMap.get("birth")) + String.valueOf(innerMap.get("gender"));
					String id = String.valueOf(innerMap.get("memberId"));
					String name = String.valueOf(innerMap.get("memberName"));
					String department = String.valueOf(innerMap.get("department"));
					String departmentPosition = String.valueOf(innerMap.get("departmentPosition"));
					String acqAt = String.valueOf(innerMap.get("acqAt"));
					String classHistory = String.valueOf(innerMap.get("classHistory"));
					String phone = String.valueOf(innerMap.get("phone"));
					String email = String.valueOf(innerMap.get("email"));
					String createDate = String.valueOf(innerMap.get("createDate"));
					
					String[] values = 
						{
							code,
							id,
							name,
							department,
							departmentPosition,
							acqAt,
							classHistory,
							phone,
							email,
							createDate,
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
		excelMap.put("excel_th", Arrays.asList(new String[]{"No","관리코드","아이디","이름","소속","직위","발명교사인증제 취득 여부","희망활동분야","연락처","이메일","등록일"}));
        excelView.render(excelMap, request, response);
	}		
	
	
	
	
}
