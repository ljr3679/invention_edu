package web.home.kor.user.pool.contact.ctr;

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
import web.home.kor.user.pool.contact.svc.HomeKorUserPoolContactSvc;

@Controller
@RequestMapping(value="/pool/contact/")
public class HomeKorUserPoolContactCtr {

	@Resource(name="homeKorUserPoolContactSvc")
	private HomeKorUserPoolContactSvc homeKorUserPoolContactSvc; 	
	
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
			
			EgovMap resultDataAgree = homeKorUserPoolContactSvc.selectTeacherDataAgree(vo);
			
			if(resultDataAgree != null) {
				if(resultDataAgree.get("privacyYn").equals("Y") && resultDataAgree.get("crimsYn").equals("Y")) {
					returnURL = "edit.do?menuPos=" + vo.getMenuPos();	
				} else {
				returnURL = "index.do?menuPos=" + vo.getMenuPos();
				}
			} else {
				vo.setParamKey40("N");
				vo.setParamKey41("N");
				homeKorUserPoolContactSvc.insertTeacherDataAgree(vo);
				returnURL = "index.do?menuPos=" + vo.getMenuPos();
			}
		
		} else {
			returnURL = "/";	
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
				
				homeKorUserPoolContactSvc.updateTeacherDataAgree(vo);		
			}
			
			EgovMap resultData = homeKorUserPoolContactSvc.selectTeacherData(vo);			
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
				
				List<?> subEdu = homeKorUserPoolContactSvc.selectTeacherSubEduInfoList(vo);
				List<?> subCareer = homeKorUserPoolContactSvc.selectTeacherSubCareerInfoList(vo);
				EgovMap resultDataAgree = homeKorUserPoolContactSvc.selectTeacherDataAgree(vo);
				
				
				
				model.addAttribute("resultData", resultData);
				model.addAttribute("subEdu", subEdu);
				model.addAttribute("subCareer", subCareer);			
				model.addAttribute("resultDataAgree", resultDataAgree);
				
				vo.setAct("modify");
			} else {
				EgovMap resultDataAgree = homeKorUserPoolContactSvc.selectTeacherDataAgree(vo);
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
			EgovMap resultData = homeKorUserPoolContactSvc.selectTeacherData(vo);			
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
			homeKorUserPoolContactSvc.insertTeacherData(vo);
			
			vo.setParamKey1(vo.getIdx());
			if(vo.getParamKeyList2()!=null) {
				for(int i = 0; i < vo.getParamKeyList2().size(); i++) {
					vo.setParamKey32(vo.getParamKeyList2().get(i).toString());
					vo.setParamKey33(vo.getParamKeyList3().get(i).toString());
					vo.setParamKey34(vo.getParamKeyList4().get(i).toString());
					vo.setParamKey41(Integer.toString(i+1));
					homeKorUserPoolContactSvc.insertTbTeacherEduData(vo);
				}
			}
			
			if(vo.getParamKeyList5()!=null) {
				for(int i = 0; i < vo.getParamKeyList5().size(); i++) {
					vo.setParamKey35(vo.getParamKeyList5().get(i).toString());
					vo.setParamKey36(vo.getParamKeyList6().get(i).toString());
					vo.setParamKey37(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey42(Integer.toString(i+1
							));
					homeKorUserPoolContactSvc.insertTbTeacherCareerData(vo);
				}
			}					
			
			model.addAttribute("msg", "정상적으로 등록 되었습니다.");
			model.addAttribute("returnURL", vo.getSelfPath()+"editcomplete.do?menuPos=" + vo.getMenuPos());	
			break;		
		
		case "modify":
			homeKorUserPoolContactSvc.updateTbTeacherData(vo);
			homeKorUserPoolContactSvc.deleteTeacherCareerData(vo);
			homeKorUserPoolContactSvc.deleteTeacherEduData(vo);

			if(vo.getParamKeyList2()!=null) {
				for(int i = 0; i < vo.getParamKeyList2().size(); i++) {
					vo.setParamKey32(vo.getParamKeyList2().get(i).toString());
					vo.setParamKey33(vo.getParamKeyList3().get(i).toString());
					vo.setParamKey34(vo.getParamKeyList4().get(i).toString());
					vo.setParamKey41(Integer.toString(i+1));
					homeKorUserPoolContactSvc.insertTbTeacherEduData(vo);
				}
			}
			
			if(vo.getParamKeyList5()!=null) {
				for(int i = 0; i < vo.getParamKeyList5().size(); i++) {
					vo.setParamKey35(vo.getParamKeyList5().get(i).toString());
					vo.setParamKey36(vo.getParamKeyList6().get(i).toString());
					vo.setParamKey37(vo.getParamKeyList7().get(i).toString());
					vo.setParamKey42(Integer.toString(i+1
							));
					homeKorUserPoolContactSvc.insertTbTeacherCareerData(vo);
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

		homeKorUserPoolContactSvc.deleteTeacherAgree(vo);
		homeKorUserPoolContactSvc.deleteTeacherCareerData(vo);
		homeKorUserPoolContactSvc.deleteTeacherEduData(vo);
		
		homeKorUserPoolContactSvc.updateTbTeacherLeaveData(vo);
		
		model.addAttribute("returnURL", vo.getSelfPath()+"leavecomplete.do?menuPos=" + vo.getMenuPos());				
		
	}

	@RequestMapping(value="leavecomplete.do")
	public void leavecomplete(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {


	}		
	
	
}
