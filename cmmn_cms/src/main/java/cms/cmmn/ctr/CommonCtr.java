package cms.cmmn.ctr;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.cmmn.svc.CommonSvc;
import cms.constant.Const;
import cms.constant.FileConst;
import cms.data.StaticData;
import cms.enc.EncryptModule;
import cms.file.svc.FileDataSvc;
import cms.util.ObjectBuilder;
import cms.util.StringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import WiseAccess.SSO;

@Controller
public class CommonCtr {
	
	@Resource(name="commonSvc")
	private CommonSvc commonSvc;
	
	@Resource(name="encryptModule")
	private EncryptModule encryptModule;

	@Resource(name="fileDataSvc")
	private FileDataSvc fileDataSvc;
	
	@Resource(name="objectBuilder")
	private ObjectBuilder objectBuilder;
	
	@Resource(name="stringUtil")
	private StringUtil stringUtil;
	
	@RequestMapping(value="/common/action/handler.do")
	public String handler(
			@RequestParam(value="returnURL", defaultValue="") String returnURL,
			@RequestParam(value="method", defaultValue="") String method,
			@RequestParam(value="status", defaultValue="") String status,
			@RequestParam(value="msg", defaultValue="") String msg,
			@RequestParam(value="params", defaultValue="") String params,
			ModelMap model
			) throws Exception {
		
		JSONParser parser = new JSONParser();
		JSONObject json = null;
		
		if(stringUtil.isNotEmpty(params)) json = (JSONObject) parser.parse(stringUtil.escapeXml(params));
		if(stringUtil.isNotEmpty(returnURL)) {
			model.addAttribute("returnURL", returnURL);
			model.addAttribute("method", method);
			model.addAttribute("status", status);
			model.addAttribute("params", json);
			model.addAttribute("msg", msg);
			
			return Const.ACTION_HANDLER;	
		} else return "redirect:/";
	}

	@RequestMapping(value= "/common/parent_cate.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String parent_cate(
			@RequestParam(value="category", defaultValue="") String category,
			@RequestParam(value="selected", defaultValue="") String selected,
			HttpServletRequest request
			) throws Exception {
		
		List<EgovMap> categoryList = (List<EgovMap>) commonSvc.selectCategoryParentDataList(category);
		StringBuilder sb = new StringBuilder();
		for(EgovMap map : categoryList) {
			sb.append("<option value=\""+map.get("no")+"\" "+(String.valueOf(map.get("no")).equals(selected) ?"selected=\"selected\"" :"")+">"+map.get("dataName")+"</option>");
		}
		
		return sb.toString();
	}
	
	@RequestMapping(value= "/common/child_cate.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String child_cate(
			@RequestParam(value="category", defaultValue="") String category,
			@RequestParam(value="parent", defaultValue="") String parent,
			@RequestParam(value="selected", defaultValue="") String selected,
			HttpServletRequest request
			) throws Exception {
		EgovMap param = new EgovMap();
		param.put("category", category);
		param.put("parent", parent);
		
		List<EgovMap> categoryList = (List<EgovMap>) commonSvc.selectCategoryChildrenDataList(param);
		StringBuilder sb = new StringBuilder();
		for(EgovMap map : categoryList) {
			sb.append("<option value=\""+map.get("no")+"\" "+(String.valueOf(map.get("no")).equals(selected) ?"selected=\"selected\"" :"")+">"+map.get("dataName")+"</option>");
		}
		
		return sb.toString();
	}

	@RequestMapping(value= "/common/file/info.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject fileInfo(
			@RequestParam(value="uniqueKey", defaultValue="") String uniqueKey,
			HttpServletRequest request
			) throws Exception {
		
		String numPattern = "^[0-9]+$";
		if(!uniqueKey.matches(numPattern)) uniqueKey = encryptModule.decryptAREA(uniqueKey);
		
		EgovMap fileData = fileDataSvc.selectFileDataInfo(uniqueKey);
		
		if(fileData != null) return objectBuilder.mapToJson(fileData);
		else return null; 
	}
	
	
	@RequestMapping(value="/common/lang/info.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject langInfo(
			@RequestParam(value="siteCode", defaultValue="") String siteCode
			) throws Exception {
		
		Map<String, EgovMap> langCodeMap = (Map<String, EgovMap>) StaticData.getInstance().getSiteInfo(siteCode).get("langCode");
		List<Map> mapList = new ArrayList<>();
		for(String langCode : langCodeMap.keySet()) {
			EgovMap map = langCodeMap.get(langCode);
			mapList.add(map);
		}
		
		return objectBuilder.listMapToJson("data", mapList);
	}
	
	@RequestMapping(value="/common/sso/login.do")
	public String login(
			HttpServletRequest request,
			ModelMap model)	throws Exception {
        
		String currentUrl = request.getScheme() + "://"+request.getServerName()+":"+request.getServerPort();
		String returnUrl = URLEncoder.encode(currentUrl+"/common/sso/loginData.do?returnUrl="+request.getScheme() + "://"+request.getServerName(), "UTF-8");
		//System.out.println("currentUrl ::: " + returnUrl);
		
		return "redirect:https://www.kipa.org/kipasso/loginForm.kipa?url="+returnUrl;
	}
	
	@RequestMapping(value="/common/sso/logout.act")														// 로그아웃
	public String logout(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpSession session,
			HttpServletRequest request,
			ModelMap model
			) throws Exception{
		
		session.removeAttribute(Const.USER_SESSION_SET);
		model.addAttribute("method", "post");
		model.addAttribute("status", "3");
		model.addAttribute("returnURL", "/");
		model.addAttribute("msg","로그아웃 되었습니다.");
		
		return Const.ACTION_HANDLER;
	}
	
	@RequestMapping(value="/common/sso/loginData.do")
	public String loginData(
			HttpServletRequest request,
			ModelMap model)	throws Exception {
		
		//System.out.println("----------------------------");
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    //System.out.println(name + " : " +request.getParameter(name));
		}
		
		String data = extractPostRequestBody(request);
		//System.out.println("FINAL RELAY COMMONCODE:" + data);
		
		//System.out.println("----------------------------");
		
		if ("localhost".equals(request.getServerName())) {
			String srtKipaNo = "109759"; // 고유번호
			String strUserID = "polox94"; // 사용자 ID
			String srtUserName = "이정연"; // 사용자 성명
			String srtEmail = "polox94@naver.com"; // 이메일
			
			EgovMap userMap = new EgovMap();
			userMap.put("no", srtKipaNo);
			userMap.put("id", strUserID);
			userMap.put("name", srtUserName);
			if(stringUtil.isNotEmpty(srtEmail)) srtEmail = encryptModule.encryptAREA(srtEmail);
			userMap.put("email", srtEmail);
			userMap.put("membertype", "01");
			
			int cnt = commonSvc.selectUserDataCnt(userMap);
			
			if(cnt < 1) {
				commonSvc.insertUserData(userMap);
				//System.out.println(userMap.get("idx"));
				commonSvc.insertMemberData(userMap);
				
			} else {
				commonSvc.updateUserData(userMap);
			}
			
			request.getSession().setAttribute(Const.USER_SESSION_SET, userMap);
		} else {
			int nResult = -1;

			String ssoToken = request.getParameter("stoken");
			//System.out.println("ssoToken : " + ssoToken);
			SSO sso = new SSO();

			//토큰 검증
			nResult = sso.verifyToken(ssoToken);
			//System.out.println("nResult : " + nResult);

			if (nResult == 0) {
				// 리턴값
				String srtKipaNo = sso.getValue("me_useridx"); // 고유번호
				String strUserID = sso.getValueUserID(); // 사용자 ID
				String srtUserName = sso.getValue("me_username"); // 사용자 성명
				String srtEmail = sso.getValue("me_email"); // 이메일
				
				
				//System.out.println("srtKipaNo : " + srtKipaNo);
				//System.out.println("strUserID : " + strUserID);
				//System.out.println("srtUserName : " + srtUserName);
				//System.out.println("srtEmail : " + srtEmail);
				
				
				EgovMap userMap = new EgovMap();
				userMap.put("no", srtKipaNo);
				userMap.put("id", strUserID);
				userMap.put("name", srtUserName);
				if(stringUtil.isNotEmpty(srtEmail)) srtEmail = encryptModule.encryptAREA(srtEmail);
				userMap.put("email", srtEmail);				
				userMap.put("membertype", "01");
				
				int cnt = commonSvc.selectUserDataCnt(userMap);
				
				if(cnt < 1) {
					commonSvc.insertUserData(userMap);
					//System.out.println(userMap.get("idx"));
					commonSvc.insertMemberData(userMap);					
				} else {
					commonSvc.updateUserData(userMap);
				}
				
				request.getSession().setAttribute(Const.USER_SESSION_SET, userMap);
				
			} else {
				//System.out.println("로그인이 실패하였습니다.");
			}
		}
		
		return "web/home/kor/user/main/loginData";
	}
	
	public String extractPostRequestBody(HttpServletRequest request) {
	    if ("POST".equalsIgnoreCase(request.getMethod())) {
	        Scanner s = null;
	        try {
	            s = new Scanner(request.getInputStream(), "UTF-8").useDelimiter("\\A");
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        return s.hasNext() ? s.next() : "";
	    }
	    return "";
	}
	
} 
