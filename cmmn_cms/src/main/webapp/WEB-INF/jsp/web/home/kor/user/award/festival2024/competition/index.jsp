<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->
<head>
<script>
function fn_view(type) {
	$("#tabPos2").val(type);
	$('#cmmnForm').attr('action', '${selfPath}view.do');
	$('#cmmnForm').submit();
}
</script>
</head>
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>

<form:hidden path="tabPos2"/>
		<c:choose>
			<c:when test="${vo.tabPos2 eq '1'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2024/competition/indexTabA.jsp" %>	
			</c:when>
			<c:when test="${vo.tabPos2 eq '2'}">
				<%@ include file="/WEB-INF/jsp/web/home/kor/user/award/festival2024/competition/indexTabB.jsp" %>	
			</c:when>
		</c:choose>
	</form:form>

</body>