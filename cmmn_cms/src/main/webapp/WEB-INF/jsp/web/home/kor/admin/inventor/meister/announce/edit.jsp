<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp"/> <!-- COMMON TAG LIBS -->
<!-- header -->
<head>
<script type="text/javascript">
	function fn_move_tab(type) {
		$("#tabPos").val(type);
		$('#cmmnForm').attr('action', "${vo.selfPath}edit.do");
		$('#cmmnForm').submit();
	}
	function fn_download() {
		if(fn_validation_check($('#excelDownForm'))) {
			fn_layer_close();
			$('#excelDownForm').unbind();
			$('#excelDownForm').attr('action', "${vo.selfPath}excelDownload.do");
			$('#excelDownForm').submit();
		}
	}
</script>
</head>
<body>

<c:if test="${vo.act eq 'modify'}">
	<div class="tab mb_20">
		<ul>
			<li <c:if test="${vo.tabPos eq 'A'}">class=on</c:if>><a  href="javascript:void(0);" class="tabOption" onclick="fn_move_tab('A');">대회 정보</a></li>
			<li <c:if test="${vo.tabPos eq 'B'}">class=on</c:if>><a href="javascript:void(0);" class="tabOption" onclick="fn_move_tab('B');">접수현황</a></li>
		</ul>
	</div>
</c:if>

<c:choose>
	<c:when test="${vo.tabPos eq 'A'}">
		<%@ include file="/WEB-INF/jsp/web/home/kor/admin/inventor/meister/announce/editTabA.jsp" %>
	</c:when>
	<c:when test="${vo.tabPos eq 'B'}">
		<%@ include file="/WEB-INF/jsp/web/home/kor/admin/inventor/meister/announce/editTabB.jsp" %>
	</c:when>
</c:choose>

</body>