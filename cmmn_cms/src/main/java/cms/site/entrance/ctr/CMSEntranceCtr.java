package cms.site.entrance.ctr;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.data.StaticData;
import cms.mapping.CMSMappingHandler;
import cms.site.entrance.svc.CMSEntranceSvc;
import cms.util.Logs;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/cmsManager/cms/")
public class CMSEntranceCtr extends CMSMappingHandler {
	
	@Resource(name="CMSEntranceSvc")
	private CMSEntranceSvc CMSEntranceSvc;
	
	@RequestMapping(value="noSession.act")
	public void noSession(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request, 
			ModelMap model
			) throws Exception {
		
		model.addAttribute("status", "3");
		model.addAttribute("msg", "세션이 만료되었습니다.");
		model.addAttribute("returnURL", vo.getSelfPath()+"entrance.do");
	}
	
	@RequestMapping(value="entrance.do")
	public void entrance(
			@ModelAttribute("commonVO") CommonVO vo,
			@RequestParam(value="msg", defaultValue="") String msg,
			HttpServletRequest request, 
			ModelMap model
			) throws Exception {
		
		String status = CMSEntranceSvc.selectIpStatus(vo, request);
		switch (status) {
			case "N":
				vo.setSystemMsg("허용되지 않은 접근입니다.");
				vo.setRedirectPage("/welcome.do");
				break;
			case "PASS":
			case "Y":
			default:
				model.addAttribute("ipStatus", status);
				break;
		}
		
		if(admSessionAt(request) != null) {
			model.remove("ipStatus");
			vo.setSystemMsg("");
			vo.setRedirectPage(vo.getSelfPath()+"main.do");
		} else {
			List<EgovMap> siteCode = new ArrayList<EgovMap>();
			List<EgovMap> langCode = new ArrayList<EgovMap>();
			Map<String, EgovMap> siteInfo = StaticData.getInstance().getAllSiteInfo();
			boolean first = true;
			for(String site : siteInfo.keySet()) {
				siteCode.add(siteInfo.get(site));
				if(first) {
					first = false;
					Map<String, EgovMap> langInfo = (Map<String, EgovMap>) siteInfo.get(site).get("langCode");
					for(String lang : langInfo.keySet()) langCode.add(langInfo.get(lang));
				}
			}
			
			model.addAttribute("siteCode", siteCode);
			model.addAttribute("langCode", langCode);
		}
		
	}
	
	@RequestMapping(value="login.act")
	public void login(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		vo.setParamKey2(encryptModule.encryptSHA256(vo.getParamKey2()));
		EgovMap login = CMSEntranceSvc.selectLoginAct(vo, request);
		
		String msg = "";
		String destination = vo.getSelfPath()+"entrance.do";
		
		if(vo.getParamKey3().equals("E")) msg = "서버통신 오류입니다.<br>요청하신 계정정보의 데이터가 정확하지 않습니다.";
		else if(vo.getParamKey3().equals("STAT_S")) msg = "해당 사이트에 가입된 계정이 아닙니다.<br>사이트 구분값을 다시 선택해주세요.";
		else if(vo.getParamKey3().equals("STAT_N")) msg = "미승인된 계정입니다.<br>관리자에게 문의해주세요.";
		else if(vo.getParamKey3().equals("STAT_E")) msg = "탈퇴된 계정입니다.<br>관리자에게 문의해주세요.";
		else if(vo.getParamKey3().equals("N")) msg = "접근이 허용되지않은 ID입니다.<br>관리자에게 문의해주세요.";
		else if(login == null) {
			switch (Optional.of(vo.getParamKey4()).map(Integer::parseInt).get()) {
			case -1:
				msg = "로그인에 실패하였습니다.";
				break;
			case 1: case 2: case 3: case 4:
				msg = "로그인에 실패하였습니다.<br>("+vo.getParamKey4()+"회 실패) 로그인 5회 실패시 아이디가 차단됩니다.";
				break;
			case 5:
				msg = "로그인에 실패하였습니다.<br>해당계정은 로그인5회실패로 차단되었습니다.<br>기타사항은 관리자에게 문의해주세요.";
				break;
			default:
				msg = "해당 계정은 로그인실패횟수 5회초과로 차단된계정입니다.<br>기타사항은 관리자에게 문의해주세요.";
				break;
			}
		} 
		else {
			msg = "로그인에 성공하였습니다.";
			destination = vo.getSelfPath()+"main.do";
			
			login.put("menuList", stringUtil.stringToArr(String.valueOf(login.get("menuList")), ","));
			login.put("mSiteCode", vo.getSiteCode());
			login.put("mLangCode", vo.getLangCode());
			
			request.getSession().setAttribute(Const.ADMIN_SESSION_SET, login);
			StaticData.getInstance().setAdmSession(request.getSession());
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("status", "3");
		model.addAttribute("method", "post");
		model.addAttribute("returnURL", destination);
	}
	
	@RequestMapping(value="session_check.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject session_check(
			@RequestParam(value="key", defaultValue="") String key
			) throws Exception {
		
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(key)) {
			json.put("resultCode", "-2");
			return json;
		}
		
		try {
			Object[] sessionResult = StaticData.getInstance().admSessionAt(key);
			int resultCode = (Integer) sessionResult[0];
			json.put("resultCode", resultCode);
			switch (resultCode) {
				case -1:
					HttpSession session = (HttpSession) sessionResult[1];
					EgovMap sessionData = (EgovMap) session.getAttribute(Const.ADMIN_SESSION_SET);
					Long time = session.getCreationTime();
					Date date = new Date();
					date.setTime(time);
					
					json.put("respId", sessionData.get("id"));
					json.put("respIp", sessionData.get("ip"));
					json.put("respTime", String.format("%02d", date.getHours())+":"+String.format("%02d", date.getMinutes())+":"+String.format("%02d", date.getSeconds()));
					break;
				default:
					break;
			}
			
			return json;
		} catch(Exception e) {
			json.put("resultCode", "1");
			return json;
		}
	}
	
	@RequestMapping(value="logout.act", method=RequestMethod.POST)
	public void logout(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		StaticData.getInstance().removeAdmSession(request.getSession());
		request.getSession().removeAttribute(Const.ADMIN_SESSION_SET);
		
		model.addAttribute("msg", "로그아웃 되었습니다.");
		model.addAttribute("status", "3");
		model.addAttribute("method", "post");
		model.addAttribute("returnURL", vo.getSelfPath()+"entrance.do");
	}
	
	@RequestMapping(value="site_out.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String site_out(
			HttpServletRequest request
			) throws Exception {
		
		StaticData.getInstance().removeAdmSession(request.getSession());
		request.getSession().removeAttribute(Const.ADMIN_SESSION_SET);
		
		return "Y";
	}
	
	@RequestMapping(value="site_info_set.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String site_info_set(
			@RequestParam(value="info", defaultValue="home|kor") String info,
			HttpServletRequest request
			) throws Exception {
		try {
			String[] infos = info.split("[|]");
			
			EgovMap admSession = (EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			admSession.remove("menuPos");
			admSession.remove("menu");
			admSession.put("mSiteCode", infos[0]);
			admSession.put("mLangCode", infos[1]);
			return "T";
		} catch(Exception e) {
			return "F";
		}
	}
	
	@RequestMapping(value="main.do")
	public void main(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "main");
	}

}
