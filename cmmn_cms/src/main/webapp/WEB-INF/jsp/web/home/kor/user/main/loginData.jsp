<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<%@ include file="/WEB-INF/jsp/cms/layout/sitemesh/home/kor/include/user/inc_js.jsp" %>
<script>
	$( document ).ready(function() {
		opener.parent.login(); 
		window.close();  
	});
</script>
</head>
<body>
</body>
