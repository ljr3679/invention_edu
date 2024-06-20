<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta name="keywords" content="발명교원육성" />
<meta name="description" content="발명교원육성" />
<meta name="robots" content="all" />
<title>발명교원육성</title>
<link rel="stylesheet" type="text/css" href="/css/url/url.css" />
<script>
	<c:if test="${not empty siteUrl}">
	location.href= '${siteUrl}';
	</c:if>
</script>
</head>
<body>
<c:if test="${empty siteUrl}">
<div class="search_pac">잘못된 단축 URL 입니다.</div>
</c:if>
</body>
</html>