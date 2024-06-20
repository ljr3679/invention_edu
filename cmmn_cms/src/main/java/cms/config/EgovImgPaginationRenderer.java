package cms.config;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class EgovImgPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {
	
	private ServletContext servletContext;
	public void initVariables() {
		firstPageLabel = "<a href=\"#\" class=\"page_arrow l2\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-fast-backward\"></i><span class=\"hide\">처음 페이지로 이동</span></a>&#160;";
		previousPageLabel = "<a href=\"#\" class=\"page_arrow l1\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-step-backward\"></i><span class=\"hide\">이전 10페이지로 이동</span></a>&#160;";
		currentPageLabel = "<a href=\"#\" class=\"active\">{0}</a>&#160;";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
		nextPageLabel = "<a href=\"#\" class=\"page_arrow r1\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-step-forward\"></i><span class=\"hide\">다음 10페이지로 이동</span></a>&#160;";
		lastPageLabel = "<a href=\"#\" class=\"page_arrow r2\" onclick=\"{0}({1}); return false;\">" + "<i class=\"xi-fast-forward\"></i><span class=\"hide\">마지막 페이지로 이동</span></a>&#160;";
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
	
}
