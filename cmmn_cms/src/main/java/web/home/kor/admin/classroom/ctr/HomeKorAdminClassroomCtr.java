package web.home.kor.admin.classroom.ctr;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cms.api.MessagemeService;
import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.site.category.svc.CMSCategoryMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.classroom.svc.HomeKorAdminClassroomSvc;
import web.home.kor.admin.homepage.message.svc.HomeKorAdminHomepageMessageSvc;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonError;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.classroom.Classroom;
import com.google.api.services.classroom.ClassroomScopes;
import com.google.api.services.classroom.model.Course;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value="/classroom/")
public class HomeKorAdminClassroomCtr extends CMSMappingHandler {
	
	static ArrayList<String> SCOPES = new ArrayList<>(Arrays.asList(ClassroomScopes.CLASSROOM_COURSES));	

	@Resource(name="homeKorAdminClassroomSvc")
	private HomeKorAdminClassroomSvc homeKorAdminClassroomSvc; 	

	@Resource(name="homeKorAdminHomepageMessageSvc")
	private HomeKorAdminHomepageMessageSvc homeKorAdminHomepageMessageSvc; 	
	
	@Resource(name="CMSCategoryMngSvc")
	private CMSCategoryMngSvc CMSCategoryMngSvc;	

	@Resource(name="messagemeService")
	private MessagemeService messagemeService;	
	
	@RequestMapping(value="index.do")
	public void index(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		// TODO Auto-generated method stub
	}
	
	@RequestMapping(value="courseList.do")
	public void courseList(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {

		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomList(vo);
				Integer totalCnt = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});		
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 2023; i <= year; i++) {
			yearList.add(i);
			//System.out.println("yearList::::::::::::::" + i);
		}
		model.addAttribute("yearList", yearList);		

	}		
		
	@RequestMapping(value="courseEdit.do")
	public void courseEdit(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
	
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			EgovMap resultData = homeKorAdminClassroomSvc.selectHomeKorAdminClassroom(vo);
			
			if(resultData != null) {
				
				//List<?> eduSchedule = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomSchedule(vo);
				//model.addAttribute("eduSchedule", eduSchedule);
			}
			
			model.addAttribute("resultData", resultData);
		}
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 2023; i <= year; i++) {
			yearList.add(i);
			//System.out.println("yearList::::::::::::::" + i);
		}
		model.addAttribute("yearList", yearList);
		
		String code = "CmPDW86nfT";
		List<EgovMap> codetList = (List<EgovMap>) CMSCategoryMngSvc.selectCategorySubDataList(code);
		model.addAttribute("codeData", codetList);		
		
		
	}

	
	@RequestMapping(value="courseEdit.act")
	public void courseEditAct(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				homeKorAdminClassroomSvc.insertHomeKorAdminClassroom(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminClassroomSvc.updateHomeKorAdminClassroom(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminClassroomSvc.deleteHomeKorAdminClassroom(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminClassroomSvc.deleteHomeKorAdminClassroomList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"courseList.do");
	}	
	

	@RequestMapping(value="member_popup.do")
	public void member_popup(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		setPaging2(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList2 = homeKorAdminClassroomSvc.selectTeacherDataList(vo);
				Integer totalCnt2 = homeKorAdminClassroomSvc.selectTeacherDataListCnt(vo);
				return new Object[] {resultList2, totalCnt2};
			}
		}, 10, 10);
	}	
	
	@RequestMapping(value="teammember_popup.do")
	public void teammember_popup(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		setPaging2(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList2 = homeKorAdminClassroomSvc.selectTeacherDataList(vo);
				Integer totalCnt2 = homeKorAdminClassroomSvc.selectTeacherDataListCnt(vo);
				return new Object[] {resultList2, totalCnt2};
			}
		}, 10, 10);
	}		

	@RequestMapping(value="message_popup.do")
	public void message_popup(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {

		String phonenum = request.getParameter("phonenum");
		model.addAttribute("phonenum", phonenum);
		
		String code = "Ci0T891Y3T";
		List<EgovMap> codetList = (List<EgovMap>) CMSCategoryMngSvc.selectCategorySubDataList(code);
		model.addAttribute("codeData", codetList);
		
	}		
	
	
	
	@RequestMapping(value="scheduleList.do")
	public void scheduleList(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {

		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomScheduleList(vo);
				Integer totalCnt = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomScheduleListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});		

		int year = Calendar.getInstance().get(Calendar.YEAR);
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 2023; i <= year; i++) {
			yearList.add(i);
			//System.out.println("yearList::::::::::::::" + i);
		}
		model.addAttribute("yearList", yearList);			
		
	}	
	
	@RequestMapping(value="scheduleEdit.do")
	public void scheduleEdit(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
	
		switch (vo.getAct()) {
			case "regist":
				break;
			case "modify":		
				if(stringUtil.isNotEmpty(vo.getIdx())) {
					EgovMap resultData = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomSchedule(vo);
					
					if(resultData != null) {
						
						//List<?> eduSchedule = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomSchedule(vo);
						//model.addAttribute("eduSchedule", eduSchedule);
					}
					
					model.addAttribute("resultData", resultData);
				}
				break;
			default:
				break;
		}
	
	}	
	
	@RequestMapping(value="scheduleEdit.act")
	public void scheduleEditAct(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				vo.setIdx2(vo.getIdx());
				homeKorAdminClassroomSvc.insertHomeKorAdminClassroomSchedule(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminClassroomSvc.updateHomeKorAdminClassroomSchedule(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminClassroomSvc.deleteHomeKorAdminClassroomSchedule(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"scheduleList.do");
	}		

	
	@RequestMapping(value="courseEdit2.do")
	public void courseEdit2(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
		EgovMap resultData = homeKorAdminClassroomSvc.selectHomeKorAdminClassroom(vo);
		if(resultData != null) {
			
			List<?> eduSchedule = homeKorAdminClassroomSvc.selectHomeKorAdminClassroomScheduleList(vo);
		}
		model.addAttribute("resultData", resultData);
	}	

	@RequestMapping(value = "/classroomcallback.act")
	public String classroomcallback(ModelMap model) throws Exception {

      String URI = "https://accounts.google.com/o/oauth2/v2/auth?" 
      + "client_id=293479205007-2ns90k28ql2qtfqdct4onm7ni9ga5t43.apps.googleusercontent.com" 
      + "&redirect_uri=https://dev.gapia.co.kr:8026/cmsManager/home/kor/classroom/classroomList.do"
      + "&scope=https://www.googleapis.com/auth/classroom.courses.readonly"
      + "&response_type=code";
      return "redirect:" + URI;      		
		
	}	

	
	
	
	
	
	@RequestMapping(value="classroomList.do", method=RequestMethod.GET)
	public void classroomList(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws GeneralSecurityException, IOException {
	     String code = request.getParameter("code");
	      
	      System.out.println(code);
	      try {

	          URL url = new URL("https://oauth2.googleapis.com/token");
	          String postData = "code="+ code  
	            		+ "&client_id=293479205007-2ns90k28ql2qtfqdct4onm7ni9ga5t43.apps.googleusercontent.com" 
	            		+ "&client_secret=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"
	            		+ "&redirect_uri=https://dev.gapia.co.kr:8026/cmsManager/home/kor/classroom/classroomList.do"
	              		+ "&grant_type=authorization_code";

	          
	          System.out.println(postData);
	          HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	          conn.setRequestMethod("POST");
	          conn.setDoOutput(true);
	          conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	          conn.setRequestProperty("Content-Length", Integer.toString(postData.length()));
	          conn.setUseCaches(false);

	          try (DataOutputStream dos = new DataOutputStream(conn.getOutputStream())) {
	              dos.writeBytes(postData);
	          }
	          StringBuilder sb = new StringBuilder();
	          String data = new String();
	          try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
	        	  
	              String line;
	              while ((line = br.readLine()) != null) {
	            	  sb.append(line);
	                  //System.out.println("line = " + line);
	              }
	          }
	          data = sb.toString();

	          System.out.println(data);
	          
	          JSONParser parse = new JSONParser();
	          JSONObject obj = (JSONObject) parse.parse(data);
	          
	          System.out.println("access_token = " + obj.get("access_token"));
	          
	          String atoken = obj.get("access_token").toString();
	          
	          
	          URL url2 = new URL("https://content-classroom.googleapis.com/v1/courses?key=AIzaSyCKZws-XORnRRqoCXHIZp6mLebHDoHx4a0");

	          HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
	          conn2.setRequestMethod("GET");
	          conn2.setDoOutput(true);
	          conn2.setDoInput(true);
	          conn2.setRequestProperty("Authorization", "Bearer " + atoken);
	          conn2.setRequestProperty("Accept", "application/json");
	          conn2.setUseCaches(false);
	 	  

	          StringBuilder sb2 = new StringBuilder();
	          String data2 = new String();
	          try (BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()))) {
	        	  
	              String line2;
	              while ((line2 = br2.readLine()) != null) {
	            	  sb2.append(line2);
	                  //System.out.println("line = " + line);
	              }
	          }
	          data2 = sb2.toString();          
	          
	          System.out.println(data2);
	          
	          JSONParser parse2 = new JSONParser();
	          JSONObject obj2 = (JSONObject) parse2.parse(data2);
	          
	          System.out.println(obj2);
     
	          
	  	      model.addAttribute("cobj", obj2);	          
	          
	      } catch (Exception e) {
	          e.printStackTrace();
	      }  

	  }		
	
	@RequestMapping(value="classroomInfo.do")
	public void classroomInfo(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws GeneralSecurityException, IOException {
		
	    // Create the classroom API client.
	    final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
	    Classroom service = new Classroom.Builder(HTTP_TRANSPORT, GsonFactory.getDefaultInstance(), ClassroomCredentials.getCredentials(HTTP_TRANSPORT, SCOPES)).setApplicationName("classroom web").build();
	    
	    Course course = null;
	    String courseId = vo.getIdx();
	    
	    System.out.println(vo.getIdx());
	    System.out.println(courseId);
	    
	    
	    try {
	    	   course = service.courses().get(courseId).execute();
	    	   System.out.printf("Course '%s' found.\n", course.getName());
    	 } catch (GoogleJsonResponseException e) {
    	   // TODO(developer) - handle error appropriately
    	   GoogleJsonError error = e.getDetails();
    	   if (error.getCode() == 404) {
    	     System.out.printf("Course with ID '%s' not found.\n", courseId);
    	   } else {
    	     throw e;
    	   }
    	 }
	    System.out.println(course);
    	 model.addAttribute("course", course);
	  }	
	
	
	@RequestMapping(value="sendSmsReserve.act")
	public void sendSmsReserveAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		String reserveDate = vo.getParamKey11().replace("-", "|") + "|" + vo.getParamKey12().replace(":", "|") + "|00";
		System.out.println(reserveDate);
		switch (vo.getAct()) {
			case "regist":
				sendSmsReserve(vo.getAdm_idx(), vo.getParamKey1(), vo.getParamKey2(), reserveDate, vo.getParamKey3(), vo.getParamKey4());
				homeKorAdminHomepageMessageSvc.insertHomeKorAdminHomepageMessage(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				sendSmsReserve(vo.getAdm_idx(), vo.getParamKey1(), vo.getParamKey2(), reserveDate, vo.getParamKey3(), vo.getParamKey4());
				homeKorAdminHomepageMessageSvc.insertHomeKorAdminHomepageMessage(vo);
				model.addAttribute("status", "0");
				break;				
			default:
				break;
		}

	}	
	
	
	
	private void sendSmsReserve(String adminIdx, String sender, String receipter, String reservedate, String subject, String contents) throws Exception {
	    //String[] receipterArr = receipter.split(";");
		CommonVO vo = new CommonVO();
	
	    // 보내는 사람번호
	    String sms_from = sender.replace("-", "");	    
	    //System.out.println(receipter);
	    // 예약전송 시간
	    String sms_reserve_date = reservedate;	    
	    // 보내는 메세지제목
	    String sms_subj = subject;
	    // 보내는 메세지
	    String sms_msg = contents.replace("&", "%26");
	    //String strReceipter = receipter.replace("-", "").replace(";", "|").replace("\r\n", "|");
	    String strReceipter = receipter.replace("-", "").replace(",", ";").replace("\r\n", ";");


	    String[] receipterArr = strReceipter.split(";");

		//for(String receipt : receipterArr) whoisSMS.sendSms(receipt, sender, contents);
	    for(String receipt : receipterArr) {
	    	
	    	String resultCode = null;
		    // 받는사람번호
		   String sms_to = receipt;
		   
		   if(!sms_to.isEmpty()) {
			   resultCode = messagemeService.sendSmsReserve(sms_from, sms_to, sms_reserve_date, sms_subj, sms_msg);
			   		   			   
			   if(!resultCode.isEmpty()) {
				   vo.setAdm_idx(adminIdx);
				   vo.setParamKey1(sms_from);
				   vo.setParamKey2(sms_to);
				   vo.setParamKey3(sms_subj);
				   vo.setParamKey4(sms_msg);   
				   vo.setParamKey5(resultCode);
				   homeKorAdminHomepageMessageSvc.insertHomeKorAdminHomepageMessageLog(vo);
			   }
			   
		   }
	    	
	    }
	}	
	
	

}
