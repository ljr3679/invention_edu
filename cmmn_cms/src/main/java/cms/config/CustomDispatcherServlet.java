package cms.config;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

import cms.cmmn.CommonVO;
import cms.constant.Const;

public class CustomDispatcherServlet extends DispatcherServlet {
	
	private static String FORWARD_PREFIX = "forward:";
	
	@Override
	protected void render(ModelAndView model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		ModelMap modelMap = model.getModelMap();
		if(modelMap.containsKey("vo")) {
			CommonVO vo = (CommonVO) modelMap.get("vo");
			Optional.of(vo.getReturnPage()).filter(page -> !page.equals("")).ifPresent(page -> model.setViewName(page));
			Optional.of(vo.getForwardPage()).filter(page -> !page.equals("")).ifPresent(page -> model.setViewName(FORWARD_PREFIX+page));
			Optional.of(vo.getRedirectPage()).filter(page -> !page.equals("")).ifPresent(page -> {
				modelMap.addAttribute("returnURL", page);
				if(!vo.getSystemMsg().equals("")) {
					modelMap.addAttribute("status", "3");
					modelMap.addAttribute("msg", vo.getSystemMsg());	
				}
				model.setViewName(Const.ACTION_HANDLER);	
			});
		}
		
		super.render(model, request, response);
	}
	
}
