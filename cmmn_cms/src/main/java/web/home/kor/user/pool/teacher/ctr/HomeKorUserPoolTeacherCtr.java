package web.home.kor.user.pool.teacher.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.pool.teacher.svc.HomeKorUserPoolTeacherSvc;
import cms.cmmn.svc.CommonSvc;

@Controller
@RequestMapping(value="/pool/teacher/")
public class HomeKorUserPoolTeacherCtr {

	@Resource(name="homeKorUserPoolTeacherSvc")
	private HomeKorUserPoolTeacherSvc homeKorUserPoolTeacherSvc; 	
	
	@Resource(name="commonSvc")
	private CommonSvc commonSvc;
	
	@RequestMapping(value="index.do")
	public void index(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
	}
	
	@RequestMapping(value="join.act")
	public void joinAct(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		HttpServletRequest sessRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = sessRequest.getSession();
		Object getSession = session.getAttribute(Const.USER_SESSION_SET);	

		String returnURL = "";		
		
		if(getSession != null) {
			EgovMap user = (EgovMap) getSession;
			//vo.setUsr_idx(user.get("no") != null ?String.valueOf(user.get("no")) :"");
			vo.setUsr_id(user.get("id") != null ?String.valueOf(user.get("id")) :"");
			//vo.setUsr_nm(user.get("name") != null ?String.valueOf(user.get("name")) :"");	
		

			
			String userId = vo.getUsr_id();
			vo.setParamKey1(userId);
			
			EgovMap resultDataAgree = homeKorUserPoolTeacherSvc.selectTeacherDataAgree(vo);
			
			if(resultDataAgree != null) {
				if(resultDataAgree.get("privacyYn").equals("Y") && resultDataAgree.get("crimsYn").equals("Y")) {
					returnURL = "edit.do?menuPos=" + vo.getMenuPos();	
				} else {
				returnURL = "index.do?menuPos=" + vo.getMenuPos();
				}
			} else {
				vo.setParamKey40("N");
				vo.setParamKey41("N");
				homeKorUserPoolTeacherSvc.insertTeacherDataAgree(vo);
				returnURL = "index.do?menuPos=" + vo.getMenuPos();
			}
		
		} else {
			returnURL = "/home/kor/pool/teacher/index.do?menuPos=124";	
		}
		model.addAttribute("returnURL", returnURL);			
	}		

	
	@RequestMapping(value="edit.do")
	public void edit(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		HttpServletRequest sessRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = sessRequest.getSession();
		Object getSession = session.getAttribute(Const.USER_SESSION_SET);		

		if(getSession != null) {
			EgovMap user = (EgovMap) getSession;
			//vo.setUsr_idx(user.get("no") != null ?String.valueOf(user.get("no")) :"");
			vo.setUsr_id(user.get("id") != null ?String.valueOf(user.get("id")) :"");
			//vo.setUsr_nm(user.get("name") != null ?String.valueOf(user.get("name")) :"");	
		
			String userId = vo.getUsr_id();

			vo.setParamKey1(userId);
			
			if(request.getParameter("paramKey40") != null) {
				vo.setParamKey40(request.getParameter("paramKey40") );
				vo.setParamKey41(request.getParameter("paramKey41") );
				
				homeKorUserPoolTeacherSvc.updateTeacherDataAgree(vo);		
			}
			
			EgovMap resultData = homeKorUserPoolTeacherSvc.selectTeacherData(vo);	
			List<?> region = this.commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		    model.addAttribute("region", region);
			if(resultData != null) {
				
				vo.setIdx(String.valueOf(resultData.get("no")));
				
				String name = String.valueOf(resultData.get("memberName"));
				String birth = String.valueOf(resultData.get("birth"));
				String gender = String.valueOf(resultData.get("gender"));
				model.addAttribute("code", name+""+birth+""+gender);

				if(resultData.get("email") != null && !String.valueOf(resultData.get("email")).equals("")) {
					final String [] sp_email = String.valueOf(resultData.get("email")).split("@");
					if(sp_email.length > 1) {
						resultData.put("email1", sp_email[0]);
						resultData.put("email2", sp_email[1]);
					}
				}				
				
				List<?> subEdu = homeKorUserPoolTeacherSvc.selectTeacherSubEduInfoList(vo);
				List<?> subCareer = homeKorUserPoolTeacherSvc.selectTeacherSubCareerInfoList(vo);
				List<?> subArea = homeKorUserPoolTeacherSvc.selectTeacherSubAreaInfoList(vo);
				EgovMap resultDataAgree = homeKorUserPoolTeacherSvc.selectTeacherDataAgree(vo);
				
				
				
				model.addAttribute("resultData", resultData);
				model.addAttribute("subEdu", subEdu);
				model.addAttribute("subCareer", subCareer);			
				model.addAttribute("subArea", subArea);			
				model.addAttribute("resultDataAgree", resultDataAgree);
				
				vo.setAct("modify");
			} else {
				EgovMap resultDataAgree = homeKorUserPoolTeacherSvc.selectTeacherDataAgree(vo);
				model.addAttribute("resultDataAgree", resultDataAgree);
				vo.setAct("regist");
			}
		} else {
			vo.setAct("regist");
		}
	}

	@RequestMapping(value="editcomplete.do")
	public void editcomplete(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		HttpServletRequest sessRequest = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = sessRequest.getSession();
		Object getSession = session.getAttribute(Const.USER_SESSION_SET);	
		
		if(getSession != null) {
			EgovMap user = (EgovMap) getSession;
			//vo.setUsr_idx(user.get("no") != null ?String.valueOf(user.get("no")) :"");
			vo.setUsr_id(user.get("id") != null ?String.valueOf(user.get("id")) :"");
			//vo.setUsr_nm(user.get("name") != null ?String.valueOf(user.get("name")) :"");	
		
			String userId = vo.getUsr_id();

			vo.setParamKey1(userId);
			EgovMap resultData = homeKorUserPoolTeacherSvc.selectTeacherData(vo);			
			if(resultData != null) {
				
				vo.setIdx(String.valueOf(resultData.get("no")));
				
				String name = String.valueOf(resultData.get("memberName"));
				String birth = String.valueOf(resultData.get("birth"));
				String gender = String.valueOf(resultData.get("gender"));
				model.addAttribute("code", name+""+birth+""+gender);		
			} 
		}		

	}	
	
	@RequestMapping(value="edit.act")
	public void editAct(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		switch (vo.getAct()) {

		case "regist":
			homeKorUserPoolTeacherSvc.insertTeacherData(vo);
			
			vo.setParamKey1(vo.getIdx());
			if(vo.getParamKeyList2()!=null) {
				for(int i = 0; i < vo.getParamKeyList2().size(); i++) {
					vo.setParamKey32(vo.getParamKeyList2().get(i).toString());
					vo.setParamKey33(vo.getParamKeyList3().get(i).toString());
					vo.setParamKey34(vo.getParamKeyList4().get(i).toString());
					vo.setParamKey41(Integer.toString(i+1));
					homeKorUserPoolTeacherSvc.insertTbTeacherEduData(vo);
				}
			}
			
			if(vo.getParamKeyList5()!=null) {
				for(int i = 0; i < vo.getParamKeyList5().size(); i++) {
					vo.setParamKey35(vo.getParamKeyList5().get(i).toString());
					vo.setParamKey36(vo.getParamKeyList6().get(i).toString());
//					vo.setParamKey37(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey42(Integer.toString(i+1));
					homeKorUserPoolTeacherSvc.insertTbTeacherCareerData(vo);
				}
			}		
			if(vo.getParamKeyList7()!=null) {
				for(int i = 0; i < vo.getParamKeyList7().size(); i++) {
					vo.setParamKey43(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey44(vo.getParamKeyList8().get(i).toString());
					vo.setParamKey45(Integer.toString(i+1));
					homeKorUserPoolTeacherSvc.insertTbTeacherAreaData(vo);
				}
			}		
			
			model.addAttribute("msg", "정상적으로 등록 되었습니다.");
			model.addAttribute("returnURL", vo.getSelfPath()+"editcomplete.do?menuPos=" + vo.getMenuPos());	
			break;		
		
		case "modify":
			homeKorUserPoolTeacherSvc.updateTbTeacherData(vo);
			homeKorUserPoolTeacherSvc.deleteTeacherCareerData(vo);
			homeKorUserPoolTeacherSvc.deleteTeacherEduData(vo);
			homeKorUserPoolTeacherSvc.deleteTbTeacherAreaData(vo);

			if(vo.getParamKeyList2()!=null) {
				for(int i = 0; i < vo.getParamKeyList2().size(); i++) {
					vo.setParamKey32(vo.getParamKeyList2().get(i).toString());
					vo.setParamKey33(vo.getParamKeyList3().get(i).toString());
					vo.setParamKey34(vo.getParamKeyList4().get(i).toString());
					vo.setParamKey41(Integer.toString(i+1));
					homeKorUserPoolTeacherSvc.insertTbTeacherEduData(vo);
				}
			}
			
			if(vo.getParamKeyList5()!=null) {
				for(int i = 0; i < vo.getParamKeyList5().size(); i++) {
					vo.setParamKey35(vo.getParamKeyList5().get(i).toString());
					vo.setParamKey36(vo.getParamKeyList6().get(i).toString());
//					vo.setParamKey37(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey42(Integer.toString(i+1));
					homeKorUserPoolTeacherSvc.insertTbTeacherCareerData(vo);
				}
			}			
			if(vo.getParamKeyList7()!=null) {
				for(int i = 0; i < vo.getParamKeyList7().size(); i++) {
					vo.setParamKey43(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey44(vo.getParamKeyList8().get(i).toString());
					vo.setParamKey45(Integer.toString(i+1));
					homeKorUserPoolTeacherSvc.insertTbTeacherAreaData(vo);
				}
			}			
			
			break;
		case "delete":
			break;
		default:
			break;
		}
		
		model.addAttribute("returnURL", vo.getSelfPath()+"editcomplete.do?menuPos=" + vo.getMenuPos());		
		
	}
	

	@RequestMapping(value="leave.act")
	public void leaveAct(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {

		homeKorUserPoolTeacherSvc.deleteTeacherAgree(vo);
		homeKorUserPoolTeacherSvc.deleteTeacherCareerData(vo);
		homeKorUserPoolTeacherSvc.deleteTeacherEduData(vo);
		
		homeKorUserPoolTeacherSvc.updateTbTeacherLeaveData(vo);
		
		model.addAttribute("returnURL", vo.getSelfPath()+"leavecomplete.do?menuPos=" + vo.getMenuPos());				
		
	}

	@RequestMapping(value="leavecomplete.do")
	public void leavecomplete(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {


	}		
	
	
}
