<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="author" content="<spring:eval expression="@globals['gbls.site.name']" />">
	<meta name="description" content="발명교육 활성화를 위한 발명교육포털사이트">
	<meta name="keywords" content="한국발명진흥회, 발명교육, 발명, 교육, 학생발명전시회, 학생창의력 챔피언대회, YIP, 청소년발명가 프로그램, IP Meister Program, 발명교육대상, 전국교원 발명 연구대회, 차세대 영재 기업인 선발, 발명 영재 교육 연구원, 발명교사 교육센터, ">
    <meta property="og:title" content="<spring:eval expression="@globals['gbls.site.name']" />">
    <meta property="og:description" content="<spring:eval expression="@globals['gbls.site.name']" />">
    <meta property="og:image" content="/images/home/kor/user/common/head_logo.png">
    <meta property="og:url" content="url">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="No-Cache">
	<title><spring:eval expression="@globals['gbls.site.name']" /><c:if test="${empty layout_option}"> [<c:out value="${menuSession.menu.menuTitle}" escapeXml="false"/>]</c:if></title>
    
	<link href="/images/cmmn/favicon.ico" rel="shortcut icon" type="image/x-icon" >   <!-- FAVICON -->
	
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_css.jsp" %>
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_js.jsp" %>
	
	<c:choose>
		<c:when test="${layout_option eq 'main'}">
			<link rel="stylesheet" href="/css/home/kor/user/main.css" type="text/css">
    		<link rel="stylesheet" href="/css/home/kor/user/main_respond.css" type="text/css">
    		
    		<script type="text/javascript" src="/js/home/kor/user/main.js"></script>
		</c:when>
		<c:otherwise>
			<link rel="stylesheet" href="/css/home/kor/user/sub.css" type="text/css">
			<link rel="stylesheet" href="/css/home/kor/user/sub_respond.css" type="text/css">
			
			<script type="text/javascript" src="/js/home/kor/user/sub.js"></script>
		</c:otherwise>
	</c:choose>
</head>
<body>
<form id="cmmnFileDownForm" name="cmmnFileDownForm" method="post">
<input type="hidden" name="uniqueKey"/>
<input type="hidden" name="filename"/>
<input type="hidden" name="downname"/>
</form>
<form id="userMenuForm" name="userMenuForm" method="get">
	<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}"/>
</form>
<!-- wrapper -->
<div class="wrapper">
	<header>
		<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_header.jsp" %>
	</header>
	<c:choose>
		<c:when test="${layout_option eq 'main'}"><div id="real_contents" class="contents"><sitemesh:write property="body" /></div></c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_sub_top.jsp" %>
			<div id="real_contents" class="contents">
				<div class="container">
					<div class="sub_cont">
<%-- 					    <div class="main_title"><c:out value="${menuSession.menu.menuTitle}" escapeXml="false"/></div> --%>
					    <h2 class="main_title">
							<c:out value="${menuTree[menuSession.topMenuList[menuSession.topMenuCnt-2].menuPos].menuTitle}" escapeXml="false"/>
							<div class="sub_menu">
								<span><c:out value="${menuSession.menu.menuTitle}" escapeXml="false"/></span>
							</div>
						</h2>
					    
						<sitemesh:write property="body" />
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_footer.jsp" %>
	
	<sitemesh:write property="head" />
</div>
<!--// wrapper -->
	<div id="action_loader_mask"></div>
	<img id="action_loader" src="/images/cmmn/action-loader.gif" alt="loading" style="display: none;"/>
	<script type="text/javascript" src="/js/cmmn/common_site.js"></script>
</body>
</html>