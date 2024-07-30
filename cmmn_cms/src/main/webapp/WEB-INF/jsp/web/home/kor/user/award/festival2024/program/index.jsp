<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cms/layout/include/cmmn_taglib.jsp" /> <!-- COMMON TAG LIBS -->

<head>
<script type="text/javascript">
function fn_tab_menu(type) {
	$("#tabPos2").val(type);
	$('#cmmnForm').attr('action', '${selfPath}indexTab'+type+'.do');
	$('#cmmnForm').submit();
}
</script>
</head>
<body>
<style>
  table th, table td {
						2024년도 수상작 온라인 전시는 8.7(수) 10시에 시작됩니다!
					
    text-align: center;
    vertical-align: middle;
  }
</style>
<form:form commandName="commonVO" name="cmmnForm" id="cmmnForm" method="post">
<input type="hidden" id="menuPos" name="menuPos" value="${vo.menuPos}">
<form:hidden path="tabPos"/>
<form:hidden path="tabPos2"/>
	<img src="/images/home/kor/user/award/festival2024/program.jpg" alt="" style="width: 100%">
</table>
</form:form>
</body>