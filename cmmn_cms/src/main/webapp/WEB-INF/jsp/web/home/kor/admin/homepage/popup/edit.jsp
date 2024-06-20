<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_move_tab(type) {
		$("#tabPos").val(type);
		$("#idx").val('');
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}
</script>
</head>
<body>

<div class="tab mb_20">
	<ul>
		<li <c:if test="${vo.tabPos eq 'A'}">class=on</c:if>><a  href="javascript:void(0);" class="tabOption" onclick="fn_move_tab('A');">고정영역 1</a></li>
		<li <c:if test="${vo.tabPos eq 'B'}">class=on</c:if>><a href="javascript:void(0);" class="tabOption" onclick="fn_move_tab('B');">고정영역 2</a></li>
		<li <c:if test="${vo.tabPos eq 'C'}">class=on</c:if>><a href="javascript:void(0);" class="tabOption" onclick="fn_move_tab('C');">롤링영역</a></li>
	</ul>
</div>

<c:choose>
	<c:when test="${vo.tabPos eq 'A'}">
		<%@ include file="/WEB-INF/jsp/web/home/kor/admin/homepage/popup/editTabA.jsp" %>
	</c:when>
	<c:when test="${vo.tabPos eq 'B'}">
		<%@ include file="/WEB-INF/jsp/web/home/kor/admin/homepage/popup/editTabB.jsp" %>
	</c:when>
	<c:when test="${vo.tabPos eq 'C'}">
		<%@ include file="/WEB-INF/jsp/web/home/kor/admin/homepage/popup/editTabC.jsp" %>
	</c:when>
</c:choose>

</body>