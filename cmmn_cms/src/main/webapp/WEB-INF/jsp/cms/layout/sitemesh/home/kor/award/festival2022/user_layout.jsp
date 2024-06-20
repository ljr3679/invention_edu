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
	
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_css.jsp" %>
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_js.jsp" %>
	
	<c:choose>
		<c:when test="${layout_option eq 'main'}">
			<link rel="stylesheet" href="/css/home/kor/user/award/main.css">
			<link rel="stylesheet" href="/css/home/kor/user/award/main_respond.css">
		</c:when>
		<c:otherwise>
			<link rel="stylesheet" href="/css/home/kor/user/award/sub.css">
			<link rel="stylesheet" href="/css/home/kor/user/award/sub_respond.css">
			<link rel="stylesheet" href="/css/home/kor/user/award/board.css">
			<c:if test="${vo.tabPos ne '1'}">
				<link rel="stylesheet" href="/css/home/kor/user/award/festival2022/sub.css">
				<link rel="stylesheet" href="/css/home/kor/user/award/festival2022/sub_respond.css">
				<link rel="stylesheet" href="/css/home/kor/user/award/slick.css">
			</c:if>
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

<script type="text/javascript">
	function fn_tab(tab) {
		$('#pageIndex').remove();
		$("#searchValue3").val("");
		$("#tabPos2").val(tab);
		$('#cmmnForm').attr('action', '${selfPath}index.do');
		$('#cmmnForm').submit();
	}
	
	function fn_back() {
		$("#tabPos2").val("");
		$('#cmmnForm').attr('action', '${selfPath}index.do');
		$('#cmmnForm').submit();
	}
</script>

<!-- wrapper -->
<div class="wrapper">
	<header>
		<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_header.jsp" %>
	</header>
	<c:choose>
		<c:when test="${layout_option eq 'main'}"><div id="real_contents" class="contents"><sitemesh:write property="body" /></div></c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${vo.tabPos eq '1'}">
					<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_sub_top1.jsp" %>	
				</c:when>
				<c:when test="${vo.tabPos eq '2'}">
					<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_sub_top2.jsp" %>	
				</c:when>
				<c:when test="${vo.tabPos eq '3'}">
					<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_sub_top3.jsp" %>	
				</c:when>
				<c:when test="${vo.tabPos eq '4'}">
					<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_sub_top4.jsp" %>	
				</c:when>
				<c:when test="${vo.tabPos eq '5'}">
					<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_sub_top5.jsp" %>	
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${vo.tabPos eq '1'}">
					<div class="menu_box">
						<div class="container">
							<ul class="menu_list">
								<li <c:if test="${vo.tabPos2 eq '1'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('1');"><span class="text">역대대통령상 전시관</span></a></li>
								<li <c:if test="${vo.tabPos2 eq '2'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('2');"><span class="text">우수상격 전시관</span></a></li>
								<li <c:if test="${vo.tabPos2 eq '3'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('3');"><span class="text">동상 및 장려상수상작 전시관</span></a></li>
								<li <c:if test="${vo.tabPos2 eq '4'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('4');"><span class="text">전국교원발명경진대회 수상작 전시관</span></a></li>
							</ul>
							<div class="m_slt_cont">
								<div class="slt_tit">역대대통령상 전시관</div>
								<div class="slt_menu_list">
									<ul class="list">
										<li <c:if test="${vo.tabPos2 eq '1'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('1');"><span class="text">역대대통령상 전시관</span></a></li>
										<li <c:if test="${vo.tabPos2 eq '2'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('2');"><span class="text">우수상격 전시관</span></a></li>
										<li <c:if test="${vo.tabPos2 eq '3'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('3');"><span class="text">동상 및 장려상수상작 전시관</span></a></li>
										<li <c:if test="${vo.tabPos2 eq '4'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('4');"><span class="text">전국교원발명경진대회 수상작 전시관</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:when test="${vo.tabPos eq '4'}">
					<div class="menu_box">
						<div class="container">
							<ul class="menu_list">
								<li <c:if test="${vo.tabPos2 eq '1'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('1');"><span class="text">발명체험교육관 홍보관</span></a></li>
								<li <c:if test="${vo.tabPos2 eq '2'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('2');"><span class="text">YIP(청소년발명프로그램)</span></a></li>
								<li <c:if test="${vo.tabPos2 eq '3'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('3');"><span class="text">발명교육센터 및 찾아가는<br> 발명체험교실 홍보관</span></a></li>
							</ul>
							<div class="m_slt_cont">
								<div class="slt_tit">발명체험교육관 홍보관</div>
								<div class="slt_menu_list">
									<ul class="list">
										<li <c:if test="${vo.tabPos2 eq '1'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('1');"><span class="text">발명체험교육관 홍보관</span></a></li>
										<li <c:if test="${vo.tabPos2 eq '2'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('2');"><span class="text">YIP(청소년발명프로그램)</span></a></li>
										<li <c:if test="${vo.tabPos2 eq '3'}">class="on"</c:if>><a href="javascript:void(0);" onclick="fn_tab('3');"><span class="text">발명교육센터 및 찾아가는<br> 발명체험교실 홍보관</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
			<div class="contents contents_view" style="padding-bottom: 150px">
				<div class="sub_cont">
					<sitemesh:write property="body" />
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	
	<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/award/festival2022/include/user/inc_footer.jsp" %>
	
	<sitemesh:write property="head" />
</div>
<!--// wrapper -->
	<div id="action_loader_mask"></div>
	<img id="action_loader" src="/images/cmmn/action-loader.gif" alt="loading" style="display: none;"/>
	<script type="text/javascript" src="/js/cmmn/common_site.js"></script>
</body>
</html>