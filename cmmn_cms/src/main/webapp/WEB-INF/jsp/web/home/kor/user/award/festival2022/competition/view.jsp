<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>

</script>

	<style>
		.title_box {display: flex;align-items: center;justify-content: center;}
		.title_box:before {content:'';display: inline-block;width:90px;height:110px;background-image: url(/images/home/kor/user/award/festival2022/award_left.png);}
		.title_box:after {content:'';display: inline-block;width:90px;height:110px;background-image: url(/images/home/kor/user/award/festival2022/award_right.png);}
		.title_box .title {display: inline-block;vertical-align: middle;}
		.title_box .title span {display: block;font-size: 22px;}
		.title_box .title span:before {content:'';display: inline-block;vertical-align: middle;margin-right:10px;width:110px;height:6px;background-image: url(/images/home/kor/user/award/festival2022/line_left.png);}
		.title_box .title span:after {content:'';display: inline-block;vertical-align: middle;margin-left:10px;width:110px;height:6px;background-image: url(/images/home/kor/user/award/festival2022/line_right.png);}
		.view_cont .view_btm {margin-top: 0;border-top: 1px solid #ddd;padding-top: 80px;}
		.view_cont .view_top .info_box .info_list .list li {flex:1 1 25%;}
		.text {font-family:'CoreDream' !important;}
		.text li {margin:0px !important;}
		.box .title {background-color:#fff !important;}
	</style>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
	<c:choose>
			<c:when test="${vo.tabPos2 eq 'A'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2022/competition/viewTabA.jsp" %>	
			</c:when>
			<c:when test="${vo.tabPos2 eq 'B'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2022/competition/viewTabB.jsp" %>	
			</c:when>
			<c:when test="${vo.tabPos2 eq 'C'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2022/competition/viewTabC.jsp" %>
			</c:when>
			<c:when test="${vo.tabPos2 eq 'D'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2022/competition/viewTabD.jsp" %>
			</c:when>
			<c:when test="${vo.tabPos2 eq 'E'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2022/competition/viewTabE.jsp" %>
			</c:when>			
		</c:choose>
</form:form>
</body>