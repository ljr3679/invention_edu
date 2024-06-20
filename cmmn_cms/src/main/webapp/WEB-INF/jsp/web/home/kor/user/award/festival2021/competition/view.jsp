<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script>

</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
	<c:choose>
			<c:when test="${vo.tabPos2 eq 'A'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/competition/viewTabA.jsp" %>	
			</c:when>
			<c:when test="${vo.tabPos2 eq 'B'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/competition/viewTabB.jsp" %>	
			</c:when>
			<c:when test="${vo.tabPos2 eq 'C'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/competition/viewTabC.jsp" %>
			</c:when>
			<c:when test="${vo.tabPos2 eq 'D'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2021/competition/viewTabD.jsp" %>
			</c:when>
		</c:choose>
</form:form>
</body>