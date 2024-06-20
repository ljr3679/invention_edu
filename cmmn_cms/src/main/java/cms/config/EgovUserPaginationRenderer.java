package cms.config;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class EgovUserPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {
	
	private ServletContext servletContext;
	public void initVariables() {
		firstPageLabel = "<li class=\"arrow\"><a href=\"#\" class=\"page_first l2\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-fast-backward\"></i><span class=\"hide\">처음 페이지로 이동</span></a></li>&#160;";
		previousPageLabel = "<li class=\"arrow\"><a href=\"#\" class=\"page_prev l1\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-step-backward\"></i><span class=\"hide\">이전 10페이지로 이동</span></a></li>&#160;";
		currentPageLabel = "<li><a href=\"#\" class=\"active\">{0}</a></li>&#160;";
		otherPageLabel = "<li><a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a></li>&#160;";
		nextPageLabel = "<li class=\"arrow\"><a href=\"#\" class=\"page_next r1\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-step-forward\"></i><span class=\"hide\">다음 10페이지로 이동</span></a></li>&#160;";
		lastPageLabel = "<li class=\"arrow\"><a href=\"#\" class=\"page_last r2\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-fast-forward\"></i><span class=\"hide\">마지막 페이지로 이동</span></a></li>&#160;";
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
	
}
