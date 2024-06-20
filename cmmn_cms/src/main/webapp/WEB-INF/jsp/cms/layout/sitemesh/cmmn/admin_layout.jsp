<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%> 
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="No-Cache">	
	<title>
		<spring:eval expression="@globals['gbls.site.name']" /> 관리자
		<c:if test="${empty layout_option}">[<c:out value="${admSession.menu.menuTitle}" escapeXml="false"/>]</c:if>
	</title>
	
	<link href="/images/cmmn/favicon.ico" rel="shortcut icon" type="image/x-icon" >   <!-- FAVICON -->
	
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_css.jsp" %>
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_js.jsp" %>
</head>
<body>
<form id="cmmnFileDownForm" name="cmmnFileDownForm" method="post">
<input type="hidden" name="uniqueKey"/>
<input type="hidden" name="filename"/>
<input type="hidden" name="downname"/>
</form>
<form id="cmmnZipFileDownForm" name="cmmnZipFileDownForm" method="post">
	<input type="hidden" name="zipname"/>
	<div class="zipFileArea"></div>
</form>
<form id="adminLoginForm" name="adminLoginForm" method="post"></form>
<form id="adminMenuForm" name="adminMenuForm" method="post">
	<input type="hidden" id="menuPos" name="menuPos" />
</form>
<div id="wrap" class="admin_wrapper">
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_header.jsp" %>
	<c:choose>
		<c:when test="${layout_option eq 'main'}"><sitemesh:write property="body" /></c:when>
		<c:otherwise>
		<!-- admin_contents start -->
		<div class="admin_contents">
			<div id="container">
				
				<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/cmmn/include/admin/inc_left.jsp" %>
				
				<!-- admin_contents_right start -->
				<div class="admin_contents_right">
					<div class="admin_right_top">
						<h3 class="admin_rt_tit">
							<c:out value="${admSession.menu.menuTitle}" escapeXml="false"/>
						</h3>
						<ul class="breadcrumb">
							<li><img src="/images/cmmn/admin/bread_home.png" alt="HOME"></li>
							<c:forEach begin="0" end="${admSession.topMenuCnt-1}" step="1" varStatus="status">
								<li><c:out value="${admSession.topMenuList[admSession.topMenuCnt-status.count].menuTitle}" escapeXml="false"/></li>
							</c:forEach>
						</ul>
					</div>
					<div class="sub-con">
						<sitemesh:write property="body" />
					</div>
				</div>
				<!-- admin_contents_right end -->
			</div>
		</div>
		<!-- // admin_contents end -->
		</c:otherwise>
	</c:choose>
</div>
<sitemesh:write property="head" />

<div id="action_loader_mask"></div>
<img id="action_loader" src="/images/cmmn/action-loader.gif" alt="loading" style="display: none;"/>
<script type="text/javascript" src="/js/cmmn/common_site.js"></script>

<div id="thumbnail_layer" class="layer-wrap">
	<div class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<h1 id="thumbnail_layer_title" class="pop-layer-title"></h1>
				<div style="width: 500px; height: 300px;">
					<div id="thumbnail_layer_img" style="width: 300px; height: 300px; display: inline-block; text-align: center;">
						<img src="" style="width: 100%; height: 100%;"/>
					</div>
				</div>
				<div class="btn-r">
					<a href="javascript:void(0);" onClick="fn_layer_close();" class="btn-layerClose">닫기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>