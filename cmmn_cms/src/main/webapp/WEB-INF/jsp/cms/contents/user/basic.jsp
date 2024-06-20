<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<body>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" name="title" value="${resultData.title}"/>
<input type="hidden" id="board_code" name="board_code" value="${resultData.boardCode}"/>
	<c:out value="${cFn:escapeXml(resultData.contents)}" escapeXml="false"/>
</form:form>
</body>